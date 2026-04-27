ls -a #short option
ls --all #more descriptive form
 
ls #List visible files
- , -- #long option , short option
a, all #everything
ls -l #shows long format files
ls -a #show all files
ls -h #human readable
ls -lah #combination of three commonly used options
rm -rf #forcibly delete files
mkdir -- -rf #create a folder called -rf, using -- to indicate that -rf is a name and not an option
rmdir -- -rf #Delete a folder named -rf, using -- to indicate that -rf is a name and not an optionls
ls --help #Quick summary, fits on one screen
man ls #complete manual
man git-clone #It displays the manual for the git clone command, which is used to copy a Git repository.
/--depth #Clones a repository into a newly created directory, creates remote-tracking branches for each branch in the cloned repository (visible using
       #git branch --remotes), and creates and checks out an initial branch that is forked from the cloned repository’s currently active branch.

       #After the clone, a plain git fetch without arguments will update all the remote-tracking branches, and a git pull without arguments will in
       #addition merge the remote master branch into the current master branch, if any (this is untrue when "--single-branch" is given; see below).

       #This default configuration is achieved by creating references to the remote branch heads under refs/remotes/origin and by initializing
       #remote.origin.url and remote.origin.fetch configuration variables.
chmod # Command used to change file/directory access permissions       
chmod +x script.sh #Adds execute permission for everyone
chmod u+x script.sh #Adds execute permission ONLY for the User 
chmod o-r script.sh #Removes read permission for Others 
chmod u+rw,go-rwx script.sh #Sets read/write for User, and removes all permissions for Group and Others

umask #defines the default permissions assigned to new files and directories.
touch archivo1 #creates an empty file named archivo1 if it does not exist, or updates its modification timestamp if it already exists.
mkdir directorio1 #creates a new directory named directorio1.

total 48
-rw-rw-rw-  1 codespace root      34523 Apr 13 12:16 LICENSE
-rw-rw-rw-  1 codespace root         70 Apr 13 12:16 README.md
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:33 archivo1
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:34 directorio1
-rwx------  1 codespace codespace  1838 Apr 27 12:33 script.sh

umask 027 #ets default permissions so that new files are not accessible to others and only readable by the group.
touch archivo2 #creates an empty file named archivo2 if it does not exist, or updates its modification timestamp if it already exists.
mkdir dircetorio2 #creates a new directory named directorio2.

total 52
-rw-rw-rw-  1 codespace root      34523 Apr 13 12:16 LICENSE
-rw-rw-rw-  1 codespace root         70 Apr 13 12:16 README.md
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:33 archivo1
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:36 archivo2
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:34 directorio1
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:36 directorio2
-rwx------  1 codespace codespace  1925 Apr 27 12:36 script.sh

umask 077 #sets default permissions so that new files and directories are accessible only by the owner.
touch secreto.txt #Creates an empty file named secreto.txt.
mkdir privado #creates a new directory named privado.

total 56
-rw-rw-rw-  1 codespace root      34523 Apr 13 12:16 LICENSE
-rw-rw-rw-  1 codespace root         70 Apr 13 12:16 README.md
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:33 archivo1
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:36 archivo2
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:34 directorio1
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:36 directorio2
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:38 privado
-rwx------  1 codespace codespace  1925 Apr 27 12:36 script.sh
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:37 secreto.txt

sudo apt-get update #Updates the package list from repositories.
sudo apt-get upgrade # Upgrades installed packages to the latest versions.
sudo apt-get install acl # Installs the ACL package for advanced file permissions management.
sudo chown -R $(whoami) . # Changes ownership of all files in the current directory to the current user.
sudo setfacl -bnR . # Removes all ACL permissions recursively from the current directory.
whoami # Displays the current username.
echo "Hola" > mi_archivo # Writes "Hola" into mi_archivo, overwriting its content.
ls -l mi_archivo # Shows detailed information about mi_archivo.
sudo useradd -m -s /usr/bin/zsh luna # Creates a new user named luna with a home directory and zsh as the default shell.
sudo chown luna mi_archivo # Changes the owner of mi_archivo to user luna.



