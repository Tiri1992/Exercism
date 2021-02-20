#!/usr/bin/env bash
shopt -s extglob

bob_reply () {
    # Logical order of bobs responses
    if [[ "$1" =~ ^[A-Z]?[A-Za-z0-9,\:\)\?\.\![:blank:]]+"?"$ ]]; then
        output="Sure."
    elif [[ "$1" =~ ^[A-Z\'[:blank:]]+"?"$ ]]; then
        output="Calm down, I know what I'm doing!"
    elif [[ "$1" =~ ^[[:space:]]+$ ]]; then
        output="Fine. Be that way!"
    elif [[ "$1" =~ ^[A-Z0-9,[:punct:][:blank:]]+[A-Z!]{1}$ ]]; then
        output="Whoa, chill out!"
    else
        output="Whatever."
    fi
    echo $output
}

main () {
    # Number of args must be 1 or kill program.
    input="$1" 
    ### Trim leading whitespaces ###
    input="${input##*( )}"
    
    ### trim trailing whitespaces  ##
    input="${input%%*( )}"
    [[ "${#input}" == "0" ]] && echo "Fine. Be that way!" && exit 0
    # Run bobs reply
    bob_reply "$input"
}

main "$@"

shopt -u extglob