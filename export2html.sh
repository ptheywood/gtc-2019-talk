#!/bin/bash

cd "$(dirname "$0")"

bs e presentation.md

if [ -d "dist/img" ]; then 
    rm -r "dist/img"
fi 
cp -r img dist/img

if [ -d "dist/video" ]; then 
    rm -r "dist/video"
fi 
cp -r video dist/video
