#!/bin/bash

# This script displays various information to the screen

# Displayy 'Hello'

echo 'Hello'

# Assign a value to a variable

WORD='script'

# Display that value using the variable
echo "$WORD"

# Demostrates that single quotes cause variables to NOT get expanded
echo '$WORD'

# Combine the variable with hard-coded text
echo "This is a shell $WORD"

# Display the contents of the variable using an alternative syntax.
echo "This is a shell ${WORD}"

#Append text to the variable
echo "${WORD}ing is fun!"

#Show how not to append text to a variable
# This doesn't work:
echo "$WORDing is fun!"

# Create a new variable
ENDING='ed'

#Combine the two variables
echo "This is ${WORD}${ENDING}"

#Change the value stored in the ending variable
ENDING='ing'
echo "${WORD}${ENDING}"

#Reassing value to ENDING
ENDING='s'
echo "You are going too write many ${WORD}${ENDING} in this class"