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
singlet["H"]=$headsPercentage
singlet["T"]=$tailsPercentage


echo "DOUBLET"
declare -A doublet
HH=0
HT=0
TT=0
TH=0
for ((i=1;i<=10;i++))
do
	randomCoin1=$(( RANDOM%2 ))
		randomCoin2=$(( RANDOM%2 ))
	combo=$randomCoin1$randomCoin2
	case $combo in
	11)
		HH=$(( $HH+1 ))
	;;
	10)
		HT=$(( $HT+1 ))
	;;
	01)
		TH=$(( $TH+1 ))
	;;
	00)
		TT=$(( $TT+1 ))
	;;
	esac
done
doublet["HH"]=$(( $HH*100/10 ))
doublet["HT"]=$(( $HT*100/10 ))
doublet["TH"]=$(( $TH*100/10 ))
doublet["TT"]=$(( $TT*100/10 ))
for key in ${!doublet[@]}
do
	echo "Doublet $key Percentage : ${doublet[$key]}%"
done
