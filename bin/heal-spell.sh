#!/bin/bash
# A spell that has a chance to heal player's HP

# Player's HP
HP=$(tail -1 ./bin/plr-hp)
# Fixed value of heal
HL=10

# Probability of successful casting
NUM=$((RANDOM %100 + 1))

# Casting heal
if (( NUM >= 50 ))
then
	echo
	echo "      ----------  SUCCESSFUL CAST! YOU'VE REGAINED $HL HP!  ----------"
	echo
	HP_C=$((HP + HL))
	sed -i "s/$HP/$HP_C/" ./bin/plr-hp
else
	echo
	echo "           ----------  ...BUT NOTHING HAPPENED...  ----------"
	echo
fi

# Enemy's turn
./bin/dmok-turn.sh
