#!/usr/bin/env bash

die () {
    "$*" 2>&1
    exit 1
}

valid_num() {
    total=0
    local power="${#1}"
    for (( i=0; i<${#1}; i++))
    do
        # check over each index of str
        result="${1:i:1}"
        var=$(($result**$power))
        ((total+=$var))
    done
    # Is valid
    [[ "$total" -eq "$1" ]] && output="true" || output="false"
    echo $output
}

main () {
    # No input params: Raise
    [[ -z "$1" ]] && die "Usage: armstrong_numbers.sh <integer>"
    # Check input param is an int
    [[ -z "${1//[[:digit:]]/}" ]] || die "Usage: armstrong_numbers.sh <intger> 2"
    
    # Validate number
    valid_num "$1"
}

main "$@"