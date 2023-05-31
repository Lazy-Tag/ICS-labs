/*
Filesystem Lab disigned and implemented by Liang Junkai,RUC
*/

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <fuse.h>
#include <errno.h>
#include "disk.h"

#define DIRMODE S_IFDIR|0755
#define REGMODE S_IFREG|0644

#define FILE_NODE 32768
#define SUPER_BLOCK_START 0
#define INODE_BITMAP_START 1
#define DATA_BITMAP_1_START 2
#define DATA_BITMAP_2_START 3
#define INODE_START 4

#define SIZE_OF_INODE (sizeof(INode))
#define SIZE_OF_PAIR (sizeof(Pair))
#define INODE_PER_BLOCK ((BLOCK_SIZE / SIZE_OF_INODE))
#define DIC_PER_BLOCK ((BLOCK_SIZE / SIZE_OF_PAIR))
#define DATA_BLOCK_START (FILE_NODE / INODE_PER_BLOCK + 5)

#define DIRECT_POINTER 12
#define BIT_PER_INT 32
#define MAX_POINTER_PER_BLOCK 1023
#define BITMAP_SIZE 1024
#define MAX_FILE_NAME 31
#define ROOT_NODE 0

typedef struct SuperBlock {
    unsigned long blockSize; // block size的大小
    fsblkcnt_t blockNum; // block size 的数量
    fsblkcnt_t blockFree; // 空闲的block数量
    fsblkcnt_t fileNode; // 文件节点额数量
    fsblkcnt_t freeNode; // 空闲节点的数量
    unsigned long fileName; // 文件名长度上限
}SuperBlock;

typedef int Bitmap[BITMAP_SIZE];

typedef struct INode {
    mode_t mode;
    off_t size;
    time_t accessTime;
    time_t modifyTime;
    time_t changeTime;
    int blockNum;
    int blocks[DIRECT_POINTER];
    int indirectPointer[2];
}INode;

typedef struct Pair {
    int node;
    char fileName[MAX_FILE_NAME];
}Pair;

typedef struct Directory {
    int size;
    Pair pairList[DIC_PER_BLOCK];
}Directory;

// 读SuperBlock的值
SuperBlock readSuperBlock() {
    char superBlock[BLOCK_SIZE + 1];
    disk_read(SUPER_BLOCK_START, superBlock);
    return *(SuperBlock*) superBlock;
}

// 写SuperBlock的值
void writeSuperBlock(SuperBlock superBlock) {
    char* t = (char*)(&superBlock);
    char tmp[BLOCK_SIZE + 1];
    memcpy(tmp, t, BLOCK_SIZE);
    disk_write(SUPER_BLOCK_START, tmp);
}

// 找到空闲的iNode
int findFree(int start) {
    Bitmap bitmap;
    disk_read(start, bitmap);
    int i;
    for (i = 0; i < BITMAP_SIZE; i ++ ) {
        int num = bitmap[i], j;
        for (j = 0; j < BIT_PER_INT; j ++ ) {
            if (!(num >> j & 1)) {
                bitmap[i] |= 1 << j;
                disk_write(start, bitmap);
                int res = i * BIT_PER_INT + j;
                SuperBlock superBlock = readSuperBlock();
                if (start == INODE_BITMAP_START)
                    superBlock.freeNode -- ;
                else
                    superBlock.blockFree -- ;
                writeSuperBlock(superBlock);
                return res;
            }
        }
    }
    return -1;
}

// 找到一个空闲块
int findFreeBlock() {
    int newNode = findFree(DATA_BITMAP_1_START);
    if (newNode == -1)
        newNode = findFree(DATA_BITMAP_2_START);
    return newNode;
}

// 将第num个block以目录形式读出
void readDirectory(int num, Directory* dir) {
    char tmp[BLOCK_SIZE + 1];
    disk_read(DATA_BLOCK_START + num, tmp);
    memcpy(dir,  tmp, BLOCK_SIZE);
}

