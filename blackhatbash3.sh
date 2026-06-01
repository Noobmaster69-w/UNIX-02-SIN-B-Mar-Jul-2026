#!/bin/bash 
book="black hat bash"
echo "This book's name is ${book}"
#[Bryan-Merino] UNIX-02-SIN-B-Mar-Jul-2026 ✓ $ bash  -x blackhatbash3.sh
#+ book='black hat bash'
#+ echo 'This book'\''s name is black hat bash'
#This book's name is black hat bash
root_directory=$(ls -ld /)
echo "${root_directory}"
book="Black Hat Bash"
unset book
echo "${book}"
#+ book='black hat bash'
#+ echo 'This book'\''s name is black hat bash'
#This book's name is black hat bash
#++ ls -ld /
#+ root_directory='drwxr-xr-x 1 root root 4096 jun  1 12:38 /'
#+ echo 'drwxr-xr-x 1 root root 4096 jun  1 12:38 /'
#drwxr-xr-x 1 root root 4096 jun  1 12:38 /
#+ book='Black Hat Bash'
#+ unset book
#+ echo '