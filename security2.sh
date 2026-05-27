id #View current main group
id -gn #only the name of the main group
touch ~/test_grupo_heredado.txt #Create a file and see which group inherits
ls -la ~/test_grupo_heredado.txt #is the user's primary group
echo "Grupo actual: $(id -gn)" #see the current group
touch ~/antes_de_newgrp.txt #Create a file before newgrp
ls -la ~/antes_de_newgrp.txt