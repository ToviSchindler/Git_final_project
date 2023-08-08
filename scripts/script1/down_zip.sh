#!/bin/bash

# Validate the number of arguments
if [ $# -lt 2 ]; then
   echo "Usage: down_zip.sh target_directory images urls"
   exit 1
fi

#validate the target directory exists
if [ ! -d "$1" ]; then
  echo "Target directory does not exist"
  exit 1
fi

#Create a time for the archive name
time=$(date +%Y%m%d%H%M%S)

#create a temporary directory to store the downloaded images
temp_dir=$(mktemp -d)

#Download the images and store them in the temporary directory
for ((i=2;i<=$#;i++)); do
  url=${!i}
  file_name=$(basename "$url")
  if wget --no-check-certificate -P "$temp_dir/$filename" "$url";then 
    echo "download successfully"
  fi
done

#Create the archive with the downloaded images
archive_name="download_$time.zip"
zip -r "$archive_name" "$temp_dir"

#Move the archive to the target directory
mv "$archive_name" "$1"

#Clean up the temporary directory
# rm -r "$temp_dir"

echo "Downloaded images have been archived as $1/$archive_name"
