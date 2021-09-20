#!/bin/bash

## Requires 0310_Dealer_schedule. Arguments: 0310, 2 (single digit time), AM (AM or PM), 1 (1,2, or 3 depending on the game)
## Example: "bash roulette_dealer_finder_by_time_and_game.sh 0310 2 AM 1

if [ $4 = '1' ]; then 
	awk -F ' ' '{print $1, $2, $3, $4}' $1_Dealer_schedule | grep -i $2':00:00 '$3 && echo "Time and Blackjack dealer name."
elif [ $4 = '2' ]; then 
	awk -F ' ' '{print $1, $2, $5, $6}' $1_Dealer_schedule | grep -i $2':00:00 '$3 && echo "Time and Roulette dealer name."
elif [ $4 = '3' ]; then 
	awk -F ' ' '{print $1, $2, $7, $8}' $1_Dealer_schedule | grep -i $2':00:00 '$3 && echo "Time and Texas Hold EM dealer name."
else 
	echo "input error"
fi
