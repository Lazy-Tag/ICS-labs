/*
 * CS:APP Data Lab
 *
 * <Please put your name and userid here>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
     * Instructions to Students:
     *
     * STEP 1: Read the following instructions carefully.
     */

    You will provide your solution to the Data Lab by
    editing the collection of functions in this source file.

    INTEGER CODING RULES:

      Replace the "return" statement in each function with one
      or more lines of C code that implements the function. Your code
      must conform to the following style:

      int Funct(arg1, arg2, ...) {
          /* brief description of how your implementation works */
          int var1 = Expr1;
          ...
          int varM = ExprM;

          varJ = ExprJ;
          ...
          varN = ExprN;
          return ExprR;
      }

      Each "Expr" is an expression using ONLY the following:
      1. Integer constants 0 through 255 (0xFF), inclusive. You are
          not allowed to use big constants such as 0xffffffff.
      2. Function arguments and local variables (no global variables).
      3. Unary integer operations ! ~
      4. Binary integer operations & ^ | + << >>

      Some of the problems restrict the set of allowed operators even further.
      Each "Expr" may consist of multiple operators. You are not restricted to
      one operator per line.

      You are expressly forbidden to:
      1. Use any control constructs such as if, do, while, for, switch, etc.
      2. Define or use any macros.
      3. Define any additional functions in this file.
      4. Call any functions.
      5. Use any other operations, such as &&, ||, -, or ?:
      6. Use any form of casting.
      7. Use any data type other than int.  This implies that you
         cannot use arrays, structs, or unions.


      You may assume that your machine:
      1. Uses 2s complement, 32-bit representations of integers.
      2. Performs right shifts arithmetically.
      3. Has unpredictable behavior when shifting an integer by more
         than the word size.

    EXAMPLES OF ACCEPTABLE CODING STYLE:
      /*
       * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
       */
      int pow2plus1(int x) {
         /* exploit ability of shifts to compute powers of 2 */
         return (1 << x) + 1;
      }

      /*
       * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
       */
      int pow2plus4(int x) {
         /* exploit ability of shifts to compute powers of 2 */
         int result = (1 << x);
         result += 4;
         return result;
      }

    FLOATING POINT CODING RULES

    For the problems that require you to implent floating-point operations,
    the coding rules are less strict.  You are allowed to use looping and
    conditional control.  You are allowed to use both ints and unsigneds.
    You can use arbitrary integer and unsigned constants.

    You are expressly forbidden to:
      1. Define or use any macros.
      2. Define any additional functions in this file.
      3. Call any functions.
      4. Use any form of casting.
      5. Use any data type other than int or unsigned.  This means that you
         cannot use arrays, structs, or unions.
      6. Use any floating point data types, operations, or constants.


    NOTES:
      1. Use the dlc (data lab checker) compiler (described in the handout) to
         check the legality of your solutions.
      2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
         that you are allowed to use for your implementation of the function.
         The max operator count is checked by dlc. Note that '=' is not
         counted; you may use as many of these as you want without penalty.
      3. Use the btest test harness to check your functions for correctness.
      4. Use the BDD checker to formally verify your functions
      5. The maximum number of ops for each function is given in the
         header comment for each function. If there are any inconsistencies
         between the maximum ops in the writeup and in this file, consider
         this file the authoritative source.

    /*
     * STEP 2: Modify the following functions according the coding rules.
     *
     *   IMPORTANT. TO AVOID GRADING SURPRISES:
     *   1. Use the dlc compiler to check that your solutions conform
     *      to the coding rules.
     *   2. Use the BDD checker to formally verify that your solutions produce
     *      the correct answers.
     */


#endif
/* Copyright (C) 1991-2012 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* We do support the IEC 559 math functionality, real and complex.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/*
 * bitXor - x^y using only ~ and &
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {
    return ~(~x & ~y) & ~(x & y);
}
/*
 * thirdBits - return word with every third bit (starting from the LSB) set to 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 1
 */
int thirdBits(void) {
    int t = 0111;
    int p = (t << 9) | t;
    return (p << 18) | p;
}
/*
 * fitsShort - return 1 if x can be represented as a
 *   16-bit, two's complement integer.
 *   Examples: fitsShort(33000) = 0, fitsShort(-32768) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 1
 */
int fitsShort(int x) {
    int t = x >> 15;
    int q = t >> 16;
    return !(q ^ t);
}

/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x) {
    int t = x + 1;
    return !((t + t) | !t);
}
/*
 * fitsBits - return 1 if x can be represented as an
 *  n-bit, two's complement integer.
 *   1 <= n <= 32
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int fitsBits(int x, int n) {
    int p = ~0;
    int t = x >> n + p;
    int q = t >> 16;
    return !(q ^ t);
}
/*
 * upperBits - pads n upper bits with 1's
 *  You may assume 0 <= n <= 32
 *  Example: upperBits(4) = 0xF0000000
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 10
 *  Rating: 1
 */
int upperBits(int n) {
    int t = !!n;
    int p = t << 31;
    return p >> (n + ~0);
}
/*
 * anyOddBit - return 1 if any odd-numbered bit in word set to 1
 *   Examples anyOddBit(0x5) = 0, anyOddBit(0x7) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int anyOddBit(int x) {
    int t = 0xaa;
    t = t << 8 | t;
    t = t << 16 | t;
    int p = t & x;
    return !!p;
}
/*
 * byteSwap - swaps the nth byte and the mth byte
 *  Examples: byteSwap(0x12345678, 1, 3) = 0x56341278
 *            byteSwap(0xDEADBEEF, 0, 2) = 0xDEEFBEAD
 *  You may assume that 0 <= n <= 3, 0 <= m <= 3
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 25
 *  Rating: 2
 */
