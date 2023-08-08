#!/bin/bash

# Function to print user information

print_user_info(){
  local username uid gid gecos home shell
  printf "%-15s%-5s%-5s%-25s%-25s%s\n" "Username" "UID" "GID" "GECOS" "Home" "Shell"
  
  while IFS=":" read -r username x uid gid gecos home shell; do
    if [[ $shell == "/bin/bash" ]]; then
      printf "%-15s%-5s%-5s%-25s%-25s%s\n" "$username" "$uid" "$gid" "$gecos" "$home" "$shell"
      printf "%-15s%-5s%-5s%-25s%-25s%s\n" "$username" "$uid" "$gid" "$gecos" "$home" "$shell" > log_file
    fi
  done < /etc/passwd
}


print_user_info
