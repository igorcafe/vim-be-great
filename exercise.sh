#!/usr/bin/env bash

vim=$(which vim 2> /dev/null)
if [[ -z "$vim" ]] 
then 
	vim=$(which nvim 2> /dev/null)
fi

if [[ -z "$vim" ]]
then 
	echo "no vim/neovim installation found"
	exit 1
fi

current=$(cat .current)

for exercise in exercise_*.md
do
	[[ "$current" > "$exercise" ]] && continue

	current="$exercise"
	echo "$exercise" > .current


	while true
	do
		$vim "$exercise"
		err=$?
		if [[ $err != 0 ]]
		then
			echo "It seems you exited with :cq. See you soon!"
			exit 0
		fi

		want=$(cat ".$exercise" 2> /dev/null)
		got=$(cat "$exercise" 2> /dev/null)
		if [[ "$want" == "" || "$got" == "$want" ]]
		then
			break
		fi

		echo "incorrect answer for $exercise. relaunching vim in 4 seconds."
		#diff --unified .$exercise $exercise 2> /dev/null
		sleep 4
	done
done
