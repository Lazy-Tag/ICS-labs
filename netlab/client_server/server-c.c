/*****************************************************************************
 * server-c.c
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
#include <signal.h>

#define QUEUE_LENGTH 10
#define RECV_BUFFER_SIZE 2048

/* 信号处理函数 */
void sigint_handler(int signum)
{

  exit(0);
}

/* TODO: server()
 * Open socket and wait for client to connect
 * Print received message to stdout
 * Return 0 on success, non-zero on failure
 */
int server(char *server_port)
{
  int sockfd, new_fd;
  struct addrinfo hints, *servinfo, *p;
  struct sockaddr_storage client_addr;
  socklen_t addr_size;
  int ret;
  char recv_buffer[RECV_BUFFER_SIZE];

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_UNSPEC;
  hints.ai_socktype = SOCK_STREAM;
  hints.ai_flags = AI_PASSIVE;

  if ((ret = getaddrinfo(NULL, server_port, &hints, &servinfo)) != 0)
  {
    fprintf(stderr, "getaddrinfo error: %s\n", gai_strerror(ret));
    return 1;
  }

  // 遍历所有结果，并尝试绑定套接字
  for (p = servinfo; p != NULL; p = p->ai_next)
  {
    if ((sockfd = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) == -1)
    {
      perror("server: socket");
      continue;
    }

    if (bind(sockfd, p->ai_addr, p->ai_addrlen) == -1)
    {
      close(sockfd);
      perror("server: bind");
      continue;
    }

    break; // 绑定成功，退出循环
  }

  if (p == NULL)
  {
    fprintf(stderr, "server: failed to bind\n");
    return 2;
  }

  freeaddrinfo(servinfo); // 释放地址信息

  if (listen(sockfd, QUEUE_LENGTH) == -1)
  {
    perror("listen");
    return 3;
  }

  // 注册 SIGINT 信号处理函数
  struct sigaction sa;
  sa.sa_handler = sigint_handler;
  sigemptyset(&sa.sa_mask);
  sa.sa_flags = 0;
  if (sigaction(SIGINT, &sa, NULL) == -1)
  {
    perror("sigaction");
    return 4;
  }

  while (1)
  {
    addr_size = sizeof client_addr;
    new_fd = accept(sockfd, (struct sockaddr *)&client_addr, &addr_size);
    if (new_fd == -1)
    {
      perror("accept");
      continue;
    }

    // 从客户端接收消息，并打印到标准输出
    while (1)
    {
      ret = recv(new_fd, recv_buffer, sizeof(recv_buffer), 0);
      if (ret == -1)
      {
        perror("recv");
        break;
      }
      else if (ret == 0)
      {
        break;
      }

      fwrite(recv_buffer, 1, ret, stdout);
      fflush(stdout);
    }

    close(new_fd); // 关闭新的套接字
  }

  close(sockfd); // 关闭监听套接字

  return 0;
}

/*
 * main():
 * Parse command-line arguments and call server function
 */
int main(int argc, char **argv)
{
  char *server_port;

  if (argc != 2)
  {
    fprintf(stderr, "Usage: ./server-c [server port]\n");
    exit(EXIT_FAILURE);
  }

  server_port = argv[1];
  return server(server_port);
}
