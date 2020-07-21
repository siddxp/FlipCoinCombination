#!/bin/bash -x
randomCoin=$(( RANDOM%2 ))
if [ $randomCoin -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi
