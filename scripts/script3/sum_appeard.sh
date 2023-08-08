#!/bin/bash

declare -A num_to_word
num_to_word=( [1]="one" [2]="two" [3]="three" [4]="four" [5]="five" [6]="six" [7]="seven" [8]="eight" [9]="nine" [10]="ten" )

declare -A count

read -p "Enter numbers separated by spaces: " input
IFS=" " read -ra numbers <<< "$input"

for num in "${numbers[@]}"; do
  if [[ "$num" =~ ^[1-9]$|^10$ ]]; then
    count[$num]=$((count[$num] + 1))
  else
    echo "Invalid number: $num"
  fi
done

echo "Input analysis:"
for num in "${!count[@]}"; do
  word="${num_to_word[$num]}"
  times="${count[$num]}"
  echo "$word appeared $times times"
done
