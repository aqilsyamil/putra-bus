#!/bin/bash

# Get the operating system name
os=$(uname)

# Assuming $1 is the relative path passed as input

# Using realpath
absolute_path_realpath=$(realpath "$1")

if [ "$os" = "Linux" ]; then
    # Linux path format
    windows_path=${absolute_path_realpath/\/mnt\//}
    windows_path=${windows_path/\//\\}
elif [ "$os" = "Darwin" ]; then
    # macOS path format
    windows_path=${absolute_path_realpath/\/Volumes\//}
    windows_path=${windows_path/\//\\}
else
    # Windows path format
    windows_path=$(echo "$absolute_path_realpath" | sed 's|^/|\c:/|' | tr '/' '\\')
fi

echo $windows_path