#! /bin/bash

# Check if letters are passed as arguments
if [ $# -eq 0 ]; then
   # Read the letters from user
   read -p "Enter alphabetical letters: " -a letters
else
   # Extract letters from the arguments
   letters=("$@")
fi

# Declare an associative array to store the decimal values
declare -A decimal_values

# Iterate over the letters and populate the associative array
for letter in "${letters[@]}"; do
   # Get the decimal value of the letter
   decimal_value=$(printf "%d" "'$letter'")

   # Store the decimal value in the associative array
   decimal_values["$letter"]=$decimal_value
done

#Print the decimal values
for letter in "${!decimal_values[@]}"; do
    echo "$letter = ${decimal_values[$letter]}"
done
