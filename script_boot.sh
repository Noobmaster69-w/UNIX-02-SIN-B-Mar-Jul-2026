cd #change directory
cd /home/codespace #Move directly to the main folder
cd ~ #go to home directory
cd $HOME #Save the path to your home folder in a variable called HOME
mkdir proyecto #Create a directory called "proyecto"
cd proyecto/ #enter the directory called project
ls -lai #List all files and folders with detailed information
total 12
925546 drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:37 .
918515 drwxr-x--- 1 codespace codespace 4096 Apr  6 12:37 ..
stat . #Show detailed information about the current directory
mkdir -p /tmp/prueba/sub1 /tmp/prueba/sub2 #Create the sub1 and sub2 folders inside /tmp/test, also creating the intermediate folders if they do not exist
stat /tmp/prueba #Show detailed information for the /tmp/test directory
man mkdir #Show the manual for the mkdir command
