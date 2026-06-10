#!/bin/bash 
SIGNAL_TO_STOP_FILE="stoploop" #we define a variable representing the name of the file for which the while loop

while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do #checks, using a file test operator.
#The loop won’t exit until the condition is satisfied. Once the file is available, the loop will stop,
#and the script will continue to the echo command
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exis
t..."
    echo "Checking again in 2 seconds..."
    sleep 2
done

echo "File was found! Exiting..." #save this file as while_loop.sh and run it: