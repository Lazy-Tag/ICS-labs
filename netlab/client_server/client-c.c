/*****************************************************************************
 * client-c.c
 * Name:
 * NetId:
 *****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define SEND_BUFFER_SIZE 2048

/* TODO: client()
 * Open socket and send message from stdin.
 * Return 0 on success, non-zero on failure
 */
int client(char *server_ip, char *server_port)
{
  int sockfd, ret;
  struct addrinfo hints, *servinfo, *p;
  char send_buffer[SEND_BUFFER_SIZE];
  size_t bytes_read;

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_UNSPEC;
  hints.ai_socktype = SOCK_STREAM;

  if ((ret = getaddrinfo(server_ip, server_port, &hints, &servinfo)) != 0)
  {
    fprintf(stderr, "getaddrinfo error: %s\n", gai_strerror(ret));
    return 1;
  }

  // 遍历所有结果，并尝试连接
  for (p = servinfo; p != NULL; p = p->ai_next)
  {
    if ((sockfd = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) == -1)
    {
      perror("client: socket");
      continue;
    }

    if (connect(sockfd, p->ai_addr, p->ai_addrlen) == -1)
    {
      close(sockfd);
      perror("client: connect");
      continue;
    }

    break; // 连接成功，退出循环
  }

  if (p == NULL)
  {
    fprintf(stderr, "client: failed to connect\n");
    return 2;
  }

  freeaddrinfo(servinfo); // 释放地址信息

  // 从标准输入读取数据，并发送给服务器
  while ((bytes_read = fread(send_buffer, 1, sizeof(send_buffer), stdin)) > 0)
  {
    if (send(sockfd, send_buffer, bytes_read, 0) == -1)
    {
      perror("send");
      break;
    }
  }

  close(sockfd); // 关闭套接字

  return 0;
}

/*
 * main()
 * Parse command-line arguments and call client function
 */
int main(int argc, char **argv)
{
  char *server_ip;
  char *server_port;

  if (argc != 3)
  {
    fprintf(stderr, "Usage: ./client-c [server IP] [server port] < [message]\n");
    exit(EXIT_FAILURE);
  }

  server_ip = argv[1];
  server_port = argv[2];
  return client(server_ip, server_port);
}
