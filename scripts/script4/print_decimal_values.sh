#!/bin/bash
declare -A alphabet_values
# Fill the associative array with the decimal values of letters
for ((i=97; i<=122; i++)); do
  alphabet_values["$(printf \\$(printf '%03o' "$i"))"]=$i
done
if [[ $# -gt 0 ]]; then
  if [[ $1 == "-"* ]]; then
    shift
  fi
  for letter in "$@"; do
    if [[ ${alphabet_values[$letter]+isset} ]]; then
      echo "$letter = ${alphabet_values[$letter]}"
      echo "$letter = ${alphabet_values[$letter]}" > log_file
    else
      echo "Invalid input: $letter"
      echo "Invalid input: $letter">log_file
  fi
  done
else
  read -p "Enter letters: " input
  for letter in $input; do
    if [[ ${alphabet_values[$letter]+isset} ]]; then
       echo "$letter = ${alphabet_values[$letter]}"
       echo "$letter = ${alphabet_values[$letter]}">log_file
    else
      echo "Invalid input: $letter"
      echo "Invalid input: $letter" > log_file
    fi
  done
fi

