#!/bin/bash 

echo -e "Welcome to Tic-Tac-Toe Game \n----------------------------- \nAs a Tic Tac Toe player would like to challenge Computer"

ROW_SIZE=3
BOARD_SIZE=$((ROW_SIZE*ROW_SIZE))
userSymbol=1
compSymbol=0
firstPlayer=0
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


checkTurn() {
	randomCheck=$((RANDOM%2))
	if [ $randomCheck -eq 0 ]
	then
		echo "HUMAN has won the Toss"
		read -p "Choose Symbol For X=1 and For 0=2" a
                if [ $a -eq 1 ]
                then
                        userSymbol="X"
                        comSymbol="O"
                elif [ $a -eq 2 ]
                then
                        userSymbol="0"
                        compSymbol="X"
                fi
		echo "PLAYER Choose: $userSymbol"
	else
		echo "COMPUTER has won the Toss"
		if [ $((RANDOM%2)) -eq 0 ]
		then
			userSymbol="X"
                        comSymbol="O"
		else
			userSymbol="0"
                        compSymbol="X"
		fi
		echo "COMPUTER choose: $comSymbol"
	fi
}

playerInput() {
	echo -e "================ \n==============="
	displayBoard
	echo -e "================ \n==============="
	checkTurn
	echo -e "--------------------------- \nChoose a Cell for $userSymbol \n---------------------------------"
	read -p "Enter the Cell NUmber from 1- $BOARD_SIZE : " inputCell

	if [[  $inputCell -gt 0  &&  $inputCell -lt $BOARD_SIZE ]]
	then
		echo "Input choice is valid"
	else
		echo "Invalid Input choice"
	fi

}
playerInput

