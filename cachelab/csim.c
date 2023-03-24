#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <stdbool.h>
#include <string.h>
#include "cachelab.h"
#define N 256

typedef struct {
    bool valid;
    int tag;
    int last;
}Block;

typedef Block* Line;
typedef Block** Set;
typedef Block*** Cache;
typedef unsigned long long Address;

typedef struct {
    char type;
    Address address;
    int bias;
}Operation;

Cache cache;
int timeStamp;
int S, E, b;
int s, B;
bool isTrace;
FILE *fp;
char fileName[N], option[N];
int hitCount, missCount, evictionCount;

void printHelpInformation() {
    printf("S: %d\nE: %d\nb: %d\nfile Name: %s\n", S, E, b, fileName);
}

void getParameters(int argc, char** argv) {
    int option;
    while((option = getopt(argc, argv, "h:v:s:E:b:t:u")) != -1) {
        switch (option) {
            case 'h':
                printHelpInformation();
                exit(0);
            case 'v':
                isTrace = true;
                break;
            case 's':
                s = atoi(optarg);
                S = 1 << s;
                break;
            case 'E':
                E = atoi(optarg);
                break;
            case 'b':
                b = atoi(optarg);
                B = 1 << b;
                break;
            case 't':
                fp = fopen(optarg, "r");
                strcpy(fileName, optarg);
                break;
            default:
                printf("Error option!\n");
                break;
        }
    }
}

void initializeCache() {
    cache = malloc(S * sizeof(void*));
    for (int i = 0; i < S; i ++ ) {
        cache[i] = malloc(sizeof(void*) * E);
        for (int j = 0; j < E; j ++ ) {
            Line line = malloc(sizeof(Block));
            line->tag = 0;
            line->valid = false;
            line->last = -1;
            cache[i][j] = line;
        }
    }
}

void tryHit(Operation operation) {
    Address address = operation.address;
    int setBias = (address >> b) & ((1 << s) - 1);
    int tagAddress = address >> (s + b);

    Set set = cache[setBias];
    Line hitBlock = NULL;
    Line emptyBlock = NULL;
    Line LRUBlock = NULL;

    for (int i = 0; i < E; i ++ ) {
        Line line = set[i];
        if (!hitBlock && line->valid && line->tag == tagAddress) hitBlock = line;
        if (!emptyBlock && !line->valid) emptyBlock = line;
        if (line->valid && (!LRUBlock || LRUBlock->last > line->last)) LRUBlock = line;
    }

    if (hitBlock) {
        hitBlock->last = timeStamp;
        if (isTrace) puts("hit!");
        hitCount ++ ;
    } else {
        missCount ++ ;
        if (isTrace) puts("miss!");
        if (emptyBlock) {
            emptyBlock->last = timeStamp;
            emptyBlock->valid = true;
            emptyBlock->tag = tagAddress;
        } else {
            evictionCount ++ ;
            if (isTrace) puts("eviction!");
            LRUBlock->last = timeStamp;
            LRUBlock->valid = true;
            LRUBlock->tag = tagAddress;
        }
    }
}

void getOperations() {
    while(fgets(option, N, fp)) {
        timeStamp ++ ;
        Operation operation;
        int count = sscanf(option, " %c%llx,%d", &operation.type, &operation.address, &operation.bias);
        if (operation.type == 'I' || !count) continue;
        if (isTrace) puts("option");

        if (operation.type == 'M') tryHit(operation);
        tryHit(operation);
    }
}

void freeCache() {
    for (int i = 0; i < S; i ++ ){
        for (int j = 0; j < E; j ++ )
            free(cache[i][j]);
        free(cache[i]);
    }
    free(cache);
    fclose(fp);
}

int main(int argc, char** argv)
{
    getParameters(argc, argv);
    initializeCache();
    getOperations();
    freeCache();
    printSummary(hitCount, missCount, evictionCount);
    return 0;
}
