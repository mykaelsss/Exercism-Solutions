#!/usr/bin/env bash

bits=(1 2 4 8 16 32 64 128)
names=("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")

list_allergies() {
	local score=$1
	local result=""
	for i in "${!bits[@]}"; do
		bit=${bits[$i]}
		if (( score & bit )); then
			result="$result ${names[$i]}"
		fi
	done
	
	echo "${result## }"
}

allergic_to() {
	local score=$1
	local item=$2

	case "$item" in
        	eggs)         bit=1   ;;
        	peanuts)      bit=2   ;;
        	shellfish)    bit=4   ;;
        	strawberries) bit=8   ;;
        	tomatoes)     bit=16  ;;
        	chocolate)    bit=32  ;;
        	pollen)       bit=64  ;;
        	cats)         bit=128 ;;
        	*)
			echo "unknown allergen: $item" >&2
            		return 1
            		;;
    	esac

    	if (( score & bit )); then
        	echo "true"
    	else
        	echo "false"
    	fi
}

main() {
	local score=$1
	local op=$2
	local item=$3
	
	if [[ $op == "allergic_to"  ]]; then
		allergic_to "$score" "$item"
	else
		list_allergies "$score"
	fi
}

main "$@"
