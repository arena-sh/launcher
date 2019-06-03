#!/bin/bash
cd platform/osx
./bundle.sh
if [ ! "$1" = "--dev" ];then
    ./pack.sh
fi
rm -rf tmp.app/
rm -rf tmp/
cd ../../
open release/osx
