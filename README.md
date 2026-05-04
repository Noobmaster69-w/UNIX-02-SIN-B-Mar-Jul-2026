sudo apt update # Refreshes the local package list from software repositories to get the latest information about available updates and packages
sudo apt upgrade #Installs the newest versions of all currently installed packages using the updated package list
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86 #

#Para que sirve cada paquete
git                Version control system used to download and manage source code repositories.
vim                Terminal-based text editor used to create and modify configuration or source files.
make               Build automation tool that executes instructions defined in a Makefile.
gcc                Compiler that translates C source code into executable programs.
libncurses-dev     Library for creating text-based user interfaces in the terminal (required for menuconfig).
flex               Tool that generates lexical analyzers used during software compilation.
bison              Tool that generates parsers (syntax analyzers), often used together with flex.
bc                 Command-line calculator used by build scripts for mathematical operations.
cpio               Archiving tool used to create and extract files, commonly for initramfs images.
libelf-dev         Library for handling ELF files, the standard executable format in Linux.
libssl-dev         Cryptography and SSL library used for security features and digital signatures.
syslinux           Lightweight bootloader used to boot operating systems from disks or USB drives.
dosfstools         Utilities for creating and checking FAT file systems.
qemu-system-x86    Emulator/virtualizer used to run x86 operating systems in virtual machines.

git clone --depth 1 https://github.com/torvalds/linux.git #Downloads a lightweight copy of the latest Linux kernel source code from #GitHub without the full commit history
cd linux # Change to linux directory
make menuconfig # Opens a terminal-based configuration menu to customize kernel build options before compiling the Linux kernel
make -j 2 #Compiles the project using two parallel jobs to speed up the build process by utilizing multiple CPU cores
sudo mkdir /boot-files # Create a directory in the root filesystem to store boot/kernel files
sudo cp arch/x86/boot/bzImage /boot-files/ # Copy the compiled Linux kernel image to the boot-files directory
cd .. # Move one directory up (go to parent directory)
git clone --depth 1 https://git.busybox.net/busybox # Clone BusyBox repository with shallow depth (only latest version)
cd busybox # Change directory into the BusyBox folder
make menuconfig # Open interactive configuration menu for BusyBox
make -j 2 # Compile BusyBox using 2 parallel jobs to speed up the build
nano .config # Disable TC feature to fix compilation error and rebuild BusyBox
sudo mkdir /boot-files/initramfs # Create directory for initramfs build files
sudo make CONFIG_PREFIX=/boot-files/initramfs install # Install BusyBox into initramfs root filesystem
cd /boot-files/initramfs # Enter initramfs root directory
sudo vi init # Init script for BusyBox initramfs
#!/bin/sh #The first line tells the kernel to use the shell to interpret the file
/bin/sh #The second line simply starts an interactive shell.
sudo rm linuxrc #Remove the default BusyBox symlink to avoid conflicts with the custom init script
sudo chmod +x init #Grant execution permissions to the init script to allow the Kernel to launch it as the first process 
sudo find . | cpio -o -H newc > ../init.cpio #The cpio command successfully executed, archiving the filesystem into the init.cpio #file.
cd #Return to the home directory
sudo su #Escalate privileges to the root user
dd if=/dev/zero of=boot bs=1M count=50 #Create a 50MB empty disk image using dd to serve as the bootable storage medium
mkfs -t fat boot #Format the boot image with a FAT filesystem to ensure compatibility with bootloaders and system firmwares
syslinux boot #Install the Syslinux bootloader onto the boot image to make it bootable.

mkdir m #Create a temporary directory to serve as a mount point
mount boot m #Mount the 50MB boot image to the temporary directory
cp bzImage init.cpio m #Copy the Linux kernel and the initramfs into the bootable image
umount m #Unmount the directory to flush all data to the disk image and finalize the process.
qemu-system-x86_64 -nographic -append "console=ttyS0" \
-kernel bzImage -initrd init.cpio -drive file=boot,format=raw #Launch the custom Linux kernel and initramfs using QEMU with the 50MB #boot image attached as a raw drive

P.D: Profe Buenas noches disculpe que haya hecho los commits atrasados, lo que pasa es que el dia que se hizo esto en clases yo no fui por que dijo que no iba a asistir y yo vivo lejos, Disculpe profe buen dia