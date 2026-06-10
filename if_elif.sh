#!/bin/bash
# Indicates to the system that this script should be executed using the Bash interpreter.

# Assigns the first argument passed from the command line ($1) to the USER_INPUT variable.
USER_INPUT="${0}" 

# Checks if the USER_INPUT variable is empty 
if [[ -z "${USER_INPUT}" ]]; then 
    # Displays an error message if the user did not provide any argument
    echo "You must provide an argument!" 
    # Terminates the script execution immediately with an exit code of 1 
    exit 1 
fi # Closes the first conditional block (if).

# Checks if the path stored in USER_INPUT exists and corresponds to a regular file 
if [[ -f "${USER_INPUT}" ]]; then 
    # Prints to the screen that the argument is a file.
    echo "${USER_INPUT} is a file."  

# If it is not a file, checks if the path corresponds to an existing directory 
elif [[ -d "${USER_INPUT}" ]]; then 
    # Prints to the screen that the argument is a directory.
    echo "${USER_INPUT} is a directory." 
    
# If none of the above conditions are met 
else  
    # Prints to the screen that it is not recognized as a valid file or directory.
    echo "${USER_INPUT} is not a file or a directory." 
fi # Closes the second conditional block 