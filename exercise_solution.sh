#!/bin/bash
# REQUIREMENT 1: Validate input parameters
# Check if the number of arguments passed ($#) is not exactly equal to 2
if [ "$#" -ne 2 ]; then
    # Print an explicit error message to standard error (stderr) using redirection
    echo " Error: Missing arguments." >&2
    # Display the correct usage syntax to guide the operator
    echo "Usage: $0 <name> <target_domain>" >&2
    # Exit with code 128 (Standard Unix code for invalid command arguments)
    exit 128
fi

# Assign descriptive variable names to positional parameters for cleaner code
LOCATION_NAME="$1"
TARGET_DOMAIN="$2"

# Define the output data file path
OUTPUT_CSV="ping_results.csv"

# Inform the user that the operation is starting
echo "Checking connectivity to $TARGET_DOMAIN..."

# REQUIREMENT 2: Execute the network test safely
# -c 1 sends exactly one packet, -W 3 sets a 3-second timeout limit
ping -c 1 -W 3 "$TARGET_DOMAIN" > /dev/null 2>&1

# Capture the exit status ($?) of the ping execution instantly
PING_STATUS=$?

# REQUIREMENT 3: Parse results and compile data metrics
# A ping exit status of 0 means the host reached back successfully
if [ "$PING_STATUS" -eq 0 ]; then
    # Assign success indicators to variables
    RESULT_TEXT="success"
    echo "Connection established smoothly!"
else
    # Assign failure indicators if packet dropped or host was unreachable
    RESULT_TEXT="failure"
    echo "Connection failed or timed out."
fi

# Fetch the current system timestamp matching standard logging formats
CURRENT_TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# REQUIREMENT 3: Write structured data to the CSV storage unit
# Format: name,domain,status,timestamp appended (>>) to the CSV file
echo "$LOCATION_NAME,$TARGET_DOMAIN,$RESULT_TEXT,$CURRENT_TIMESTAMP" >> "$OUTPUT_CSV"

# Print a tracking confirmation message to the terminal prompt
echo "Entry successfully saved to $OUTPUT_CSV"