int byteSwap(int x, int n, int m) {
    int p = m << 3;
    int q = n << 3;
    int t = ((x >> p) ^ (x >> q)) & 0xff;
    return x ^ ((t << p) | (t << q));
}
/*
 * absVal - absolute value of x
 *   Example: absVal(-1) = 1.
 *   You may assume -TMax <= x <= TMax
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 4
 */
int absVal(int x) {
    int t = x >> 31;
    return (x + t) ^ t;
}
/*
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
    int t = x >> 31;
    int p = 1 << n;
    return (x + t + (p & t)) >> n;
}
/*
 * float_neg - Return bit-level equivalent of expression -f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_neg(unsigned uf) {
    unsigned sign = 0x80000000;
    unsigned res = uf ^ sign;
    unsigned ut = 0xff000000;
    if(ut < uf << 1) return uf;
    return res;
}
/*
 * logicalNeg - implement the ! operator, using all of
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4
 */
int logicalNeg(int x) {
    int t = ~x + 1;
    int p = (t | x) >> 31;
    return p + 1;
}
/*
 * bitMask - Generate a mask consisting of all 1's
 *   lowbit and highbit
 *   Examples: bitMask(5,3) = 0x38
 *   Assume 0 <= lowbit <= 31, and 0 <= highbit <= 31
 *   If lowbit > highbit, then mask should be all 0's
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int bitMask(int highbit, int lowbit) {
    int t = ~0;
    int a = (1 << highbit << 1) + t;
    int b = t << lowbit;
    return a & b;
}

/*
 * isGreater - if x > y  then return 1, else return 0
 *   Example: isGreater(4,5) = 0, isGreater(5,4) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isGreater(int x, int y) {
    int p = x ^ y;
    int t = x + ~y;
    return (~(t | p) | (p & y)) >> 31 & 1;
}
/*
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
int logicalShift(int x, int n) {
    int t = x >> n;
    int sign = 1 << 31 >> n;
    sign = ~(sign << 1);
    return t & sign;
}
/*
 * satMul2 - multiplies by 2, saturating to Tmin or Tmax if overflow
 *   Examples: satMul2(0x30000000) = 0x60000000
 *             satMul2(0x40000000) = 0x7FFFFFFF (saturate to TMax)
 *             satMul2(0x60000000) = 0x80000000 (saturate to TMin)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
int satMul2(int x) {
    int t = x << 1;
    int p = (x ^ t) >> 31;
    int tmin = 1 << 31;
    int q = tmin ^ (t >> 31);
    return (t & ~p) + (q & p);
}
/*
 * subOK - Determine if can compute x-y without overflow
 *   Example: subOK(0x80000000,0x80000000) = 1,
 *            subOK(0x80000000,0x70000000) = 0,
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
int subOK(int x, int y) {
    int t = ~y;
    int sub = x + t + 1;
    int op = x ^ t;
    int r = y ^ sub;
    return (op | r) >> 31 & 1;
}
/*
 * trueThreeFourths - multiplies by 3/4 rounding toward 0,
 *   avoiding errors due to overflow
 *   Examples: trueThreeFourths(11) = 8
 *             trueThreeFourths(-9) = -6
 *             trueThreeFourths(1073741824) = 805306368 (no overflow)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int trueThreeFourths(int x)
{
    int t = x & 3;
    x = x >> 2;
    int exp = x + (x << 1);
    int frac = t + t + t + (x >> 31 & 3) >> 2;
    return exp + frac;
}
/*
 * isPower2 - returns 1 if x is a power of 2, and 0 otherwise
 *   Examples: isPower2(5) = 0, isPower2(8) = 1, isPower2(0) = 0
 *   Note that no negative number is a power of 2.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int isPower2(int x) {
    int p = x + ~0;
    int t = x & p;
    int q = p >> 30;
    return !(t | q);
}
/*
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_i2f(int x)
{
    unsigned tmin = 0x80000000;
    unsigned sign = x & tmin;
    if(sign) x = -x;
    unsigned ux = x;
    if(!ux) return 0;
    unsigned shouldLeftShift = 159, temp = 0;
    do{
        temp = ux;
        ux = ux << 1;
        shouldLeftShift -- ;
    }while(temp < tmin);
    if((temp & 0x0ff) > 0x080 || (temp & 0x0180) == 0x0180)  sign += 1;
    return  sign + (shouldLeftShift << 23) + (ux >> 9);
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) {
    x = x ^ (x << 1);
    int gt16 = !!(x >> 16) << 4;
    x = x >> gt16;
    int gt8 = !!(x >> 8) << 3;
    x = x >> gt8;
    int gt4 = !!(x >> 4) << 2;
    x = x >> gt4;
    int gt2 = (!!(x >> 2) << 1) + 1;
    x = x >> gt2;
    int gt1 = x & 1;
    return gt16 + gt8 + gt4 + gt2 + gt1;
}
/*
 * float_half - Return bit-level equivalent of expression 0.5*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_half(unsigned uf) {
    unsigned b = (uf & 3) == 3;
    unsigned tmin = 0x80000000;
    unsigned p = 0x1000000, pm = 0xff000000;
    unsigned sign = uf & tmin;
    unsigned uft = uf << 1;
    unsigned exp = uft & pm;
    unsigned t = (uft >> 2) + b;
    if(exp == pm) return uf;
    else if(exp <= p) uft = t;
    else uft = (uft - p) >> 1;
    return sign | uft ;
}