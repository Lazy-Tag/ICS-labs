import sys
import socket

RECV_BUFFER_SIZE = 2048
QUEUE_LENGTH = 10

def server(server_port):
    try:
        # 创建套接字并绑定到指定端口
        sockfd = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sockfd.bind(("", server_port))

        # 监听套接字
        sockfd.listen(QUEUE_LENGTH)

        while True:
            # 接受客户端连接
            new_fd, addr = sockfd.accept()

            # 从客户端接收消息，并打印到标准输出
            while True:
                recv_data = new_fd.recv(RECV_BUFFER_SIZE)
                if not recv_data:
                    break
                sys.stdout.buffer.write(recv_data)
                sys.stdout.flush()

            # 关闭新的套接字
            new_fd.close()
    except socket.error as e:
        print("Socket error: {}".format(e))
        sys.exit(1)


def main():
    if len(sys.argv) != 2:
        sys.exit("Usage: python server-python.py [Server Port]")
    server_port = int(sys.argv[1])
    server(server_port)

if __name__ == "__main__":
    main()
