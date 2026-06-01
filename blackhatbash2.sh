#!/bin/bash
# All this script does is create a directory, create a file
# within the directory, and then list the contents of the directory.
set -x
mkdir -p mydirectory
touch mydirectory/myfile
ls -l mydirectory
set +x
#bash -x blackhatbash2.sh # Runs the script in debug mode to display each command on screen before execution.
#+ mkdir -p mydirectory # Debug output: creates the directory safely without throwing an error if it already exists.
#+ touch mydirectory/myfile # Debug output: creates the empty file or updates its timestamp inside the directory.
#+ ls -l mydirectory # Debug output: lists the contents of the target directory in long format.
#total 0 # Command output: shows that the total block storage size used by the listed files is zero.
#-rw-rw-rw- 1 root root 0 jun  1 13:25 myfile # Command output: shows permissions, owner, size, date, and name of the created file.
#[Bryan-Merino] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ #bash -n blackhatbash2.sh # Checks the script for syntax errors and returns no output because the code is valid.
#[Bryan-Merino] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ #bash blackhatbash2.sh # Executes the script normally, which triggers the internal debug mode configuration.
#+ mkdir -p mydirectory # Debug output: safely verifies or creates the directory again during normal execution.
#+ touch mydirectory/myfile # Debug output: updates the file modification time to the current timestamp.
#+ ls -l mydirectory # Debug output: runs the long listing command to verify the folder status.
#total 0 # Command output: confirms the directory block usage size remains zero.
#-rw-rw-rw- 1 root root 0 jun  1 13:26 myfile # Command output: displays the updated file metadata showing the new timestamp of 13:26.
#+ set +x # Disables the active debug tracing mode to restore standard terminal output.