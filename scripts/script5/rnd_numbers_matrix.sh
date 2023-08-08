#!/bin/bash
#genarate random matrix dimensions
rows=$((1+RANDOM%10))
columns=$((1+RANDOM%10))
#Initialize the matrix as an associative array
declare -A matrix
#populate the matrix with random numbers
for ((i=0;i<rows;i++)); do
   for ((j=0;j<columns;j++)); do
      matrix[$i,$j]=$((RANDOM%100 + 1))
   done
done
#print the matrix in a nice matrix format to cli and to a file name log_file
for ((i=0;i<rows;i++)); do
  for ((j=0;j<columns;j++)); do
      printf "%5s" ${matrix[$i,$j]}
      printf "%5s" ${matrix[$i,$j]} >> log_file
  done
  echo ""
  echo >> log_file
done
echo >> log_file

