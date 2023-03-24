#include <bits/stdc++.h>

const int MAXN=1e5+10;

char s[MAXN];

int main(){
    scanf("%s", s);
    for(int i = 0; i < strlen(s); ++i){
        if(std::isalpha(s[i]))
            s[i] ^= 1<<5;
    }
    printf("%s\n", s);
    return 0;
}
