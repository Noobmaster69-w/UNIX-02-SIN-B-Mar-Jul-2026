#!/bin/bash

USER_INPUT="${0}" # Asigna el primer argumento pasado por la línea de comandos a la variable USER_INPUT.

if [[ -z "${USER_INPUT}" ]]; then # Comprueba si la variable USER_INPUT está vacía 
    echo "You must provide an argument!" # Muestra un mensaje de error si el usuario no proporcionó ningún argumento
    exit 1 # Termina la ejecución del script inmediatamente con un código de salida 1 
fi # Cierra el primer bloque condicional 

if [[ -f "${USER_INPUT}" ]]; then # Comprueba si la ruta guardada en USER_INPUT existe y corresponde a un archivo regular 
    echo "${USER_INPUT} is a file."  # Muestra en pantalla que el argumento es un archivo

elif [[ -d "${USER_INPUT}" ]]; then # Si no es un archivo, comprueba si la ruta corresponde a un directorio existente 
    echo "${USER_INPUT} is a directory." # Muestra en pantalla que el argumento es un directorio
else  # Si no se cumple ninguna de las condiciones anteriores 
    echo "${USER_INPUT} is not a file or a directory." # Muestra en pantalla que no se reconoce como un archivo o directorio válido.
fi # Cierra el primer bloque condicional 