// 通过编号获取INode
INode getINodeByNum(int num) {
    int blockNum = num / INODE_PER_BLOCK;
    int offset = num % INODE_PER_BLOCK;
    char tmp[BLOCK_SIZE + 1];
    disk_read(INODE_START + blockNum, tmp);
    INode* INodeList = (INode*) tmp;
    return INodeList[offset];
}

// 初始化indirect指针
int initIndirect(INode* iNode, int t) {
    if (iNode->indirectPointer[t] == -1) {
        int num = findFreeBlock();
        iNode->indirectPointer[t] = num;
        if (num == -1) return -1;
        char data[BLOCK_SIZE + 1];
        disk_read(DATA_BLOCK_START + num, data);
        memset(data, 0, sizeof(data));
        disk_write(DATA_BLOCK_START + num, data);
    }
    return 0;
}

// 从iNode中读取出第t个indirect指针
void readIndirect(INode iNode, int* data, int t) {
    int indirect = iNode.indirectPointer[t];
    initIndirect(&iNode, t);
    char tmp[BLOCK_SIZE + 1];
    disk_read(DATA_BLOCK_START + indirect, tmp);
    memcpy(data, tmp, BLOCK_SIZE);
}

// 通过文件名获取iNode
int getINodeByName(int fatherNum, const char* name) {
    if (fatherNum == -1) return -1;
    INode fatherNode = getINodeByNum(fatherNum);
    int i, j;
    for (i = 0; i < fatherNode.blockNum; i ++ ) {
        int dataNum = fatherNode.blocks[i];
        char data[BLOCK_SIZE + 1];
        Directory* dir = (Directory*) data;
        readDirectory(dataNum, dir);
        int len = dir->size, j;
        for (j = 0; j < len; j ++ ) {
            Pair p = dir->pairList[j];
            if (!strcmp(p.fileName, name))
                return p.node;
        }
    }

    for (i = 0; i < 2; i ++ ) {
        int pointers[BLOCK_SIZE + 1];
        readIndirect(fatherNode, pointers, i);
        for (j = 1; j <= pointers[0]; j ++ ) {
            int dataNum = pointers[j];
            char data[BLOCK_SIZE + 1];
            Directory* dir = (Directory*) data;
            readDirectory(dataNum, dir);
            int len = dir->size, j;
            for (j = 0; j < len; j ++ ) {
                Pair p = dir->pairList[j];
                if (!strcmp(p.fileName, name))
                    return p.node;
            }
        }
    }
    return -1;
}

// 从bitmap中删除data
void removeData(int num) {
    int start = num / (BIT_PER_INT * BITMAP_SIZE) + DATA_BITMAP_1_START;
    num %= (BIT_PER_INT * BITMAP_SIZE);
    int blockNum = num / BIT_PER_INT;
    int offset = num % BIT_PER_INT;
    char tmp[BLOCK_SIZE + 1];
    disk_read(start, tmp);
    int* bitmap = (int*) tmp;
    bitmap[blockNum] &= ~(1 << offset);
    disk_write(INODE_BITMAP_START, bitmap);

    SuperBlock superBlock = readSuperBlock();
    superBlock.blockFree ++ ;
    writeSuperBlock(superBlock);
}

// 从bitmap中删除iNode
void removeINode(INode iNode, int num) {
    int i;
    for (i = 0; i < iNode.blockNum; i ++ ) {
        int node = iNode.blocks[i];
        removeData(node);
    }

    for (i = 0; i < 2; i ++ ) {
        int indirect = iNode.indirectPointer[i];
        if (indirect == -1) continue;
        int pointers[BLOCK_SIZE];
        readIndirect(iNode, pointers, i);
        int size = pointers[0], j;
        for (j = 1; j <= size; j ++ )
            removeData(pointers[j]);
    }

    int blockNum = num / BIT_PER_INT;
    int offset = num % BIT_PER_INT;
    char tmp[BLOCK_SIZE + 1];
    disk_read(INODE_BITMAP_START, tmp);
    int* bitmap = (int*) tmp;
    bitmap[blockNum] &= ~(1 << offset);
    disk_write(INODE_BITMAP_START, bitmap);

    SuperBlock superBlock = readSuperBlock();
    superBlock.freeNode ++ ;
    writeSuperBlock(superBlock);
}

