#!/bin/bash

file=$1
if [ "$file" == "app" ]; then
    path="C:\Users\rayha\OneDrive\Documents\dev-projects\putra-bus\apps"
    cd $path
    flutter run $file
else
    nx serve $file
fi