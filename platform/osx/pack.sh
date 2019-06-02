#!/bin/bash
set -e
SOURCE_APP=../../release/osx/Arena.app
DEST=../../release/osx/ArenaSH.dmg
mkdir -p tmp/
cp -r $SOURCE_APP tmp/
cp app.icns tmp/
cp dmg_bg.png tmp/

# Create the DMG
./create-dmg \
--volname "ArenaSH Installer" \
--volicon "app.icns" \
--background "dmg_bg.png" \
--window-pos 200 120 \
--window-size 800 413 \
--eula "../../eula.txt" \
--icon-size 100 \
--icon "Arena.app" 200 190 \
--hide-extension "Arena.app" \
--app-drop-link 580 185 \
"$DEST" \
"tmp/"
