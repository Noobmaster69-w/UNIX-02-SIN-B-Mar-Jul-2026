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
pwd #It shows me the directory where I am
whoami #It tells you which user you are logged in as
ls #see what's in the current directory
ls -l #List files and folders with detailed information
ls -la #List all files and folders with details
ls -lh #List files and folders with details and sizes in a readable format
ls -it #List files showing their inode number and sorted by modification date
ls / #ls absolute route
ls /etc | head -20 #displays the first 20 files in the directory
ls /dev | head -20 #It contains files that represent devices

sudo apt install -y git vim make gcc libncurses-dev flex bison bc \ cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86

gcc , make — #kernel compilation and BusyBox
libncurses-dev — #menús interactivos de configuración ( menuconfig )
flex , bison , bc — #required by the kernel build process
cpio  #to create the initramfs
libelf-dev , libssl-dev — #kernel dependencies
syslinux — #the bootloader
dosfstools — #to create the FAT filesystem
qemu-system-x86 — #to test the image without the need for real hardware

make -j 2 #It allows you to run the compilation process using 2 tasks in parallel to make it faster.
