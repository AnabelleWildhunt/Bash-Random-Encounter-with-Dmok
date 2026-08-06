#!/bin/bash
# A spell which creates a nullyfing shield for one heavy attack (stronger than 5 DMG)

# Shield value
SHLD=$(tail -1 ./bin/plr-shield)

# Incrementing of shield value
INC=1

# Player's HP
HP=$(tail -1 ./bin/plr-hp)
# Fixed damage of backfired spell
DMG=10

# Probability of successful casting
NUM=$((RANDOM %100 + 1))

# Casting shield
if (( NUM <= 20 ))
then
	echo
	echo "      ----------  SPELL BACKFIRED! YOU'VE TAKEN $DMG DMG!  ----------"
	echo
	HP_C=$((HP - DMG))
	sed -i "s/$HP/$HP_C/" ./bin/plr-hp
elif (( NUM <= 80 && NUM > 20 ))
then
	echo
	echo "           ----------  ...BUT NOTHING HAPPENED...  ----------"
	echo
else
	echo
	echo "    ----------  SUCCESSFUL CAST! YOU'RE FEELING PROTECTED!  ----------"
	echo
	sed -i "s/$SHLD/$INC/" ./bin/plr-shield
fi

# Enemy's turn
./bin/dmok-turn.sh
