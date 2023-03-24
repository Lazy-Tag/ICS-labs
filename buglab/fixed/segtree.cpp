#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <iostream>
#include <algorithm>

const int MAXN=1e5+10;

typedef long long LL;

struct Node{
    int l;
    int r;
    LL add = 0;
    LL sum = 0;
    int size;
    Node* lch = nullptr;
    Node* rch = nullptr;
    ~Node();
    Node(int,int);
    void Maintain();
    void PushDown();
    LL Query(const int&,const int&);
    void Add(const int&,const int&,const int&);
};

int data[MAXN];

int main(){
    int n,q;
    scanf("%d%d",&n,&q);
    for(int i=1;i<=n;i++)
        scanf("%d",data+i);
    Node* N=new Node(1,n);
    int t, l,r,d;
    for(int i=0;i<q;i++){
        scanf("%d", &t);
        if(t==1){
            scanf("%d%d%d",&l,&r,&d);
            N->Add(l,r,d);
        }
        else{
            scanf("%d%d",&l,&r);
            printf("%lld\n",N->Query(l,r));
        }
    }
    delete N;
    return 0;
}

Node::Node(int l,int r){
    this->l=l;
    this->r=r;
    this->add=0;
    this->size=r-l+1;
    if(l==r)
        this->sum=data[r];
    else{
        int mid=(l+r)>>1;
        this->lch=new Node(l,mid);
        this->rch=new Node(mid+1,r);
        this->Maintain();
    }
}

Node::~Node(){
    if(this->lch != nullptr)
        delete this->lch;
    if(this->rch != nullptr)
        delete this->rch;
}

void Node::Add(const int& l,const int& r,const int& d){
    if(l<=this->l&&this->r<=r){
        this->add+=d;
        this->sum+=d*this->size;
    }
    else{
        this->PushDown();
        if(this -> lch != nullptr && l<=this->lch->r)
            this->lch->Add(l,r,d);
        if(this -> rch != nullptr && this->rch->l<=r)
            this->rch->Add(l,r,d);
        this->Maintain();
    }
}

LL Node::Query(const int& l,const int& r){
    if(l<=this->l&&this->r<=r)
        return this->sum;
    else{
        this->PushDown();
        if(this -> lch != nullptr && r<=this->lch->r)
            return this->lch->Query(l,r);
        if(this -> rch != nullptr && this->rch->l<=l)
            return this->rch->Query(l,r);
        LL res = 0;
        if(this -> lch != nullptr) res += this->lch->Query(l,r);
        if(this -> rch != nullptr) res += this->rch->Query(l,r);
        return res;
    }
}

inline void Node::Maintain(){
    this -> sum = 0;
    if(this -> lch != nullptr) this -> sum += this->lch->sum;
    if(this -> rch != nullptr) this -> sum += this->rch->sum;
}

inline void Node::PushDown(){
    if(this->add){
        if(this -> lch != nullptr) this->lch->add+=this->add;
        if(this -> rch != nullptr) this->rch->add+=this->add;
        if(this -> lch != nullptr) this->lch->sum+=this->add*this->lch->size;
        if(this -> rch != nullptr) this->rch->sum+=this->add*this->rch->size;
        this->add=0;
    }
}