// 写iNode
void writeINode(int node, INode iNode) {
    int blockNum = node / INODE_PER_BLOCK;
    int iNodeOffset = node % INODE_PER_BLOCK;
    char tmp[BLOCK_SIZE + 1];
    disk_read(INODE_START + blockNum, tmp);
    INode *iNodeList = (INode*)tmp;
    iNodeList[iNodeOffset] = iNode;
    disk_write(INODE_START + blockNum, iNodeList);
}

// 通过路径获取iNode的编号
int getNumByPath(const char* origin) {
    int father, now = ROOT_NODE;
    char path[BLOCK_SIZE + 1];
    strcpy(path, origin);
    char* token = strtok((char*) path, "/");

    while (token) {
        father = now;
        now = getINodeByName(father, token);
        token = strtok(NULL, "/");
    }
    return now;
}

// 通过路径获取文件名
void getNameByPath(const char* origin, char* name) {
    char path[BLOCK_SIZE + 1];
    strcpy(path, origin);
    char* token = strtok(path, "/");

    while (token) {
        strcpy(name, token);
        token = strtok(NULL, "/");
    }
}

// 通过路径得到父节点的路径
int getFatherNumByPath(const char *origin) {
    char path[BLOCK_SIZE + 1];
    char father[BLOCK_SIZE + 1] = "\0";
    strcpy(path, origin);
    char* token = strtok(path, "/");

    while (token) {
        char last[MAX_FILE_NAME];
        strcpy(last, token);
        token = strtok(NULL, "/");

        if (token) {
            strcat(father, "/");
            strcat(father,  last);
        }
    }

    int num = getNumByPath(father);
    return num;
}

// 将文件插入块中
int addFile2Block(Pair pair, int dataNum) {
    char data[BLOCK_SIZE + 1];
    Directory* dir = (Directory*) data;
    readDirectory(dataNum, dir);
    int len = dir->size;
    if (len < DIC_PER_BLOCK) {
        dir->size ++;
        dir->pairList[len].node = pair.node;
        strcpy(dir->pairList[len].fileName, pair.fileName);
        disk_write(DATA_BLOCK_START + dataNum, dir);
        return 0;
    }
    return -1;
}

// 将文件插入indirect指针中
int addFile2Indirect(Pair pair, INode iNode, int t) {
    int pointers[BLOCK_SIZE + 1];
    readIndirect(iNode, pointers, t);
    if (pointers[0] && addFile2Block(pair, pointers[pointers[0]]) == 0)
        return 0;

    if (pointers[0] == 1023) return -1;
    pointers[0] ++ ;
    if ((pointers[pointers[0]] = findFreeBlock()) == -1)
        return -1;
    if (addFile2Block(pair, pointers[pointers[0]]) == 0) {
        disk_write(DATA_BLOCK_START + iNode.indirectPointer[t], pointers);
        return 0;
    }
    return -1;
}

// 将文件信息加入目录文件中
int addFile2Dir(Pair pair, int num) {
    printf("called addFile2Dir:%d %s\n", num, pair.fileName);
    INode father = getINodeByNum(num);
    father.modifyTime = father.changeTime = time(NULL);
    if (!father.blockNum) {
        father.blockNum = 1;
        father.blocks[0] = findFreeBlock();
        writeINode(num, father);
    }
    if (father.blockNum < 12) {
        int dataNum = father.blocks[father.blockNum - 1];
        if (addFile2Block(pair, dataNum) == 0) return 0;
        else if (father.blockNum + 1 < 12) {
            father.blockNum ++ ;
            dataNum = father.blocks[father.blockNum - 1] = findFreeBlock();
            writeINode(num, father);
            return addFile2Block(pair, dataNum);
        }
    }

    if (initIndirect(&father, 1) == -1)
        return -1;

    if (addFile2Indirect(pair, father, 0) == 0)
        return 0;

    if (initIndirect(&father, 1) == -1)
        return -1;

    return addFile2Indirect(pair, father, 1);
}

