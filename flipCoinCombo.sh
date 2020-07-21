#!/bin/bash -x
declare -A singlet
echo "SINGLET"
headsCount=0
tailsCount=0

for ((i=1;i<=10;i++))
do

	randomCoin=$(( RANDOM%2 ))
	if [ $randomCoin -eq 0 ]
	then
		headsCount=$(($headsCount+1))
	else
		tailsCount=$(($tailsCount+1))
	fi
done

headsPercentage=$(($headsCount*100/10))
tailsPercentage=$(($tailsCount*100/10))
echo "Singlet heads Percentage : $headsPercentage%"
echo "Singlet tails Percentage : $tailsPercentage%"
