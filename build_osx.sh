#!/bin/bash
cd platform/osx
./bundle.sh
if [ ! "$1" = "--dev" ];then
    ./pack.sh
fi
cd ../../
open release/osx
