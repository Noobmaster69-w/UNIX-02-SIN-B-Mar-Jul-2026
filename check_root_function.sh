#!/bin/bash
# This function checks if the current user ID equals zero. 
check_if_root(){  

    if [[ "${EUID}" -eq "0" ]]; then # Comprueba si el ID de usuario efectivo es igual a 0 
        return 0 # Si es igual a 0, la función termina exitosamente devolviendo un código de estado 0.
    else
        return 1 # Si no es igual a 0, la función termina devolviendo un código de estado 1 
    fi
} # Cierra la definición de la función.

if check_if_root; then # Llama a la función 'check_if_root' dentro de un 'if'. En Bash, si una función devuelve 0, es verdadero
    echo "User is root!" # Si la función devolvió 0, se ejecuta esta línea
else
    echo "User is not root!" # Si la función devolvió 1, se ejecuta esta línea
fi #cierra el bloque de condicion