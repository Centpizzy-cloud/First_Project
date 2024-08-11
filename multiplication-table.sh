#!/bin/bash

#step1: Promt the user to enter a number for multiplication table.

read -p " enter number for multiplication table: " number

#step2 : Ask if they want full table or partial table.

read -p " do you want a full table (f) or partial table (P)? " table_type

#step3 : If partial, prompt for the start and end number of the range.


if ["$table_type" = "p"]; then
	#get the starting number of the range.
read -p " enter the start number of the range: " start
        #get the ending number of the range.
read -p " enter the end number of the ranger: " end

#step4 : validate the range inputs.
if [ "$start" -gt "$end" ]; then
	echo " invalid range: start number must be less than or equal to end number "
        exit 1
fi

else 
	#if full table, set default range values
	start=1
        end=10

fi

#step5 : generate and display multiplication table according to specific range.
        echo " multiplication table for $number: "
	for (( i=$start; i<=$end; i++ ))
	
do 
	#print the multiplication result
	echo "$number x $i = $((number * i))"
done	

#step6 : Enhance user interaction -Ask if the user wants to repeat the process.
        while true; do 
read -p "do you want to generate another multiplication table? (y/n):" choice

   case $choice in	    
	[Yy]*)
        #if yes, rerun the script.
	./$(basename $0)
	exit 0
      ;;
        [Nn]*)
        #if no, exit the script.
      echo "goodbye!"
        exit 0
      ;;
   *)
       #if input is not valid, ask again.
      echo "please answer yes or no"
     ;;
esac
done
