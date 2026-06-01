id #View current main group
id -gn #only the name of the main group
touch ~/test_grupo_heredado.txt #Create a file and see which group inherits
ls -la ~/test_grupo_heredado.txt #is the user's primary group
echo "Grupo actual: $(id -gn)" #see the current group
touch ~/antes_de_newgrp.txt #Create a file before newgrp
ls -la ~/antes_de_newgrp.txt
#switch to the 'desarrolladores' group
newgrp desarrolladores #AQUI ME QUEDE
#verify that the active group changed
id -gn
echo "Nuevo grupo activo: $(id -gn)"
#create a file inside the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
#The group is now developers.
#Create a directory
mkdir -p ~/proyecto_dev/src
ls -la ~/ 

#proyecto_dev/ has a group of "desarrolladres"
#exit subshell
exit
#verify that we returned to the original group
id -gn
echo "Grupo restaurado: $(id-gn)"

#compare the two files
ls -la /home/vscode/antes_de_newgrp.txt /home/vscode/dentro_de_newgrp.txt

#newgrp creates a subshell
echo "PID del shell actual: $$"   
newgrp desarrolladores
echo "PID dentro de newgrp: $$"
#the PID is different -- it's a child process

#Create a password-protected group
sudo addgroup grupo_restringido
sudo gpasswd grupo_restringido
#The system will ask for a password for the group

#A user who does NOT belong to the group can join temporarily if they know the password.
newgrp grupo_restringido
#The system will ask for the group password.
#If the password is correct, they will join temporarily.
id -gn
exit #Upon leaving, they will lose their temporary membership.