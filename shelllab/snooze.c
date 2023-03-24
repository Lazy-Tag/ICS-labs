#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

int cur, sec;

void handler(int sig) {
    printf("Slept %d of %dsecs.\n", cur, sec);
    exit(1);
}

int main(int argc, char* argv[]) {
    if (!argv[1]) {
        printf("input an integer\n");
        exit(1);
    }
    sec = atoi(argv[1]);
    signal(SIGINT, handler);
    for (cur = 0; cur < sec; cur ++ )
        sleep(cur);
    return 0;
}