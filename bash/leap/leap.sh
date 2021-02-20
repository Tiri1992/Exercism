#!/usr/bin/env bash

die () {
    # Kills program; redirect stderr > stdout
    echo "$*" >&2 
    exit 1
}

leap_year() {
    # Logic:
    ### Is divisible by 4 and not divisible by 100 unless its divisible by 400
    if [[ "$(( $1 % 4))" -eq 0 ]] && [[ ! "$(( $1 % 100 ))" -eq 0 ]] || [[ "$(( $1 % 400))" -eq 0 ]]
        then
            output="true"
        else
            output="false"
    fi
    echo $output
    exit 0
}


main () {
    # Kill program if positional argument not given
    [[ "$#" -ne 1 ]] && die "Usage: leap.sh <year>"
    # Kill program if positional argument is incorrect data type
    [[ ! "$1" =~ ^[0-9]+$ ]] && die "Usage: leap.sh <year>"
    # Is leap year?
    leap_year "$1"
}

# Run program
main "$@"