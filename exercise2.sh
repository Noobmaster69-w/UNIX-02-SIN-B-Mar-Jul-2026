#!/bin/bash

# ==============================================================================
# AUTOMATIC GRADING SCRIPT (exercise2.sh)
# Course: UNIX-02-SIN-B-Mar-Jul-2026 | Branch: BlackHatBash
# Scale: 0 - 100 
# ==============================================================================

# Print evaluation header to the terminal
echo "===================================================="
echo " STARTING BRANCH EVALUATION: BlackHatBash"
echo "===================================================="

# OPTIONAL PARAMETER: Fallback to current directory if no target directory is passed
REPO_DIR="${1:-.}"
# Navigate into the target directory or terminate the script with an error code if it does not exist
cd "$REPO_DIR" || { echo "❌ The specified directory does not exist"; exit 1; }

# ------------------------------------------------------------------------------
# 1. COMMIT TIMING AND COUNT EVALUATION (Scale 0-100, Minimum Floor 50)
# Schedule: Mondays and Wednesdays from 7:00 AM to 9:00 AM
# ------------------------------------------------------------------------------
echo -e "\n[1/3] Analyzing repository commit history..."

# Initialize counters for different commit classifications
COMMITS_EN_HORA=0
COMMITS_EN_DIA=0
COMMITS_FUERA_DIA=0
TOTAL_COMMITS=0

# Fetch all commit hashes from the active Git branch log
COMMIT_HASHES=$(git log --format="%H" 2>/dev/null)

# Verify if the current directory is a valid Git repository containing commits
if [ -z "$COMMIT_HASHES" ]; then
    echo "⚠️ No Git commits detected. Please ensure you are inside the correct repository folder."
    NOTA_HORARIO=50
else
    # INTELLIGENT TIMELINE SYSTEM: Extract the timestamp from the most recent commit as the baseline deadline
    ULTIMO_COMMIT_HASH=$(echo "$COMMIT_HASHES" | head -n 1)
    DIA_ENTREGA=$(git show -s --format="%Y-%m-%d" "$ULTIMO_COMMIT_HASH")
    
    echo "  📅 Inferred delivery baseline date (latest commit): $DIA_ENTREGA"

    # Loop through each commit hash sequentially using a Here-String redirection
    while read -r hash; do
        # Skip empty lines to prevent runtime errors
        [ -z "$hash" ] && continue
        # Increment total commit counter
        ((TOTAL_COMMITS++))
        
        # Extract metadata (date, weekday number where 1=Mon and 3=Wed, and time in HHMM format) for each commit
        COMMIT_DATE=$(git show -s --format="%Y-%m-%d" "$hash")
        COMMIT_DAY_NUM=$(git show -s --format="%u" "$hash")
        COMMIT_HOUR=$(git show -s --format="%H%M" "$hash")

        # Classify the commit based on schedule thresholds matching the calculated baseline date
        if [ "$COMMIT_DATE" == "$DIA_ENTREGA" ] && { [ "$COMMIT_DAY_NUM" -eq 1 ] || [ "$COMMIT_DAY_NUM" -eq 3 ]; } && [ "$COMMIT_HOUR" -ge 0700 ] && [ "$COMMIT_HOUR" -le 0900 ]; then
            ((COMMITS_EN_HORA++))
        elif [ "$COMMIT_DATE" == "$DIA_ENTREGA" ]; then
            ((COMMITS_EN_DIA++))
        else
            ((COMMITS_FUERA_DIA++))
        fi
    done <<< "$COMMIT_HASHES"

    # Print the statistical breakdown requested by the user
    echo "   Total analyzed commits: $TOTAL_COMMITS"
    echo "  ✓ Commits saved during class hours (07:00 - 09:00): $COMMITS_EN_HORA"
    echo "  ! Commits saved on class day (outside class hours): $COMMITS_EN_DIA"
    echo "  ✘ Commits saved completely outside class days: $COMMITS_FUERA_DIA"

    # Assign base score metrics according to the parsed counts
    if [ "$COMMITS_EN_HORA" -gt 0 ]; then
        echo " 🎉 Successful validation! Commits found matching class schedules."
        NOTA_HORARIO=100
    elif [ "$COMMITS_EN_DIA" -gt 0 ]; then
        echo " ⚠️ Commits found within the active day, but outside exact class hours."
        NOTA_HORARIO=70
    else
        echo " ✘ No matching timeline parameters met. Commits belong to alternative dates."
        NOTA_HORARIO=50
    fi

    # ENFORCE 50 MINIMUM FLOOR: Double check baseline value remains compliant
    if (( $(echo "$NOTA_HORARIO < 50" | bc -l) )); then
        NOTA_HORARIO=50
    fi
fi
echo "-> TIMELINE SCORE: $NOTA_HORARIO/100"


# ------------------------------------------------------------------------------
# 2. SHELL SCRIPT SYNTAX VERIFICATION (Scale 0-100, Minimum Floor 50)
# ------------------------------------------------------------------------------
echo -e "\n[2/3] Validating compilation and syntax layout of scripts (.sh)..."

