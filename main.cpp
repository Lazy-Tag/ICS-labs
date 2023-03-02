#include <iostream>
#include <algorithm>
#include <random>
#include <ctime>
#include <string>
#include <thread>
#include <fstream>
#include <windows.h>

#define MIN 32

struct Matrix {
    int *matrix = nullptr;
    int size;

    inline explicit Matrix(int _size = 0) : size(_size) {
        matrix = new int[size * size];
        std::fill(matrix, matrix + size * size, 0);
    }

    inline ~Matrix() {
        delete[] matrix;
        matrix = nullptr;
    }

    inline Matrix &operator=(const Matrix &M) {
        delete[] matrix;
        matrix = new int[size * size];
        memcpy(matrix, M.matrix, size * size * sizeof(int));
        return *this;
    }

    inline int &operator()(int x, int y) {
        return matrix[x * size + y];
    }

    inline const int &operator()(int x, int y) const {
        return matrix[x * size + y];
    }

    [[nodiscard]] inline bool selfCheck() const {
        bool flag = true;
        for (int i = 0; i < size * size; i++)
            flag &= !matrix[i];
        return flag;
    }
};

void input(Matrix& A, int n, int m) {
    std::uniform_int_distribution<int> u(-200, 200);
    std::default_random_engine e;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
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

void strassenMul(Matrix &C, const Matrix &A, const Matrix &B, int depth) {
    int size = A.size;

    if (A.selfCheck() | B.selfCheck()) {
        C = Matrix(size);
        return;
    } else if (size <= MIN) {
        C = mul(A, B, size, size, size);
        return;
    }

    int mid = size >> 1;
    size = mid;

    auto A11 = makeUp(A, size, 0, 0);
    auto A12 = makeUp(A, size, 0, mid);
    auto A21 = makeUp(A, size, mid, 0);
    auto A22 = makeUp(A, size, mid, mid);
    auto B11 = makeUp(B, size, 0, 0);
    auto B12 = makeUp(B, size, 0, mid);
    auto B21 = makeUp(B, size, mid, 0);
    auto B22 = makeUp(B, size, mid, mid);

    Matrix M1(size), M2(size), M3(size), M4(size), M5(size), M6(size), M7(size);
    if (depth <= 2) {
        std::thread t1([&]() { strassenMul(M1, A11, sub(B12, B22), depth + 1); });
        std::thread t2([&]() { strassenMul(M2, add(A11, A12), B22, depth + 1); });
        std::thread t3([&]() { strassenMul(M3, add(A21, A22), B11, depth + 1); });
        std::thread t4([&]() { strassenMul(M4, A22, sub(B21, B11), depth + 1); });
        std::thread t5([&]() { strassenMul(M5, add(A11, A22), add(B11, B22), depth + 1); });
        std::thread t6([&]() { strassenMul(M6, sub(A12, A22), add(B21, B22), depth + 1); });
        std::thread t7([&]() { strassenMul(M7, sub(A11, A21), add(B11, B12), depth + 1); });

        t1.join();
        t2.join();
        t3.join();
        t4.join();
        t5.join();
        t6.join();
        t7.join();
    } else {
        strassenMul(M1, A11, sub(B12, B22), depth + 1);
        strassenMul(M2, add(A11, A12), B22, depth + 1);
        strassenMul(M3, add(A21, A22), B11, depth + 1);
        strassenMul(M4, A22, sub(B21, B11), depth + 1);
        strassenMul(M5, add(A11, A22), add(B11, B22), depth + 1);
        strassenMul(M6, sub(A12, A22), add(B21, B22), depth + 1);
        strassenMul(M7, sub(A11, A21), add(B11, B12), depth + 1);
    }

    auto C11 = add(add(M5, M4), sub(M6, M2));
    auto C12 = add(M1, M2);
    auto C21 = add(M3, M4);
    auto C22 = sub(add(M5, M1), add(M3, M7));

    merge(C, C11, 0, 0);
    merge(C, C12, 0, mid);
    merge(C, C21, mid, 0);
    merge(C, C22, mid, mid);
}

int main() {
    std::fstream file("data.csv", std::ios::out | std::ios::app);

    puts("------------------");
    std::default_random_engine e;
    for (int i = 10; i < 3000; i += 10) {
        std::uniform_int_distribution<unsigned> u(i - 5, i + 5);
        printf("N:%d\n", i);
        file << i / 10 << ',';
        int n, m, p, size;
        n = u(e), m = u(e), p = u(e);
        int len = std::max(n, std::max(m, p));
        for (int cur = 1;; cur *= 2)
            if (len <= cur) {
                size = cur;
                break;
            }

        Matrix A(size), B(size), C(size);
        input(A, n, m), input(B, m, p);
        clock_t begin1 = clock();
        C = mul(A, B, n, m, p);
        clock_t end1 = clock();
        clock_t time1 = end1 - begin1;
        printf("Time for Mul n^3:%ldms\n", time1);
        file << std::to_string(time1) << ',';

        A.~Matrix(), B.~Matrix(), C.~Matrix();
        A = Matrix(size), B = Matrix(size), C = Matrix(size);
        input(A, n, m), input(B, m, p);
        clock_t begin2 = clock();
        strassenMul(C, A, B, 0);
        clock_t end2 = clock();
        clock_t time2 = end2 - begin2;
        printf("Time for StrassenMul n^(log7):%ldms\n", time2);
        file << std::to_string(time2) << std::endl;
        puts("------------------");
    }

    file.close();

    return 0;
}
