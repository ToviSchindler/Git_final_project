#!/bin/bash
row=0
column=0
count=$(grep -c '/bin/bash' /etc/passwd)
users=$(grep '/bin/bash' /etc/passwd)
declare -A USERS

for user in $users; do
IFS=":" read -ra user_split <<< "$user"
   for i in "${user_split[@]}"; do
      USERS[$row,$((column%7))]="$i"
      ((column++))
      done
  ((row++))
done


# Print the generated matrix
for ((i=0; i<$count; i++)); do
        for ((j=0;j<7;j++)) ; do
            printf "%s\t" "${USERS[$i,$j]}"
        done
        echo
done