// 在indirect指针中改变大小
int truncateIndirect(INode* iNode, off_t size) {
    int blockNum = (size - 1) / BLOCK_SIZE + 1, i;
    int cur = iNode->blockNum;
    if (cur < 12) {
        int i;
        for (i = blockNum; i < 12; i ++ ) {
            if ((iNode->blocks[i] = findFreeBlock()) == -1)
                return -1;
        }
    }
    iNode->blockNum = 12;
    blockNum -= 12;
    int data[BLOCK_SIZE + 1];
    initIndirect(iNode, 0);
    readIndirect(*iNode, data, 0);
    if (data[0] <= 1023) {
        if (data[0] >= blockNum) {
            data[0] = blockNum;
            disk_write(DATA_BLOCK_START + iNode->indirectPointer[0], data);
            return 0;
        }
        for (i = data[0] + 1; i <= blockNum; i ++ )
            if ((data[i] = findFreeBlock()) == -1)
                return -1;

        data[0] = blockNum;
        disk_write(DATA_BLOCK_START + iNode->indirectPointer[0], data);
        return 0;
    }
    for (i = data[0] + 1; i <= 1023; i ++ )
        if ((iNode->blocks[i] = findFreeBlock()) == -1)
            return -1;
    data[0] = 1023;
    disk_write(DATA_BLOCK_START + iNode->indirectPointer[0], data);

    blockNum -= 1023;
    if (blockNum >= 1023) return -1;
    initIndirect(iNode, 0);
    readIndirect(*iNode, data, 1);
    if (data[0] >= blockNum) {
        data[0] = blockNum;
        disk_write(DATA_BLOCK_START + iNode->indirectPointer[0], data);
        return 0;
    }
    for (i = data[0] + 1; i <= blockNum; i ++ )
        if ((data[i] = findFreeBlock()) == -1)
            return -1;

    data[0] = blockNum;
    printf("%d\n", iNode->indirectPointer[1]);
    disk_write(DATA_BLOCK_START + iNode->indirectPointer[1], data);
    return 0;
}

// 在目录中删除文件
int removeFileinDir(Directory* dir, const char* name) {
    int fileNum = dir->size, j;
    for (j = 0; j < fileNum; j ++ ) {
        if (!strcmp(dir->pairList[j].fileName, name)) {
            dir->size--;
            for (j = j + 1; j < fileNum; j++) {
                strcpy(dir->pairList[j - 1].fileName, dir->pairList[j].fileName);
                dir->pairList[j - 1].node = dir->pairList[j].node;
            }
            return 0;
        }
    }
    return -1;
}

// 在父节点中删除文件
int removeFile(const char* name, int father) {
    INode iNode = getINodeByNum(father);
    iNode.changeTime = iNode.modifyTime = time(NULL);
    if (iNode.mode == (REGMODE)) return -1;
    int blockNum = iNode.blockNum;
    for (int i = 0; i < blockNum; i ++ ) {
        int node = iNode.blocks[i];
        char tmp[BLOCK_SIZE + 1];
        Directory* dir = (Directory*) tmp;
        readDirectory(node, dir);
        if (!removeFileinDir(dir, name)){
            disk_write(DATA_BLOCK_START + node, dir);
            if (!dir->size)
                removeData(node);
            return 0;
        }
    }
    int data[BLOCK_SIZE + 1];
    int i, j;
    for (i = 0; i < 2; i ++ ) {
        readIndirect(iNode, data, i);
        for (j = 1; j <= data[i]; j ++ ) {
            int node = data[j];
            char tmp[BLOCK_SIZE + 1];
            Directory* dir = (Directory*) tmp;
            readDirectory(node, dir);
            if (!removeFileinDir(dir, name)) {
                disk_write(DATA_BLOCK_START + node, dir);
                if (!dir->size)
                    removeData(node);
                return 0;
            }
        }
    }

    return -1;
}

