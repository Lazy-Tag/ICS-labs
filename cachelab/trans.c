/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    if (M == 32) {
        for (int i = 0; i < 32; i += 8 )
            for (int j = 0; j < 32; j += 8 )
                for (int k = i; k < i + 8; k ++ ) {
                    int t0 = A[k][j + 0], t1 = A[k][j + 1];
                    int t2 = A[k][j + 2], t3 = A[k][j + 3];
                    int t4 = A[k][j + 4], t5 = A[k][j + 5];
                    int t6 = A[k][j + 6], t7 = A[k][j + 7];
                    B[j + 0][k] = t0;
                    B[j + 1][k] = t1;
                    B[j + 2][k] = t2;
                    B[j + 3][k] = t3;
                    B[j + 4][k] = t4;
                    B[j + 5][k] = t5;
                    B[j + 6][k] = t6;
                    B[j + 7][k] = t7;
                }
    } else if (M == 64) {
        for (int i = 0; i < 64; i += 8 )
            for (int j = 0; j < 64; j += 8 ) {
                for (int k = 0; k < 4; k ++ ) {
                    int t0 = A[i + k][j + 0], t1 = A[i + k][j + 1];
                    int t2 = A[i + k][j + 2], t3 = A[i + k][j + 3];
                    int t4 = A[i + k][j + 4], t5 = A[i + k][j + 5];
                    int t6 = A[i + k][j + 6], t7 = A[i + k][j + 7];
                    B[j + 0][i + k] = t0;
                    B[j + 1][i + k] = t1;
                    B[j + 2][i + k] = t2;
                    B[j + 3][i + k] = t3;
                    B[j + 0][i + 4 + k] = t4;
                    B[j + 1][i + 4 + k] = t5;
                    B[j + 2][i + 4 + k] = t6;
                    B[j + 3][i + 4 + k] = t7;
                }

                for (int k = 0; k < 4; k ++ ) {
                    int t0 = A[i + 4][j + k], t1 = A[i + 5][j + k];
                    int t2 = A[i + 6][j + k], t3 = A[i + 7][j + k];
                    int t4 = B[j + k][i + 4], t5 = B[j + k][i + 5];
                    int t6 = B[j + k][i + 6], t7 = B[j + k][i + 7];
                    B[j + k][i + 4] = t0;
                    B[j + k][i + 5] = t1;
                    B[j + k][i + 6] = t2;
                    B[j + k][i + 7] = t3;
                    B[j + k + 4][i + 0] = t4;
                    B[j + k + 4][i + 1] = t5;
                    B[j + k + 4][i + 2] = t6;
                    B[j + k + 4][i + 3] = t7;
                }

                for (int k = 0; k < 4; k ++ ) {
                    int t0 = A[i + k + 4][j + 4], t1 = A[i + k + 4][j + 5];
                    int t2 = A[i + k + 4][j + 6], t3 = A[i + k + 4][j + 7];
                    B[j + 4][i + k + 4] = t0;
                    B[j + 5][i + k + 4] = t1;
                    B[j + 6][i + k + 4] = t2;
                    B[j + 7][i + k + 4] = t3;
                }
            }
    } else {
        int len = 17;
        for (int i = 0; i < N; i += len)
            for (int j = 0; j < M; j += len)
                for (int k = i; k < N && k < i + len; k ++ )
                    for (int h = j; h < M && h < j + len; h ++ )
                        B[h][k] = A[k][h];
    }


}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

