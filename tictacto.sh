#!/bin/bash 

echo -e "Welcome to Tic-Tac-Toe Game \n----------------------------- \nAs a Tic Tac Toe player would like to challenge Computer"

ROW_SIZE=3
BOARD_SIZE=$((ROW_SIZE*ROW_SIZE))
Position=0
count=0
declare -a ticBoard

resetBoard() {
	for (( position=1; position<=$BOARD_SIZE; position++ ))
	do
		ticBoard[$position]=0
	done
}


displayBoard() {
	for (( count=1; count<=$BOARD_SIZE; count++ ))
	do
		if [[ ${ticBoard[$count]} -eq 0 ]]
		then
			printf _"|"
		else
			printf ${ticBoard[$count]}" "
		fi

		if [ $(( $count % $ROW_SIZE )) -eq 0 ]
		then
			echo
		fi
	done
}

displayBoard
