#!/bin/bash

states=('Hawaii' 'texas' 'colorado' 'tennessee' 'california' 'oregon')

for state in ${states[@]}
do
	if [ $state == "Hawaii" ]
	then
		echo "Hawaii is the best!"
	else
		echo "I'm not fond of Hawaii"
	fi
done

list10=(0 1 2 3 4 5 6 7 8 9)

for num in ${list10[@]}
do
	if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
	then 
		echo $num
	fi
done