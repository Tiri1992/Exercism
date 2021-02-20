#!/usr/bin/env bash

die () {
    echo "$*" >&2
    exit 1
}

sum_of_squares_calc () {
    # Calculates the sum of sqrs: 1**2 + ... + N**2
    total_sum_sqs="0"
    for ((i=1; i<="$2"; i++))
        do 
            (( total_sum_sqs += $i**2 ))
        done
    # If we pass sum_of_squares in the first pos arg, exit program successfully
    [[ "$1" == "sum_of_squares" ]] && echo "$total_sum_sqs" && exit 0
}

square_of_sum_calc () {
    # Calculates the squares of the sum: (1 + ... + N)**2
    local total_sum="0"
    for ((i=1; i<="$2"; i++))
        do
            (( total_sum += $i ))
        done
    total_sq_sums=$(( $total_sum**2 ))
    # If we pass square_of_sum in the first pos arg, exit program successfully
    [[ "$1" == "square_of_sum" ]] && echo "$total_sq_sums" && exit 0
}

difference () {
    square_of_sum_calc "$@"
    sum_of_squares_calc "$@"
    # Take the difference
    echo "$(( $total_sq_sums - $total_sum_sqs))"
    # Exit program successfully
    exit 0
}

main () {
    # Runs main program
    [[ "$#" -ne "2" ]] && die "Usage: difference_of_squares.sh <string> <integer>"
    [[ "$1" == "square_of_sum" ]] && square_of_sum_calc "$@" 
    [[ "$1" == "sum_of_squares" ]] && sum_of_squares_calc "$@"
    [[ "$1" == "difference" ]] && difference "$@"
}

main "$@"