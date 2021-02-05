#!/usr/local/bin/bash

# Convert each phrase into its acronym

die () {
    # Emit errors and exit
    echo "$*" >&2
    exit 1
}

main () {
    # No input
    [[ ${#1} -eq 0 ]] && die "Usage: acronym.sh <string>"

    # Replace any punctuation with whitspace
    phrase=${1//[[:punct:]]/ }
    output=""
    for a in $phrase
    do 
        first_letter="${a:0:1}"
        output+="${first_letter^^}"
    done
    echo $output
}


main "$@"