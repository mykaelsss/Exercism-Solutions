#!/usr/bin/env bash

main () {
	local num="$1"
	local len="${#num}"
	local sum=0

	for (( i=0; i<${len}; i++ )); do
		digit=${num:$i:1}
		sum=$(( sum + (digit ** len) ))		
	done
	
	[[ $sum -eq $num ]] && echo "true" || echo "false"
}

main "$@"
