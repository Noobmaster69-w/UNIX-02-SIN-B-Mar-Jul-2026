#!/bin/bash 
ls -l / | grep "bin"
SCRIPT_NAME="${0}"
TARGET="${1}"

echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping -c 3 "${TARGET}"
echo "The arguments are: $@"
echo "The total number of arguments is: $#"

for args in "$@"; do
    echo "${args}"
done