// 读文件开头块
int readStartBlock(INode iNode, char* buffer, int startNode, int startOffset) {
    char startBlock[BLOCK_SIZE + 1];
    disk_read(DATA_BLOCK_START + startNode, startBlock);
    startBlock[BLOCK_SIZE] = '\0';
    memcpy(buffer, startBlock + startOffset, BLOCK_SIZE - startOffset);
    return BLOCK_SIZE - startOffset;
}

// 读文件结尾块
int readEndBlock(INode iNode, char* buffer, int endNode, int offset, int endOffset) {
    char endBlock[BLOCK_SIZE + 1];
    disk_read(DATA_BLOCK_START + endNode, endBlock);
    memcpy(buffer + offset, endBlock, endOffset);
    return endOffset;
}

// 写文件
int writeBlock(INode iNode, const char* buffer, int node, off_t off, int size) {
    char block[BLOCK_SIZE + 1];
    disk_read(DATA_BLOCK_START + node, block);
    memcpy(block + off, buffer, size);
    block[off + size] = '\0';
    disk_write(DATA_BLOCK_START + node, block);
    return size;
}

//Format the virtual block device in the following function
int mkfs()
{
    SuperBlock superBlock;
    superBlock.blockSize = BLOCK_SIZE;
    superBlock.blockNum = BLOCK_NUM;
    superBlock.blockFree = BLOCK_NUM - 4;
    superBlock.fileNode = FILE_NODE;
    superBlock.fileName = MAX_FILE_NAME;
    writeSuperBlock(superBlock);

    Bitmap dataBitmap1, dataBitmap2, iNodeBitmap;
    memset(dataBitmap1, 0, sizeof(dataBitmap1));
    memset(dataBitmap2, 0, sizeof(dataBitmap2));
    memset(iNodeBitmap, 0, sizeof(iNodeBitmap));

    disk_write(INODE_BITMAP_START, iNodeBitmap);
    disk_write(DATA_BITMAP_1_START, dataBitmap1);
    disk_write(DATA_BITMAP_2_START, dataBitmap2);

    INode mnt;
    int node = findFree(INODE_BITMAP_START);
    mnt.mode = DIRMODE;
    mnt.changeTime = time(NULL);
    mnt.accessTime = time(NULL);
    mnt.modifyTime = time(NULL);
    mnt.indirectPointer[0] = mnt.indirectPointer[1] = -1;
    mnt.blockNum = 0;
    mnt.size = 0;
    writeINode(node, mnt);

	return 0;
}

//Filesystem operations that you need to implement
int fs_getattr (const char *path, struct stat *attr)
{
	printf("Getattr is called:%s\n",path);
    int num = getNumByPath(path);
    if (num == -1)
        return -ENOENT;

    INode iNode = getINodeByNum(num);
    attr->st_mode = iNode.mode;
	attr->st_nlink = 1;
	attr->st_uid = getuid();
	attr->st_gid = getgid();
	attr->st_size = iNode.size;
	attr->st_atime = iNode.accessTime;
	attr->st_mtime = iNode.modifyTime;
	attr->st_ctime = iNode.changeTime;
	return 0;
}

int fs_readdir(const char *path, void *buffer, fuse_fill_dir_t filler, off_t offset, struct fuse_file_info *fi)
{
	printf("Readdir is called:%s\n", path);
    int num = getNumByPath(path), i, j;
    INode iNode = getINodeByNum(num);
    iNode.accessTime = time(NULL);
    writeINode(num, iNode);
    for (i = 0; i < iNode.blockNum; i ++ ) {
        int blockNum = iNode.blocks[i];
        char tmp[BLOCK_SIZE + 1];
        Directory* dir = (Directory*) tmp;
        readDirectory(blockNum, dir);
        int len = dir->size, j;
        for (j = 0; j < len; j ++ )
            filler(buffer, dir->pairList[j].fileName, NULL, 0);
    }
    int data[BLOCK_SIZE + 1];
    for (i = 0; i < 2; i ++ ) {
        readIndirect(iNode, data, i);
        for (j = 1; j <= data[0]; j ++ ) {
            int node = data[j];
            char tmp[BLOCK_SIZE + 1];
            Directory* dir = (Directory*) tmp;
            readDirectory(node, dir);
            int len = dir->size, k;
            for (k = 0; k < len; k ++ )
                filler(buffer, dir->pairList[k].fileName, NULL, 0);
        }
    }

	return 0;
}

