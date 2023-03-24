#include <stdio.h>

#define MAXLEN 256

int main() {
    char str[MAXLEN];
    scanf("%s", str);
    printf("print string for 3 times\n");
    int i;
    for (i = 0; i < 3; i ++ )
        printf("%s\n", str);
    return 0;
}