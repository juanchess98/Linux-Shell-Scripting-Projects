#!/bin/bash

# This scripts creates a new user on the local system
# You must supply a username as an argument to the script.
# Optionally you can provide a comment for the account as an argument
# A password will be automatically generated for the account
# The username, the password, and host for the acocunt will be displayed



# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then 
    echo 'Please run with sudo or as root.'
    exit 1
fi

# Make sure that at least supply one argument
NUMBER_OF_PARAMETERS="${#}"
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then 
    echo "Usage: ${0} USER_NAME [COMMENT]..."
    echo 'Create an account on the local system with the name of USER_NAME and a comment field of COMMENT. '
    exit 1
fi
#The first parameter is the user name
USER_NAME="${1}"
#The rest of the comments are the comments
shift
COMMENT="${@}"

# Generate a password 
PASSWORD=$(date +%s%N | head -c48)

#Create the user with the password
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check for the return status
# We dont want to tell the user that an account was created when it wasn't
if [[ "${?}" -ne 0 ]]
then
    echo 'The accound could not be created'
    exit 1
fi
# Set the password
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

# Check if the passwd command succeeded
if [[ "${?}" -ne 0 ]]
then
    echo 'The password for the account could not be set'
    exit 1
fi
# Force password change on first login.
passwd -e ${USER_NAME}
# Display the username, password, and the host where the user was created
echo
echo 'username: '
echo
echo "${USER_NAME}" 
echo
echo 'password:'  
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0