#!/bin/bash

file="$1"
separator="$2"

if [ ! -f "$file" ]; then
    echo "The file was not found"
    exit 1
fi

while IFS= read -r line; do
    IFS="$separator" read -ra fields <<< "$line"
    for (( i = 0; i < ${#fields[@]}; i++ )); do
        echo "field $((i+1)): ${fields[i]}"
        echo "field $((i+1)): ${fields[i]}" > log_file
    done
done < "$file"


