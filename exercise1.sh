#!/bin/bash

# assign arguments to variables
FIRST_NAME="$1"
LAST_NAME="$2"

# create output.txt and write the date
date +"%d-%m-%Y" > output.txt

#write the full name to output.txt
echo "$FIRST_NAME $LAST_NAME" >> output.txt

#create the backup
cp output.txt backup.txt

# print the contents of output.txt
cat output.txt