#include <iostream>
#include <string>
#include <algorithm>
#include <utility>
#include <stack>


struct State{
    State(){
    }
    State(const State &st){
        for(int i=0;i<3;i++)
            for(int j=0;j<3;j++)
                matrix[i][j] = st.matrix[i][j];
        zero_x=st.zero_x; zero_y=st.zero_y; g=st.g;
        parent = st.parent;
    }
    ~State(){
        parent = nullptr;
    }
    char matrix[3][3];  
    int zero_x,zero_y;  
    int g; 
    struct State* parent;
};

State start; //开始状态（开始节点）
State goal; //目标状态


//矩阵转字符串形式，以便存储到set中方便查重
std::string matrix2string(char a[3][3]){
    std::string s="";
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            s+=a[i][j];
        }
    }
    return s;
}

//打印二维数组
void print_matrix(char a[3][3]){
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            std::cout << a[i][j] << " ";
        }
        std::cout << std::endl;
    }
}

//找空白格的位置,即'0'点
void find_blankTile(){
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            if(start.matrix[i][j]=='0'){
                start.zero_x = i;
                start.zero_y = j;
                return;
            }
        }
    }
}


int move_x[4] = {-1,0,1,0};  //上右下左
int move_y[4] = {0,1,0,-1};
std::stack<std::pair<State,int>> que;
int node_num;
std::stack<State> stack_path; //记录路径

int IDS(int max_depth){
    find_blankTile();                 //初始化start节点
    start.g=0; 
    start.parent=nullptr;
    int depth=0;                      //深度
    que.push(std::make_pair(start,depth)); //将<节点，深度>对 入栈
    int curDepth,nextDepth;           //当前节点深度，扩展节点深度
    node_num=0;                       //记录总扩展节点数

    while(!que.empty()){
        //请实现带深度限制的搜索
        //提示：1）状态比较 matrix2string(curState->matrix)==matrix2string(goal.matrix)判断
        //     2）移动空格位置  nextState->zero_x = curState->zero_x+move_x[i]; nextState->zero_y = curState->zero_y+move_y[i];
        //     3）判断空格移动是否在允许范围 (nextState->zero_x<0||nextState->zero_x>2||nextState->zero_y<0||nextState->zero_y>2)
        //     4）防止状态重复
        State curs = State(que.top().first);
        State* curState = &curs;
        curDepth = que.top().second;
        que.pop();
        node_num--;
        if(matrix2string(curState->matrix)==matrix2string(goal.matrix))
        {
            int steps = curState->g;
            while(curState){
                stack_path.push(*curState);
                curState = curState->parent;
                free(curState);
            }
            return steps;
        }
        else{
            if(curDepth > max_depth)
                continue;
            nextDepth = curDepth + 1;
            for(int i=0; i<4; i++)
            {
                State* nextState = (State*)malloc(sizeof(State));
                for (int p = 0; p < 3; p++)
                {
                    for (int q = 0; q < 3; q++)
                    {
                        nextState->matrix[p][q] = curState->matrix[p][q];
                    }
                }
                nextState->zero_x = curState->zero_x+move_x[i];
                nextState->zero_y = curState->zero_y+move_y[i];
                int a = nextState->zero_x<0||nextState->zero_x>2||nextState->zero_y<0||nextState->zero_y>2;
                //判断条件3
                int b = curState->parent!=nullptr && nextState->zero_x==curState->parent->zero_x && nextState->zero_y==curState->parent->zero_y;
                //判断条件4
                if(a || b)
                    continue;
                else
                {
                    nextState->matrix[curState->zero_x][curState->zero_y] = curState->matrix[nextState->zero_x][nextState->zero_y];
                    nextState->matrix[nextState->zero_x][nextState->zero_y] = curState->matrix[curState->zero_x][curState->zero_y];
                    nextState->g = curState->g + 1;
                    nextDepth = curDepth + 1;
                    nextState->parent = curState;
                    que.push(std::make_pair(*nextState, nextDepth));
                    node_num++;
                }
            }

        }
    }
    return -1;  //找不到解，返回-1
}

//打印路径
void print_path(){
    State* st;
    std::cout << "path: " << std::endl;
    while(!stack_path.empty()){
        st = &stack_path.top();
        print_matrix(st->matrix);
        std::cout << std::endl;
        stack_path.pop();
    }
}


int main(){
    //目标状态
    char goal_matrix[3][3]={{'1','2','3'},{'4','5','6'},{'7','8','0'}};
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            goal.matrix[i][j] = goal_matrix[i][j];
        }
    }

    char a[3][3]={{'1','2','3'},{'4','6','0'},{'7','5','8'}}; //开始状态
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            start.matrix[i][j] = a[i][j];
        }
    }

    std::cout << "steps: " << IDS(15) << std::endl;
    std::cout << "node extended: " << node_num << std::endl;
    print_path();
    return 0;
}
