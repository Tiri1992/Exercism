#!/usr/bin/env bash


die () {
    echo "$*" >&2
    exit 1
}

reverse () {
    output=""
    for ((i=${#1} - 1; i >= 0; i--))
        do
            output+="${1:$i:1}"
        done
    echo "$output"
}

main () {
    # Kill program for no input
    [[ "$#" -eq "0" ]] && die "Usage: reverse_string.sh <string>"
    # Pass positional argument into reverse function
    reverse "$1"
}

main "$@"