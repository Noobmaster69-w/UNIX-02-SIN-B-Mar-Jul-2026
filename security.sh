id #Displays the user and groups IDs
cat /etc/passwd | head -10 #Reads the password file and shows the first 10 lines
cat /etc/group | head -10   # Shows the first 10 entries of /etc/group, which contains system group definitions and members
groups # Displays all groups that the current user belongs to
groups $USER # Shows the group memberships of the user stored in the $USER environment variable