int fs_read(const char *path, char *buffer, size_t size, off_t offset, struct fuse_file_info *fi)
{
    printf("Read is called:%s\n", path);
    int num = getNumByPath(path), res = 0, i;
    INode iNode = getINodeByNum(num);
    iNode.accessTime = time(NULL);

    int blockStart = offset / BLOCK_SIZE;
    int blockEnd = (size + offset) / BLOCK_SIZE;
    int startOffset = offset % BLOCK_SIZE, endOffset = (size + offset) % BLOCK_SIZE;
    if (offset >= iNode.size)
        return 0;
    if (blockStart < DIRECT_POINTER && blockEnd < DIRECT_POINTER) {
        if (blockStart == blockEnd) {
            int node = iNode.blocks[blockEnd];
            char data[BLOCK_SIZE + 1];
            disk_read(DATA_BLOCK_START + node, data);
            memcpy(buffer, data + startOffset, size);
            return (int) size;
        }
        res += readStartBlock(iNode, buffer, iNode.blocks[blockStart], startOffset);
        for (i = blockStart + 1; i < blockEnd; i ++ ) {
            int node = iNode.blocks[i];
            char data[BLOCK_SIZE + 1];
            disk_read(DATA_BLOCK_START + node, data);
            memcpy(buffer + res, data, BLOCK_SIZE);
            res += BLOCK_SIZE;
        }
        if (blockEnd < iNode.blockNum)
            res += readEndBlock(iNode, buffer, iNode.blocks[blockEnd], res, endOffset);
    } else if (blockStart < DIRECT_POINTER && blockEnd >= DIRECT_POINTER) {
        res += readStartBlock(iNode, buffer, iNode.blocks[blockStart], startOffset);
        for (i = blockStart + 1; i < iNode.blockNum; i ++ ) {
            int node = iNode.blocks[i];
            char data[BLOCK_SIZE + 1];
            disk_read(DATA_BLOCK_START + node, data);
            memcpy(buffer + res, data, BLOCK_SIZE);
            res += BLOCK_SIZE;
        }
        blockEnd -= (DIRECT_POINTER - 1);
        for (i = 0; i < 2; i ++ ) {
            int pointers[BLOCK_SIZE + 1], j;
            readIndirect(iNode, pointers, i);
            for (j = 1; j < blockEnd; j ++ ) {
                if (j > pointers[0])
                    return res;
                int node = pointers[j];
                char data[BLOCK_SIZE + 1];
                disk_read(DATA_BLOCK_START + node, data);
                memcpy(buffer + res, data, BLOCK_SIZE);
                res += BLOCK_SIZE;
            }
            if (blockEnd <= pointers[0])
                res += readEndBlock(iNode, buffer, pointers[blockEnd], res, endOffset);
            if (blockEnd <= MAX_POINTER_PER_BLOCK) return res;
            blockEnd -= MAX_POINTER_PER_BLOCK;
        }
    } else {
        blockStart -= (DIRECT_POINTER - 1), blockEnd -= (DIRECT_POINTER - 1);
        for (i = 0; i < 2; i ++ ) {
            int pointers[BLOCK_SIZE + 1], j;
            readIndirect(iNode, pointers, i);
            if (blockStart > MAX_POINTER_PER_BLOCK) {
                blockStart -= MAX_POINTER_PER_BLOCK;
                blockEnd -= MAX_POINTER_PER_BLOCK;
                continue;
            }
            res += readStartBlock(iNode, buffer, pointers[blockStart], startOffset);
            for (j = blockStart + 1; j < blockEnd; j ++ ) {
                if (j > pointers[0])
                    break;
                int node = pointers[j];
                char data[BLOCK_SIZE + 1];
                disk_read(DATA_BLOCK_START + node, data);
                memcpy(buffer + res, data, sizeof(data));
                res += BLOCK_SIZE;
            }
            if (blockEnd <= pointers[0]) {
                res += readEndBlock(iNode, buffer, pointers[blockEnd], res, endOffset);
                return res;
            }
            blockEnd -= MAX_POINTER_PER_BLOCK;
            blockStart = 1, startOffset = 0;
        }
    }
    return res;
}

