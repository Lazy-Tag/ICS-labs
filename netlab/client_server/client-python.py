import sys
import socket

SEND_BUFFER_SIZE = 2048

def client(server_ip, server_port):
    try:
        # 创建套接字并连接服务器
        sockfd = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sockfd.connect((server_ip, server_port))

        # 从标准输入读取数据，并发送给服务器
        while True:
            send_data = sys.stdin.buffer.read(SEND_BUFFER_SIZE)
            if not send_data:
                break
            sockfd.sendall(send_data)

        # 关闭套接字
        sockfd.close()
    except socket.error as e:
        print("Socket error: {}".format(e))
        sys.exit(1)


def main():
    if len(sys.argv) != 3:
        sys.exit("Usage: python client-python.py [Server IP] [Server Port] < [message]")
    server_ip = sys.argv[1]
    server_port = int(sys.argv[2])
    client(server_ip, server_port)

if __name__ == "__main__":
    main()
