#!/bin/bash

# ==========================================
# SCRIPT DE CALIFICACIÓN AUTOMÁTICA (exercise2.sh)
# Ramo: UNIX-02-SIN-B-Mar-Jul-2026 | Rama: BlackHatBash
# Escala: 0 - 100
# ==========================================

echo "===================================================="
echo " INICIANDO EVALUACIÓN DE LA RAMA: BlackHatBash"
echo "===================================================="

# PARAMETRO OPCIONAL: Evaluar otra carpeta si se pasa como argumento
REPO_DIR="${1:-.}"
cd "$REPO_DIR" || { echo "❌ La carpeta especificada no existe"; exit 1; }

# --------------------------------------------------
# 1. EVALUACIÓN Y CONTEO DE COMMITS (Sobre 100)
# Lunes y Miércoles de 7:00 AM a 9:00 AM
# --------------------------------------------------
echo -e "\n[1/3] Analizando el historial de commits de la rama..."

COMMITS_EN_HORA=0
COMMITS_EN_DIA=0
COMMITS_FUERA_DIA=0
TOTAL_COMMITS=0

# Obtener los hashes de todos los commits en la rama actual
COMMIT_HASHES=$(git log --format="%H" 2>/dev/null)

if [ -z "$COMMIT_HASHES" ]; then
    echo "⚠️ No se detectaron commits en Git. Revisa si estás dentro del repositorio."
    NOTA_HORARIO=0
else
    # FECHA INTELIGENTE: Detectar automáticamente el día del último commit de la entrega
    ULTIMO_COMMIT_HASH=$(echo "$COMMIT_HASHES" | head -n 1)
    DIA_ENTREGA=$(git show -s --format="%Y-%m-%d" "$ULTIMO_COMMIT_HASH")
    
    echo "  📅 Fecha límite de entrega detectada (último commit): $DIA_ENTREGA"

    # Leer línea por línea los datos de cada commit
    while read -r hash; do
        [ -z "$hash" ] && continue
        ((TOTAL_COMMITS++))
        
        # Extraer datos del commit usando el formato correcto de Git
        COMMIT_DATE=$(git show -s --format="%Y-%m-%d" "$hash")
        COMMIT_DAY_NUM=$(git show -s --format="%u" "$hash") # 1=Lunes, 3=Miércoles
        COMMIT_HOUR=$(git show -s --format="%H%M" "$hash") # HHMM

        # Clasificar el commit comparándolo con el día de la entrega detectado
        if [ "$COMMIT_DATE" == "$DIA_ENTREGA" ] && { [ "$COMMIT_DAY_NUM" -eq 1 ] || [ "$COMMIT_DAY_NUM" -eq 3 ]; } && [ "$COMMIT_HOUR" -ge 0700 ] && [ "$COMMIT_HOUR" -le 0900 ]; then
            ((COMMITS_EN_HORA++))
        elif [ "$COMMIT_DATE" == "$DIA_ENTREGA" ]; then
            ((COMMITS_EN_DIA++))
        else
            ((COMMITS_FUERA_DIA++))
        fi
    done <<< "$COMMIT_HASHES"

    # Mostrar estadísticas solicitadas
    echo "   Total de commits evaluados: $TOTAL_COMMITS"
    echo "  ✓ Hechos en la hora de clase (07:00 - 09:00): $COMMITS_EN_HORA"
    echo "  ! Hechos en el día de clase (fuera de hora): $COMMITS_EN_DIA"
    echo "  ✘ Hechos fuera del día de clase: $COMMITS_FUERA_DIA"

    # Lógica de asignación de nota de horario (Escala 100)
    if [ "$COMMITS_EN_HORA" -gt 0 ]; then
        echo " 🎉 Tienes commits realizados a tiempo durante la clase!"
        NOTA_HORARIO=100
    elif [ "$COMMITS_EN_DIA" -gt 0 ]; then
        echo " ⚠️ No tienes commits en la hora exacta, pero sí dentro del día de clase."
        NOTA_HORARIO=70
    else
        echo " ✘ Todos tus commits fueron realizados en días distintos a la clase."
        NOTA_HORARIO=50
    fi
fi
echo "-> NOTA TIEMPO/HORARIO: $NOTA_HORARIO/100"


