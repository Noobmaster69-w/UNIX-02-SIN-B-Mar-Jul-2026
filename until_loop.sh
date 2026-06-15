#!/bin/bash

FILE="output.txt"
touch "${FILE}"
until [[ -s "${FILE}" ]]; do
 echo "${FILE} is empty..."
 echo "Checking again in 2 seconds..."
 sleep 2
done
echo "${FILE} appears to have some content in it!"


for index in $(seq 1 10); do
 echo "${index}"
done
