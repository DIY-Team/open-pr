#!/bin/sh

swift build -c release
cd .build/release
cp -f OpenPR /usr/local/bin/open-pr
cd ..

