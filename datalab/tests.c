/* Testing Code */

#include <limits.h>
#include <math.h>

/* Routines used by floation point test code */

/* Convert from bit level representation to floating point number */
float u2f(unsigned u) {
  union {
    unsigned u;
    float f;
  } a;
  a.u = u;
  return a.f;
}

/* Convert from floating point number to bit-level representation */
unsigned f2u(float f) {
  union {
    unsigned u;
    float f;
  } a;
  a.f = f;
  return a.u;
}

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
int test_bitXor(int x, int y)
{
  return x^y;
}
int test_thirdBits(void) {
  int result = 0;
  int i;
  for (i = 0; i < 32; i+=3)
    result |= 1<<i;
  return result;
}
int test_fitsShort(int x)
{
  short int sx = (short int) x;
  return x == sx;
}
int test_isTmax(int x) {
    return x == 0x7FFFFFFF;
}
int test_fitsBits(int x, int n)
{
  int TMin_n = -(1 << (n-1));
  int TMax_n = (1 << (n-1)) - 1;
  return x >= TMin_n && x <= TMax_n;
}
int test_upperBits(int x) {
  int result = 0;
  int i;
  for (i = 0; i < x; i++)
    result |= (1 << (31-i));
  return result;
}
int test_anyOddBit(int x) {
    int i;
    for (i = 1; i < 32; i+=2)
        if (x & (1<<i))
      return 1;
    return 0;
}
int test_byteSwap(int x, int n, int m)
{
    /* little endiamachine */
    /* least significant byte stored first */
    unsigned int nmask, mmask;
    switch(n) {
    case 0:
      nmask = x & 0xFF;
      x &= 0xFFFFFF00;
      break;
    case 1:
      nmask = (x & 0xFF00) >> 8;
      x &= 0xFFFF00FF;
      break;
    case 2:
      nmask = (x & 0xFF0000) >> 16;
      x &= 0xFF00FFFF;
      break;
    default:
      nmask = ((unsigned int)(x & 0xFF000000)) >> 24;
      x &= 0x00FFFFFF;
      break;
    }
    switch(m) {
    case 0:
      mmask = x & 0xFF;
      x &= 0xFFFFFF00;
      break;
    case 1:
      mmask = (x & 0xFF00) >> 8;
      x &= 0xFFFF00FF;
      break;
    case 2:
      mmask = (x & 0xFF0000) >> 16;
      x &= 0xFF00FFFF;
      break;
    default:
      mmask = ((unsigned int)(x & 0xFF000000)) >> 24;
      x &= 0x00FFFFFF;
      break;
    }
    nmask <<= 8*m;
    mmask <<= 8*n;
    return x | nmask | mmask;
}
int test_absVal(int x) {
  return (x < 0) ? -x : x;
}
int test_divpwr2(int x, int n)
{
    int p2n = 1<<n;
    return x/p2n;
}
unsigned test_float_neg(unsigned uf) {
    float f = u2f(uf);
    float nf = -f;
    if (isnan(f))
 return uf;
    else
 return f2u(nf);
}
int test_logicalNeg(int x)
{
  return !x;
}
int test_bitMask(int highbit, int lowbit)
{
  int result = 0;
  int i;
  for (i = lowbit; i <= highbit; i++)
    result |= 1 << i;
  return result;
}
int test_isGreater(int x, int y)
{
  return x > y;
}
int test_logicalShift(int x, int n) {
  unsigned u = (unsigned) x;
  unsigned shifted = u >> n;
  return (int) shifted;
}
int test_satMul2(int x)
{
  if ((x+x)/2 != x)
    return x < 0 ? 0x80000000 : 0x7FFFFFFF;
  else
    return 2*x;
}
int test_subOK(int x, int y)
{
  long long ldiff = (long long) x - y;
  return ldiff == (int) ldiff;
}
int test_trueThreeFourths(int x)
{
  return (int) (((long long int) x * 3)/4);
}
int test_isPower2(int x) {
  int i;
  for (i = 0; i < 31; i++) {
    if (x == 1<<i)
      return 1;
  }
  return 0;
}
unsigned test_float_i2f(int x) {
  float f = (float) x;
  return f2u(f);
}
int test_howManyBits(int x) {
    unsigned int a, cnt;
    x = x<0 ? -x-1 : x;
    a = (unsigned int)x;
    for (cnt=0; a; a>>=1, cnt++)
        ;
    return (int)(cnt + 1);
}
unsigned test_float_half(unsigned uf) {
  float f = u2f(uf);
  float hf = 0.5*f;
  if (isnan(f))
    return uf;
  else
    return f2u(hf);
}
