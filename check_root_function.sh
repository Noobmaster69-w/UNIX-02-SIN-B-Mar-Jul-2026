#!/bin/bash
# This function checks if the current user ID equals zero. 
check_if_root(){  

    # Checks if the Effective User ID is equal to 0 
    if [[ "${EUID}" -eq "0" ]]; then 
        # If it is equal to 0, the function terminates successfully, returning an exit status of 0
        return 0 
    else
        # If it is not equal to 0, the function terminates, returning an exit status of 1 
        return 1 
    fi
} # Closes the function definition.

# Calls the 'check_if_root' function inside an 'if' statement. In Bash, an exit status of 0 evaluates to TRUE.
if check_if_root; then 
    # If the function returned 0, this line is executed.
    echo "User is root!" 
else
    # If the function returned 1, this line is executed.
    echo "User is not root!" 
fi # Closes the conditional block.

adduser Bryan_M # Add a user, and it will ask for a password
su - Bryan_M # it changes the user
exit #logout the user

