#!/bin/bash
# A script for preparing binaries for version release of Pokemon Cursors, by Abdulkaiz Khatri

key="Bug Fables"
comment="Bug Fables cursors."

# Cleanup old builds
rm -rf themes bin &&
ctgen build.toml -p x11 &&

# Building Pokemon Windows binaries
ctgen build.toml -p windows -s 32 -d "bitmaps/${key}" -n "${key}" -c "$comment"

# Compressing Binaries
mkdir -p bin &&
cd themes &&

tar -czvf "../bin/${key}.tar.gz" "${key}" &&
zip -rv "../bin/${key}-Windows.zip" "${key}-Windows" &&

cd ..
