#!/bin/bash

declare -A numbers

num_words=("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten")

while true; do
    read -p "enter a numbers between 1 and 10(or E to exit): " input

    #to exit
    if [ "$input" == "E" ]; then 
        break
    fi

    #checking valid input
    if ! [[ "$input" =~ ^[0-9]$|^10$ ]]; then
        echo "invalid input"
        continue
    fi

    numbers[$input]=$((${numbers[$input]} + 1))

done


#print the results
for num in "${!numbers[@]}"; do
    count=${numbers[$num]}
    word="${num_words[$num]}"
    if [ "$count" -eq 1 ]; then
        echo "$word appeard 1 time"
    else
        echo "$word appeard $count times"
    fi
done
