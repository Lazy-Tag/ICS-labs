#include <bits/stdc++.h>

struct Range{
    int l;
    int r;
};

bool compare(const Range& x, const Range& y){
    return x.l <= y.l;
}

int main(){
    int n;
    scanf("%d", &n);
    std::vector<Range> R;
    for(int i=0;i<n;i++){
        int l,r;
        scanf("%d%d",&l,&r);
        R.push_back(Range{l, r});
    }
    std::sort(R.begin(), R.end(), compare);
    std::vector<Range> ans;
    Range last = R[0];
    for(auto it = std::next(R.begin()); it != R.end(); ++it){
        if(it->l <= last.r)
            last.r = it->r;
        else{
            ans.push_back(last);
            last = *it;
        }
    }
    ans.push_back(last);
    for(const auto& r : ans){
        printf("%d %d\n", r.l, r.r);
    }
    return 0;
}