int fs_mknod (const char *path, mode_t mode, dev_t dev)
{
	printf("Mknod is called:%s\n",path);
    int num = findFree(INODE_BITMAP_START);
    if (num == -1)
        return -ENOSPC;
    INode iNode;
    iNode.mode = REGMODE;
    iNode.size = 0;
    iNode.blockNum = 0;
    iNode.accessTime = time(NULL);
    iNode.changeTime = time(NULL);
    iNode.modifyTime = time(NULL);
    iNode.indirectPointer[0] = iNode.indirectPointer[1] = -1;
    writeINode(num, iNode);

    Pair pair;
    pair.node = num;
    char name[MAX_FILE_NAME];
    getNameByPath(path, name);
    strcpy(pair.fileName, name);

    int fatherNum = getFatherNumByPath(path);

    if (fatherNum == -1 || addFile2Dir(pair, fatherNum) == -1)
        return -ENOSPC;
	return 0;
}

int fs_mkdir (const char *path, mode_t mode)
{
	printf("Mkdir is called:%s\n",path);
    int num = findFree(INODE_BITMAP_START);
    if (num == -1)
        return -ENOSPC;
    INode dirINode;
    dirINode.mode = DIRMODE;
    dirINode.size = 0;
    dirINode.blockNum = 0;
    dirINode.accessTime = time(NULL);
    dirINode.changeTime = time(NULL);
    dirINode.modifyTime = time(NULL);
    dirINode.indirectPointer[0] = dirINode.indirectPointer[1] = -1;

    writeINode(num, dirINode);

    Pair pair;
    pair.node = num;
    char name[MAX_FILE_NAME];
    getNameByPath(path, name);
    strcpy(pair.fileName, name);

    int fatherNum = getFatherNumByPath(path);

    if (fatherNum == -1 || addFile2Dir(pair, fatherNum) == -1)
        return -ENOSPC;

	return 0;
}

int fs_rmdir (const char *path)
{
	printf("Rmdir is called:%s\n",path);
    char name[MAX_FILE_NAME];
    getNameByPath(path, name);
    int num = getNumByPath(path);
    INode iNode = getINodeByNum(num);
    removeINode(iNode, num);

    int fatherNum = getFatherNumByPath(path);
    if (fatherNum == -1 || removeFile(name, fatherNum) == -1)
        return -ENOSPC;
	return 0;
}

int fs_unlink (const char *path)
{
	printf("Unlink is callded:%s\n",path);
    char name[MAX_FILE_NAME];
    getNameByPath(path, name);
    int num = getNumByPath(path);
    INode iNode = getINodeByNum(num);
    removeINode(iNode, num);

    int fatherNum = getFatherNumByPath(path);
    if (fatherNum == -1 || removeFile(name, fatherNum) == -1)
        return -ENOSPC;
	return 0;
}

int fs_rename (const char *oldpath, const char *newpath)
{
	char name[MAX_FILE_NAME];
    getNameByPath(oldpath, name);
    int num = getNumByPath(oldpath);

    int fatherNum = getFatherNumByPath(oldpath);
    if (fatherNum == -1 || removeFile(name, fatherNum) == -1)
        return -ENOSPC;
    int newFatherNum = getFatherNumByPath(newpath);
    getNameByPath(newpath, name);
    Pair pair;
    pair.node = num;
    strcpy(pair.fileName, name);
    if (newFatherNum == -1 || addFile2Dir(pair, newFatherNum) == -1)
        return -ENOSPC;

    return 0;
}

