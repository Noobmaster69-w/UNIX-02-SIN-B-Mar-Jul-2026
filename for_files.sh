#!/bin/bash

# Recorre todos los archivos que empiecen con "example_file".
for file in example_file*; do

    # Si el archivo es exactamente "example_file1"...
    if [[ "${file}" == "example_file1" ]]; then
        echo "Skipping the first file" # Muestra un mensaje en pantalla.
        continue                       # Salta al siguiente archivo del bucle.
    fi

    # Escribe un número aleatorio dentro del archivo actual (sobrescribiendo su contenido).
    echo "${RANDOM}" > "${file}"

done