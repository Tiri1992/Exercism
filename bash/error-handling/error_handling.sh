#!/usr/bin/env bash

# In bash the $# command is the number of arguments passed in
help () {
    # Redirect errors from stderr to stdout
    echo "Usage: error_handling.sh <person>" 2>&1
    # Failed returns exit code 1, passes returns 0
    return 1
}

if [[ $# -ne 1 ]]
then
    help
else
    echo "Hello, $1"
fi