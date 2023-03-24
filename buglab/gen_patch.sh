#!/usr/bin/sh
echo $1.cpp
diff -upN buggy/$1.cpp fixed/$1.cpp
