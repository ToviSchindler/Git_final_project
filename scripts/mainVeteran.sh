#!/bin/bash
while getopts ":1:2:3!4:5!6!" opt; do
  case $opt in
    1)
      echo "Running Task 1"
      cd script1
      shift
      ./down_zip.sh "$@"
      ;;
    2)
      echo "Running Task 2"
      cd script2
      ./divbysep.sh "$2" "$3"
      ;;
    3)
      echo "Running Task 3"
      cd script3
      ./sum_appeard.sh
      ;;
    4)
      echo "Running Task 4"
      cd script4
      shift
       ./print_decimal_values.sh "$@"
      ;;
    5)
      echo "Running Task 5"
      cd script5
      ./rnd_numbers_matrix.sh
      ;;
    6)
      echo "Running Task 6"
      cd script6
      ./print_info.sh
      ;;
    \?)
      echo "Invalid option"
      ;;
  esac
done
