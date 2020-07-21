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

echo "Triplet"
declare -A triplet
HHH=0
HHT=0
HTH=0
THH=0
TTT=0
TTH=0
THT=0
HTT=0
for ((i=1; i<=10; i++))
do
   randomNum1=$(( RANDOM%2 ))
   randomNum2=$(( RANDOM%2 ))
	randomNum3=$(( RANDOM%2 ))
   combination=$randomNum1$randomNum2$randomNum3
   case $combination in
   111)
      HHH=$(( $HHH+1 ))
   ;;
   110)
      HHT=$(( $HHT+1 ))
   ;;
   101)
      HTH=$(( $HTH+1 ))
   ;;
   011)
      THH=$(( $THH+1 ))
   ;;
	000)
		TTT=$(( $TTT+1 ))
	;;
	001)
		TTH=$(( $TTH+1 ))
	;;
	010)
		THT=$(( $THT+1 ))
	;;
	100)
		HTT=$(( $HTT+1 ))
	;;
   esac
done

triplet["HHH"]=$(( $HHH*100/10 ))
triplet["HHT"]=$(( $HHT*100/10 ))
triplet["HTH"]=$(( $HTH*100/10 ))
triplet["THH"]=$(( $THH*100/10 ))
triplet["TTT"]=$(( $TTT*100/10 ))
triplet["TTH"]=$(( $TTH*100/10 ))
triplet["THT"]=$(( $THT*100/10 ))
triplet["HTT"]=$(( $HTT*100/10 ))


for key in ${!triplet[@]}
do
   echo "(Triplet) $key percentage: ${triplet[$key]}%"
done