# Initialize absolute script and success tracking variables
TOTAL_SH=0
PASARON_SINTAXIS=0

# Iterate through every item in the workspace root ending with .sh extension
for script in *.sh; do
    # Prevent the evaluation engine script from parsing itself or analyzing phantom paths
    if [ "$script" == "exercise2.sh" ] || [ ! -f "$script" ]; then
        continue
    fi
    
    # Increment total evaluated script metric counter
    ((TOTAL_SH++))
    
    # Perform a dry-run check via bash -n to intercept parsing errors without running logic
    bash -n "$script" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "  ✓ $script: Clear compilation path. Syntax passed."
        ((PASARON_SINTAXIS++))
    else
        echo "  ✘ $script: Intercepted syntax validation exception."
    fi
done

# Process dynamic score array mapping using floating point arithmetic engines
if [ $TOTAL_SH -gt 0 ]; then
    # Generate proportional score based on passing percentage
    NOTA_SINTAXIS=$(echo "scale=2; ($PASARON_SINTAXIS / $TOTAL_SH) * 100" | bc)
    
    # ENFORCE 50 MINIMUM FLOOR: Handle low scoring structural formats gracefully
    if (( $(echo "$NOTA_SINTAXIS < 50.0" | bc -l) )); then
        echo "  ℹ️ Syntax evaluation fell short. Score adjusted to minimum base value."
        NOTA_SINTAXIS=50
    fi
else
    echo "⚠️ Workspace structure invalid. No shell execution paths found."
    NOTA_SINTAXIS=50
fi
echo "-> SYNTAX AND CLEANLINESS SCORE: $NOTA_SINTAXIS/100"


# ------------------------------------------------------------------------------
# 3. ENGLISH DOCUMENTATION QUALITY AUDIT (Scale 0-100, Minimum Floor 50)
# ------------------------------------------------------------------------------
echo -e "\n[3/3] Auditing script documentation and commentary language..."

# Initialize successful comment metric indicator
SCRIPTS_BIEN_COMENTADOS=0

# Loop through workspace components again for content analysis
for script in *.sh; do
    # Disregard the master engine tool and non-standard filesystem objects
    if [ "$script" == "exercise2.sh" ] || [ ! -f "$script" ]; then
        continue
    fi

    # Measure spatial metrics (line length and literal hashtag inclusion frequencies)
    LINEAS_TOTALES=$(wc -l < "$script")
    LINEAS_COMENTARIOS=$(grep -c '#' "$script")
    
    # Cross-reference commented segments against an industrial terminal vocabulary pattern
    KEYWORDS_INGLES=$(grep '#' "$script" | grep -iE -c '(loop|file|check|skip|variable|run|done|then|stop|empty|starting|error|output|input|condition|print|args|exist)')

    # Run comparative threshold filter tests on discovered code documentation blocks
    if [ "$LINEAS_TOTALES" -gt 0 ]; then
        if [ "$LINEAS_COMENTARIOS" -gt 0 ] && [ "$KEYWORDS_INGLES" -gt 0 ]; then
            echo "  ✓ $script: Technical documentation layout matches standard English requirements."
            ((SCRIPTS_BIEN_COMENTADOS++))
        else
            echo "  ! $script: Incomplete code explanations or non-English terminology detected."
        fi
    fi
done

# Process documentation calculations using scale mapping utilities
if [ $TOTAL_SH -gt 0 ]; then
    # Compute base fractional calculation rules
    NOTA_COMENTARIOS=$(echo "scale=2; ($SCRIPTS_BIEN_COMENTADOS / $TOTAL_SH) * 100" | bc)
    
    # ENFORCE 50 MINIMUM FLOOR: Standardize lower limits across metrics
    if (( $(echo "$NOTA_COMENTARIOS < 50.0" | bc -l) )); then
        echo "  ℹ️ Documentation criteria insufficient. Score adjusted to minimum base value."
        NOTA_COMENTARIOS=50
    fi
else
    NOTA_COMENTARIOS=50
fi
echo "-> WORKSPACE COMMENTARY SCORE: $NOTA_COMENTARIOS/100"


# ------------------------------------------------------------------------------
# FINAL REPORT COMPILATION AND AGGREGATION TERMINAL INTERACTION
# ------------------------------------------------------------------------------
echo -e "\n===================================================="
echo " FINAL GRADING SUMMARY"
echo "===================================================="
echo "1. Timeline Schedule Fulfillment:   $NOTA_HORARIO / 100"
echo "2. System Syntax & Structure:       $NOTA_SINTAXIS / 100"
echo "3. Technical English Commentary:    $NOTA_COMENTARIOS / 100"
echo "----------------------------------------------------"

# Calculate final grade arithmetic mean by adding all metrics and splitting by the parameter count
PROMEDIO_FINAL=$(echo "scale=2; ($NOTA_HORARIO + $NOTA_SINTAXIS + $NOTA_COMENTARIOS) / 3" | bc)

# Safe delivery output stream presenting color-coded total grades securely to stdout
echo -e "CUMULATIVE GRADE RECORDED: \033[1;32m$PROMEDIO_FINAL / 100\033[0m"
echo "===================================================="

sleep 800