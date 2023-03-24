#include <iostream>
#include <cmath>

typedef unsigned ElemTypeA;
typedef float ElemTypeB;

struct Node {
    ElemTypeA exp;
    ElemTypeB base;

    Node() = default;
    Node(ElemTypeA e, ElemTypeB b) : exp(e), base(b) {}
};

ElemTypeB calcOnce(Node node);
ElemTypeB calc();

int main() {
    ElemTypeB result = calc();
    std::cout << result << std::endl;
    return 0;
}

ElemTypeB calc() {
    int n;
    std::cin >> n;
    Node * data = new Node[n];
    for(int i = 0; i < n; i++) {
        ElemTypeA a;
        ElemTypeB b;
        std::cin >> a >> b;
        data[i] = Node(a, b);
    }

    ElemTypeB result;
    for(int i = 0; i < n; i++) {
        result += calcOnce(data[i]);
    }

    delete [] data;
    return result;
}

ElemTypeB calcOnce(Node node) {
    ElemTypeB result;
    for(int i = 0; i <= node.exp - 1; i++) {
        result *= node.base;
    }

    return result;
}
