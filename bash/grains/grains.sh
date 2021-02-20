#!/usr/bin/env bash

die () {
   echo "$*" >&2
   exit 1
}

grains () {
    [[ "$1" == "total" ]] && echo "18446744073709551615" && exit 0
    [[ "$1" -lt "1" || "$1" -gt "64" ]] && die "Error: invalid input"
    [[ "$1" -lt "2" ]] && echo "1" && exit 0
    [[ "$1" -eq "64" ]] && echo "9223372036854775808" && exit 0
    # For square count > 1
    power="$(("$1" - 1))"
    echo "$((2**$power))"
    exit 0
}

main () {
    # Run grains
    grains "$1"
    echo $output
}

main "$@"