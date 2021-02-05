#!/usr/bin/env bash

# Conditions:
# If num has 3 as a factor, add 'Pling' to the result
# If num has 5 as a factor, add 'Plang' to the result
# If num has 7 as a factor, add 'Plong' to the result
# If num does not have 3,5,7 as factor, the results should be the digits themselves

# Build a function

raindrop () {
	num=$1
	output=""

	if (( ${num} % 3 == 0)); then
		output+="Pling"
	fi
	if (( ${num} % 5 == 0)); then
		output+="Plang"
	fi
	if (( ${num} % 7 == 0)); then
		output+="Plong"
	fi

	# If none of the above are true

	if [ -z $output ]; then
		# None of the above are true!
		# -z evaluates an empty string
		output="${num}"
	fi
}

main () {
	case $# in 
		1)
			raindrop "$@"
			echo $output
			return 0
			;;
		*)
			echo "Usage: $0 <integer>"
			return 1
			;;
	esac
}

# Call main with all of the positional args
main "$@"