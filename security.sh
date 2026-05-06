id #Displays the user and groups IDs
cat /etc/passwd | head -10 #Reads the password file and shows the first 10 lines
cat /etc/group | head -10   # Shows the first 10 entries of /etc/group, which contains system group definitions and members
groups # Displays all groups that the current user belongs to
groups $USER # Shows the group memberships of the user stored in the $USER environment variable
cat /etc/group # Attempts to display /etc/groups, but the correct file in Linux is /etc/group (system group information)
cat /etc/group | grep daemon # Searches for the "daemon" group in /etc/group and displays matching lines
mkdir ~/proyecto_unix/ # Creates a directory named "proyecto_unix" in the user's home folder
ls -la ~/proyecto_unix/ # Displays a long listing of all files, including hidden files, inside the ~/proyecto_unix directory
sudo groupadd desarrolladores #groupadd nombre_grupo
#Create a simple group
groupadd -g 2000 operaciones
groupadd --system servicios_web
#verify that they were created
grep "desarrolladores\|operaciones\|servicios_web" /etc/group
grep -E "desarrolladores|operaciones|servicios_web" /etc/group
#see main options
groupadd --help
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
#System groups have a GID lower than the minimum usage
#SYS_GID_MIN = 100
#SYS_GID_MAX = 999
#GID_MIN = 1000
#GID_MAX = 60000

#create groups with addgroup
addgroup diseno
addgroup -gid 2100 marketing
addgroup -system cache_web
#verify 
grep "diseno\|marketing\|cache_web" /etc/group
#See which groups the current user belongs to
groups
id
#add user to a group with usermod (low level)
usermod -aG desarrolladores $USER #
usermod -aG diseno $USER
#Using #USER gives an error because it doesn't contain anything; to fix this, we change it to root or #(whoami).