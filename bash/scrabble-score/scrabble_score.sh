#!/usr/bin/env bash

# Load associative array
scores () {
    letter="$1"
    declare -A scrabble 
    # Value 1
    scrabble[A]=1
    scrabble[E]=1
    scrabble[I]=1
    scrabble[O]=1
    scrabble[U]=1
    scrabble[L]=1
    scrabble[N]=1
    scrabble[R]=1
    scrabble[S]=1
    scrabble[T]=1
    scrabble[D]=2
    scrabble[G]=2
    scrabble[B]=3
    scrabble[C]=3
    scrabble[M]=3
    scrabble[P]=3
    scrabble[F]=4
    scrabble[H]=4
    scrabble[V]=4
    scrabble[W]=4
    scrabble[Y]=4
    scrabble[K]=5
    scrabble[J]=8
    scrabble[X]=8
    scrabble[Q]=10
    scrabble[Z]=10
    # Echo out points
    result="${scrabble[$letter]}"
}

main () {
    output=0
    for ((i=0; i<"${#1}"; i++))
    do
        char="${1:$i:1}"
        # echo $char
        scores "${char^^}"
        # Append result to output
        ((output+=$result))
    done
    echo $output
}

main "$@"