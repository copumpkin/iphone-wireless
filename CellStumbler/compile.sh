#!/bin/sh
arm-apple-darwin-gcc main.c -framework CoreTelephony -framework CoreFoundation
mv a.out cellstumbler
./upload.sh