int fs_truncate (const char *path, off_t size)
{
    printf("Truncate is called:%s\n", path);
    int num = getNumByPath(path);
    INode iNode = getINodeByNum(num);
    int nums = iNode.blockNum;
    int need = ((size - 1) / BLOCK_SIZE) + 1;
    if (need > 12) {
        if (truncateIndirect(&iNode, size) == -1)
            return -ENOSPC;
    } else if (need > nums) {
        int i, cur = nums;
        iNode.blockNum = need;
        for (i = cur; i < need; i ++ ) {
            iNode.blocks[i] = findFreeBlock();
            if (iNode.blocks[i] == -1)
                return -ENOSPC;
        }
    } else {
        iNode.blockNum = need;
    }
    iNode.size = size;
    writeINode(num, iNode);
	return 0;
}

int fs_write (const char *path, const char *buffer, size_t size, off_t offset, struct fuse_file_info *fi)
{
    printf("Write is called:%s\n", path);
    int newSize = offset + size;
    if (fs_truncate(path, newSize + BLOCK_SIZE) != 0)
        return 0;
    int num = getNumByPath(path);
    INode iNode = getINodeByNum(num);

    iNode.size = newSize;
    iNode.modifyTime = iNode.changeTime = time(NULL);
    writeINode(num, iNode);

    int start = offset / BLOCK_SIZE, startNum;
    if (start < DIRECT_POINTER) startNum = iNode.blocks[start];
    else {
        start -= DIRECT_POINTER - 1;
        int pointers[BLOCK_SIZE];
        readIndirect(iNode, pointers, start / MAX_POINTER_PER_BLOCK);
        startNum = pointers[start];
    }

    return writeBlock(iNode, buffer, startNum, offset % BLOCK_SIZE, size);
}

int fs_utime (const char *path, struct utimbuf *buffer)
{
	printf("Utime is called:%s\n",path);
    int num = getNumByPath(path);
    INode iNode = getINodeByNum(num);
    iNode.accessTime = buffer->actime;
    iNode.modifyTime = buffer->modtime;
    iNode.changeTime = time(NULL);
    writeINode(num, iNode);
	return 0;
}

int fs_statfs (const char *path, struct statvfs *stat)
{
	printf("Statfs is called:%s\n",path);
    SuperBlock superBlock = readSuperBlock();
    stat->f_bsize = superBlock.blockSize;
    stat->f_blocks = superBlock.blockNum;
    stat->f_bfree = superBlock.blockFree;
    stat->f_bavail = superBlock.blockFree;
    stat->f_files = superBlock.fileNode;
    stat->f_ffree = superBlock.freeNode;
    stat->f_favail = superBlock.freeNode;
    stat->f_namemax = superBlock.fileName;
	return 0;
}

int fs_open (const char *path, struct fuse_file_info *fi)
{
	printf("Open is called:%s\n",path);
	return 0;
}

//Functions you don't actually need to modify
int fs_release (const char *path, struct fuse_file_info *fi)
{
	printf("Release is called:%s\n",path);
	return 0;
}

int fs_opendir (const char *path, struct fuse_file_info *fi)
{
	printf("Opendir is called:%s\n",path);
	return 0;
}

int fs_releasedir (const char * path, struct fuse_file_info *fi)
{
	printf("Releasedir is called:%s\n",path);
	return 0;
}

static struct fuse_operations fs_operations = {
	.getattr    = fs_getattr,
	.readdir    = fs_readdir,
	.read       = fs_read,
	.mkdir      = fs_mkdir,
	.rmdir      = fs_rmdir,
	.unlink     = fs_unlink,
	.rename     = fs_rename,
	.truncate   = fs_truncate,
	.utime      = fs_utime,
	.mknod      = fs_mknod,
	.write      = fs_write,
	.statfs     = fs_statfs,
	.open       = fs_open,
	.release    = fs_release,
	.opendir    = fs_opendir,
	.releasedir = fs_releasedir
};

int main(int argc, char *argv[])
{
	if(disk_init())
		{
		printf("Can't open virtual disk!\n");
		return -1;
		}
	if(mkfs())
		{
		printf("Mkfs failed!\n");
		return -2;
		}
    return fuse_main(argc, argv, &fs_operations, NULL);
}
