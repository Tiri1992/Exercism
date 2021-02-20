#!/usr/bin/env bash

die () {
    echo "$*" >&2
    exit 1
}

alpha_arr () {
    alpha='abcdefghijklmnopqrstuvwxyz'
    # Empty string, handle
    [[ "${#1}" -eq 0 ]] && output="false" && echo $output && exit 0
    # STEPS: Concat sentence as one string (remove whitespaces)
    # Global sub all chars in alpha from str with removed whitespace
    # If in alpha we are left with an empty variable [ -z ] -> True else False
    no_whitespace="${1//[[:blank:][:punct:]]/}"
    results="${alpha//[$no_whitespace]/}"
    [[ -z $results ]] && output="true" || output="false" && echo $output
}


main () {
    # No argument provided
    [[ $# -eq 0 ]] && die "Usage: pangram.sh <string>"
    # Validate input is a single arg: Lower chars before inputting
    alpha_arr "${1,,}"
}

main "$@"
