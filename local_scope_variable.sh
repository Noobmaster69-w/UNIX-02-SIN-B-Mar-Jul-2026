#!/bin/bash
PUBLISHER="No Starch Press"
    print_name(){
    local name
    name="Black Hat Bash"
    echo "${name} by ${PUBLISHER}"
}
print_name
echo "Variable ${name} will not be printed because it is a local variable."
#+ PUBLISHER='No Starch Press'
#+ print_name
#+ local name
#+ name='Black Hat Bash'
#+ echo 'Black Hat Bash by No Starch Press'
#Black Hat Bash by No Starch Press
#+ echo 'Variable  will not be printed because it is a local variable.'
#Variable  will not be printed because it is a local variable

# GLOBAL VARIABLE: Defined outside functions and can be read or modified from anywhere in the entire script.
# LOCAL VARIABLE: Declared with the 'local' keyword inside a function and disappears completely once that function finishes.
# FUNCTION INVOCATION: Triggered simply by writing the function's name on a line, without using parentheses like in other languages.