# --------------------------------------------------
# 2. EVALUACIÓN DE SINTAXIS Y EJECUCIÓN (Sobre 100)
# --------------------------------------------------
echo -e "\n[2/3] Evaluando sintaxis de los scripts (.sh)..."

TOTAL_SH=0
PASARON_SINTAXIS=0

for script in *.sh; do
    if [ "$script" == "exercise2.sh" ] || [ ! -f "$script" ]; then
        continue
    fi
    
    ((TOTAL_SH++))
    
    # Validar sintaxis silenciosamente
    bash -n "$script" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "  ✓ $script: Sintaxis correcta."
        ((PASARON_SINTAXIS++))
    else
        echo "  ✘ $script: Error de sintaxis detectado."
    fi
done

if [ $TOTAL_SH -gt 0 ]; then
    # Regla de tres sobre 100
    NOTA_SINTAXIS=$(echo "scale=2; ($PASARON_SINTAXIS / $TOTAL_SH) * 100" | bc)
else
    echo "⚠️ No se encontraron archivos .sh para evaluar."
    NOTA_SINTAXIS=0
fi
echo "-> NOTA SINTAXIS Y CALIDAD: $NOTA_SINTAXIS/100"


# --------------------------------------------------
# 3. EVALUACIÓN DE COMENTARIOS (Sobre 100 con piso mínimo de 50)
# --------------------------------------------------
echo -e "\n[3/3] Evaluando comentarios en los scripts..."

SCRIPTS_BIEN_COMENTADOS=0

for script in *.sh; do
    if [ "$script" == "exercise2.sh" ] || [ ! -f "$script" ]; then
        continue
    fi

    LINEAS_TOTALES=$(wc -l < "$script")
    LINEAS_COMENTARIOS=$(grep -c '#' "$script")
    
    # Busca palabras clave en inglés técnico
    KEYWORDS_INGLES=$(grep '#' "$script" | grep -iE -c '(loop|file|check|skip|variable|run|done|then|stop|empty|starting|error|output|input|condition|print|args|exist)')

    if [ "$LINEAS_TOTALES" -gt 0 ]; then
        if [ "$LINEAS_COMENTARIOS" -gt 0 ] && [ "$KEYWORDS_INGLES" -gt 0 ]; then
            echo "  ✓ $script: Comentarios válidos detectados en inglés técnico."
            ((SCRIPTS_BIEN_COMENTADOS++))
        else
            echo "  ! $script: Falta comentar el código o usar inglés técnico."
        fi
    fi
done

if [ $TOTAL_SH -gt 0 ]; then
    # Cálculo proporcional de la nota según los scripts bien comentados
    NOTA_COMENTARIOS=$(echo "scale=2; ($SCRIPTS_BIEN_COMENTADOS / $TOTAL_SH) * 100" | bc)
    
    # NUEVA REGLA: Si la nota calculada es menor a 50, se fuerza a un piso mínimo de 50
    if (( $(echo "$NOTA_COMENTARIOS < 50.0" | bc -l) )); then
        echo "  ℹ️ Nota de comentarios ajustada al piso mínimo de aprobación."
        NOTA_COMENTARIOS=50
    fi
else
    NOTA_COMENTARIOS=0
fi
echo "-> NOTA COMENTARIOS: $NOTA_COMENTARIOS/100"


# --------------------------------------------------
# RESUMEN FINAL Y NOTA DEFINITIVA
# --------------------------------------------------
echo -e "\n===================================================="
echo " RESUMEN DE CALIFICACIÓN"
echo "===================================================="
echo "1. Cumplimiento de Horario:  $NOTA_HORARIO / 100"
echo "2. Sintaxis y Estructura:     $NOTA_SINTAXIS / 100"
echo "3. Calidad de Comentarios:    $NOTA_COMENTARIOS / 100"
echo "----------------------------------------------------"

PROMEDIO_FINAL=$(echo "scale=2; ($NOTA_HORARIO + $NOTA_SINTAXIS + $NOTA_COMENTARIOS) / 3" | bc)

# Se corrigió la comilla rota de esta línea:
echo -e "PROMEDIO TOTAL OBTENIDO: \033[1;32m$PROMEDIO_FINAL / 100\033[0m"
echo "===================================================="