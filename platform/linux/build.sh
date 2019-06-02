#!/bin/bash
rm -rf build/
python setup.py build
dest=$(ls build)
cp setup.sh build/$dest/
cp arena.desktop build/$dest/
mkdir -p ../../release/linux
./makeself.sh --license ../../eula.txt build/$dest/ ../../release/linux/ArenaSH_setup.run "ArenaSH Launcher" ./setup.sh
