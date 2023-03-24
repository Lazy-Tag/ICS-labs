#include <bits/stdc++.h>

int n;
int q;
int ans;
std::vector<int> v;

int ReadInt(){
    int x = 0;
    char ch = getchar();
    while(!isdigit(ch))
        ch = getchar();
    while(isdigit(ch)){
        x = x * 10 + ch - '0';
        ch = getchar();
    }
    return x;
}

void Replace(int pos, int value){
    ans ^= v[pos] ^ value;
    v[pos] = value;
}

int main(){
    n=ReadInt(), q=ReadInt();
    for(int i=0;i<n;i++)
        v.push_back(ReadInt());
    for(auto x : v)
        ans ^= x;
    for(int i=0;i<q;i++)
        Replace(ReadInt(), ReadInt());
    printf("%d\n", ans);
    return 0;
}
