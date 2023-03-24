#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

int main() {
    int i;
    char str[256];
    scanf("%s", str);
    sleep(5);
    printf("String Print: \n");
    for (i = 0; i < 3; i ++ )
        printf("%s\n", str);
    printf("proc over!\n");
    return 0;
}