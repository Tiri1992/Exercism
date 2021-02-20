#!/usr/bin/env bash

# Hamming distance is the the number of differences between two character lengths.
# Loop over the index of the substring


die() {
    # Emit errors and exit
    echo "$*" >&2
    exit 1
}

main () {
    dna1=$1
    dna2=$2
    output=0
    [[ $# -eq 2 ]] || die "Usage: hamming.sh <string1> <string2>"

    [[ "${#dna1}" == "${#dna2}" ]] || die "left and right strands must be of equal length"

    for (( i=0; i<"${#dna1}"; i++ )); do
        [[ "${dna1:$i:1}" != "${dna2:$i:1}" ]] && ((output++))
    done
    echo $output
    return 0
}

main "$@"