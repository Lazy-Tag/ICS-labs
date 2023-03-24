#include <iostream>

void swap(int & a, int & b) {
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
}

int main() {
    // Input
    int m = 0;
    std::cin >> m;
    int * data = new int[m];
    for(int i = 0; i < m; i++) {
        std::cin >> data[i];
    }

    // Shuffle
    int n = 0;
    std::cin >> n;
    for(int i = 0; i < n; i++) {
        int a, b;
        std::cin >> a >> b;
        if(a < 0 || a >= n || b < 0 || b >= n) {
            std::cout << -1 << std::endl;
            return 0;
        }
        swap(data[a], data[b]);
    }
    
    // Output
    for(int i = 0; i < m; i++) {
        std::cout << data[i] << std::endl;
    }

    delete [] data;

    return 0;
}
