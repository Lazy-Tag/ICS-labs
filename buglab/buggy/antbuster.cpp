#include <bits/stdc++.h>

const int MAXN=10;
const int INF=0x7FFFFFFF;

struct Ant{
    Ant();
    int x;
    int y;
    int lx;
    int ly;
    int HP;
    int age;
    int lvl;
    int mxHP;
    void Move();
    void NormalMove(int);
    void SpecialMove(int);
    bool CheckAvailable(int,int);
};

struct Tower{
    int x;
    int y;
    Tower();
    void Fire();
};

const int dx[]={0,1,0,-1};
const int dy[]={1,0,-1,0};

int n;
int m;
int t;
int clk;  // Global clock
int spn;  // Ant spawn count
bool END;
int s,d,r;
Ant* cakeCarrier;
int sign[MAXN][MAXN];
bool visited[MAXN][MAXN];  // If there is ant at the point

std::list<Ant> ants;
std::list<Tower> towers;

void Print();
int Sqr(int);
void CheckEnd();
void OneSecond();
void UpdateAge();
void CleanDeath();
void Initialize();
double Sqr(double);
void IncreaseSignal();
void DecreaseSignal();
bool CheckAvailable(int,int);
int SqrEucDis(int,int,int,int);
bool Cross(double,double,double,int,int);
bool InSegment(int,int,int,int,int,int);

int main(){
    Initialize();
    while((!END)&&(++clk<=t))
        OneSecond();
    Print();
    return 0;
}

void OneSecond(){
    if(ants.size()<6&&CheckAvailable(0,0))
        ants.push_back(Ant());
    IncreaseSignal();
    for(std::list<Ant>::iterator i=ants.begin();i!=ants.end();++i){
        i->Move();
    }
    if(cakeCarrier==NULL){
        for(std::list<Ant>::iterator i=ants.begin();i!=ants.end();++i){
            if(i->x==n&&i->y==m){
                cakeCarrier=&(*i);
                i->HP=std::min(i->mxHP,i->HP+i->mxHP/2);
            }
        }
    }
    for(std::list<Tower>::iterator i=towers.begin();i!=towers.end();++i){
        i->Fire();
    }
    CleanDeath();
    CheckEnd();
    if(END)
        return;
    DecreaseSignal();
    UpdateAge();
}

void Tower::Fire(){
    Ant* target=NULL;
    int mindis=INF;
    for(std::list<Ant>::iterator i=ants.begin();i!=ants.end();++i){
        int d=SqrEucDis(this->x,this->y,i->x,i->y);
        if(d<=Sqr(r)){
            if(cakeCarrier==&(*i)){
                target=&(*i);
                break;
            }
            else if(d<mindis){
                mindis=d;
                target=&(*i);
            }
        }
    }
    if(target==NULL)
        return;
    double dx=this->x-target->x;
    double dy=this->y-target->y;
    double k=dy/dx;
    double b=this->y-k*this->x;
    for(std::list<Ant>::iterator i=ants.begin();i!=ants.end();++i){
        if(Cross(k,-1.0,b,i->x,i->y)&&InSegment(this->x,this->y,target->x,target->y,i->x,i->y)&&SqrEucDis(this->x,this->y,i->x,i->y)<=SqrEucDis(this->x,this->y,target->x,target->y)){
            i->HP-=d;
        }
    }
}

void CheckEnd(){
    if(cakeCarrier!=NULL&&cakeCarrier->x==0&&cakeCarrier->y==0)
        END=true;
}

void Ant::Move(){
    int maxSignal=-INF,dir=-1;
    for(int i=0;i<4;i++){
        if(this->CheckAvailable(this->x+dx[i],this->y+dy[i])&&maxSignal<sign[this->x+dx[i]][this->y+dy[i]]){
            maxSignal=sign[this->x+dx[i]][this->y+dy[i]];
        }
    }
    for(int i=0;i<4;i++){
        if(this->CheckAvailable(this->x+dx[i],this->y+dy[i])&&maxSignal==sign[this->x+dx[i]][this->y+dy[i]]){
            dir=i;
            break;
        }
    }
    if((this->age+1)%5!=0||dir==-1)
        this->NormalMove(dir);
    else
        this->SpecialMove(dir);
}

