#include <iostream>
#include <random>
#include <ctime>
#include <thread>
#include <mutex>

struct Matrix {
    int* matrix = nullptr;
    int size;
    inline explicit Matrix(int _size) : size(_size) {
        matrix = new int[size * size];
        std::fill(matrix, matrix + size * size, 0);
    }
    inline ~Matrix() {
        delete[] matrix;
    }
    inline Matrix& operator= (const Matrix& M) {;
        size = M.size;
        matrix = new int[size * size];
        memcpy(matrix, M.matrix, size * size);
        return *this;
    }

    inline int& operator() (int x, int y) {
        return matrix[x * size + y];
    }

    inline const int& operator() (int x, int y) const {
        return matrix[x * size + y];
    }
};

void input(Matrix& A, int n, int m) {
    std::uniform_int_distribution<unsigned> u(-200, 200);
    std::default_random_engine e;
    for (int i = 0; i < n; i ++ )
        for (int j = 0; j < m; j ++ )
            A(i, j) = u(e);
}

Matrix add(const Matrix& a, const Matrix& b) {
    int size = a.size;
    Matrix res(size);
    for (int i = 0; i < size; i ++ )
        for (int j = 0; j < size; j ++ )
            res(i, j) = a(i, j) + b(i, j);
    return res;
}

Matrix sub(const Matrix& a, const Matrix& b) {
    int size = a.size;
    Matrix res(size);
    for (int i = 0; i < size; i ++ )
        for (int j = 0; j < size; j ++ )
            res(i, j) = a(i, j) - b(i, j);
    return res;
}

Matrix mul(const Matrix& a, const Matrix& b, int n, int m, int p) {
    int size = a.size;
    Matrix res(size);
    for (int i = 0; i < n; i ++ )
        for (int j = 0; j < m; j ++ )
            for (int k = 0; k < p; k ++ )
                res(i, k) += a(i, j) * b(j, k);
    return res;
}

Matrix makeUp(const Matrix& M, int size, int x, int y) {
    Matrix res(size);
    for (int i = 0; i < size; i ++ )
        for (int j = 0; j < size; j ++ )
            res(i, j) = M(i + x, j + y);
    return res;
}

void merge(Matrix& res, const Matrix& M, int x, int y) {
    int size = M.size;
    for (int i = 0; i < size; i ++ )
        for (int j = 0; j < size; j ++ )
            res(i + x, j + y) = M(i, j);
}

void strassenMul(Matrix& C, const Matrix& A, const Matrix& B) {
    int size = A.size;

    int n = 32;
    if (size == n) {
        C = mul(A, B, n, n, n);
        return;
    }

    int mid = size >> 1;
    size = mid;

    auto A11 = makeUp(A, size, 0,   0  );
    auto A12 = makeUp(A, size, 0,   mid);
    auto A21 = makeUp(A, size, mid, 0  );
    auto A22 = makeUp(A, size, mid, mid);
    auto B11 = makeUp(B, size, 0,   0  );
    auto B12 = makeUp(B, size, 0,   mid);
    auto B21 = makeUp(B, size, mid, 0  );
    auto B22 = makeUp(B, size, mid, mid);

    Matrix M1(size), M2(size), M3(size), M4(size), M5(size), M6(size), M7(size);
    std::thread t1([&] () {strassenMul(M1, A11, sub(B12, B22));});
    std::thread t2([&] () {strassenMul(M2, add(A11, A12), B22);});
    std::thread t3([&] () {strassenMul(M3, add(A21, A22), B11);});
    std::thread t4([&] () {strassenMul(M4, A22, sub(B21, B11));});
    std::thread t5([&] () {strassenMul(M5, add(A11, A22), add(B11, B22));});
    std::thread t6([&] () {strassenMul(M6, sub(A12, A22), add(B21, B22));});
    std::thread t7([&] () {strassenMul(M7, sub(A11, A21), add(B11, B12));});

    t1.join();
    t2.join();
    t3.join();
    t4.join();
    t5.join();
    t6.join();
    t7.join();

    auto C11 = add(add(M5, M4), sub(M6, M2));
    auto C12 = add(M1, M2);
    auto C21 = add(M3, M4);
    auto C22 = sub(add(M5, M1), add(M3, M7));

    merge(C, C11,   0,   0);
    merge(C, C12,   0, mid);
    merge(C, C21,   mid, 0);
    merge(C, C22, mid, mid);
}

int main() {
    int n, m, p, size;
    n = m = p = 128;
    clock_t begin = clock();
    int len = std::max(n, std::max(m, p));
    int cur = 1;
    for (int i = 0; ; i ++ , cur *= 2)
        if (len <= cur) {
            size = cur;
            break;
        }
    Matrix A(size), B(size), C(size);
    input(A, n, m), input(B, m, p);

    C = mul(A, B, n, m, p);
//    strassenMul(C, A, B);

    printf("Time: %.2lfs\n", (double) (clock() - begin) / 1000);

    return 0;
}
