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