void Ant::NormalMove(int dir){
    if(dir==-1){
        this->lx=this->x;
        this->ly=this->y;
        return;
    }
    else{
        this->lx=this->x;
        this->ly=this->y;
        visited[this->x][this->y]=false;
        this->x+=dx[dir];
        this->y+=dy[dir];
        visited[this->x][this->y]=true;
    }
}

void Ant::SpecialMove(int dir){
    dir=(dir-1)%4;
    while(!this->CheckAvailable(this->x+dx[dir],this->y+dy[dir]))
        dir=(dir-1)%4;
    this->NormalMove(dir);
}

void Initialize(){
    scanf("%d%d",&n,&m);
    scanf("%d%d%d",&s,&d,&r);
    for(int i=0;i<s;i++)
        towers.push_back(Tower());
    scanf("%d",&t);
}

void CleanDeath(){
    std::list<Ant>::iterator i=ants.begin();
    std::list<Ant>::iterator tmp;
    while(i!=ants.end()){
        if(i->HP<0){
            if(cakeCarrier==&(*i))
                cakeCarrier=NULL;
            visited[i->x][i->y]=false;
            tmp=i;
            ++i;
            ants.erase(tmp);
        }
        else
            ++i;
    }
}

void DecreaseSignal(){
    for(int i=0;i<=n;i++){
        for(int j=0;j<=m;j++){
            --sign[i][j];
        }
    }
}

void UpdateAge(){
    for(std::list<Ant>::iterator i=ants.begin();i!=ants.end();++i){
        i->age++;
    }
}

void IncreaseSignal(){
    for(std::list<Ant>::iterator i=ants.begin();i!=ants.end();++i){
        if(cakeCarrier==&(*i))
            sign[i->x][i->y]+=5;
        else
            sign[i->x][i->y]+=2;
    }
}

Ant::Ant(){
    this->lvl=spn/6+1;
    this->HP=this->mxHP=int(4*pow(1.1,this->lvl));
    this->age=0;
    this->x=this->y=this->lx=this->ly=0;
    visited[0][0]=true;
    spn++;
}

Tower::Tower(){
    scanf("%d%d",&this->x,&this->y);
    visited[this->x][this->y]=true;
}

void Print(){
    if(END)
        printf("Game over after %d seconds\n",clk);
    else
        puts("The game is going on");
    printf("%d\n",int(ants.size()));
    for(std::list<Ant>::iterator i=ants.begin();i!=ants.end();++i){
        printf("%d %d %d %d %d\n",i->age,i->lvl,i->HP,i->x,i->y);
    }
}

inline int Sqr(int x){
    return x*x;
}

inline double Sqr(double x){
    return x*x;
}

inline int SqrEucDis(int x1,int y1,int x2,int y2){ // Square of Euclidian Distance
    return Sqr(x1-x2)+Sqr(y1-y2);
}

inline bool Cross(double a,double b,double c,int x,int y){ // Point (X,Y) to Line Ax+By+C=0 Distance Formula
    return Sqr(a)+Sqr(b)>Sqr(a*x+b*y+c)*4;
}

inline bool CheckAvailable(int x,int y){ // Check if point (x,y) is valid and w/o ant
    return x>=0&&y>=0&&x<=n&&y<=m&&!visited[x][y];
}

inline bool InSegment(int x1,int y1,int x2,int y2,int x,int y){
    int maxx=std::max(x1,x2);
    int minx=std::min(x1,x2);
    int maxy=std::max(y1,y2);
    int miny=std::min(y1,y2);
    return minx<=x && x<=maxx && miny<=y && y<=maxy;
}

inline bool Ant::CheckAvailable(int x,int y){ // Choose available direction to move
    return !(x<0||y<0||x>n||y>m||visited[x][y]||(this->lx==x&&this->ly==y));
}
