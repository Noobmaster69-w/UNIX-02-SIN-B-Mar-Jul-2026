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