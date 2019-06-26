#!/bin/bash
Xvfb :0 & 2> /dev/null
export DISPLAY=:0.0
cd platform/linux
./build.sh
