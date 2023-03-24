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
int bitXor(int, int);
int test_bitXor(int, int);
int thirdBits();
int test_thirdBits();
int fitsShort(int);
int test_fitsShort(int);
int isTmax(int);
int test_isTmax(int);
int fitsBits(int, int);
int test_fitsBits(int, int);
int upperBits(int);
int test_upperBits(int);
int anyOddBit();
int test_anyOddBit();
int byteSwap(int, int, int);
int test_byteSwap(int, int, int);
int absVal(int);
int test_absVal(int);
int divpwr2(int, int);
int test_divpwr2(int, int);
unsigned float_neg(unsigned);
unsigned test_float_neg(unsigned);
int logicalNeg(int);
int test_logicalNeg(int);
int bitMask(int, int);
int test_bitMask(int, int);
int isGreater(int, int);
int test_isGreater(int, int);
int logicalShift(int, int);
int test_logicalShift(int, int);
int satMul2(int);
int test_satMul2(int);
int subOK(int, int);
int test_subOK(int, int);
int trueThreeFourths(int);
int test_trueThreeFourths(int);
int isPower2(int);
int test_isPower2(int);
unsigned float_i2f(int);
unsigned test_float_i2f(int);
int howManyBits(int);
int test_howManyBits(int);
unsigned float_half(unsigned);
unsigned test_float_half(unsigned);
