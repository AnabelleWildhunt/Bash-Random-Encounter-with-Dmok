#!/bin/bash
# Shooting a fireball at the enemy

# Enemy's HP
DMOK_HP=$(tail -1 ./bin/dmok-hp)

# Player's HP
HP=$(tail -1 ./bin/plr-hp)
# Fixed damage of fireball
DMG=10

# Probability of successful casting
NUM=$((RANDOM %100 + 1))

# Amount of 1st DMG
NUM_D1=$((RANDOM %6))

# Amount of 2nd DMG
NUM_D2=$((RANDOM %6))

# Sum of DMG
SUM=$((NUM_D1 + NUM_D2))

# Casting fireball
if (( NUM <= 20 ))
then
	echo
	echo "      ----------  SPELL BACKFIRED! YOU'VE TAKEN $SUM DMG!  ----------"
	echo
	HP_C=$((HP - SUM))
	sed -i "s/$HP/$HP_C/" ./bin/plr-hp
elif (( NUM > 80 ))
then
	echo
	echo "      ----------  SUCCESSFUL CAST! YOU'RE ATTACKING TWICE!  ----------"
	echo
	if (( NUM_D1 == 0 ))
	then
        	echo "           ----------  ATTACK MISSED!  ----------"
        	echo
        	echo
	else
		echo
		echo "         ----------  YOU DEALT $SUM DAMAGE!  ----------"
        	echo
        	DMOK_HP_C=$((DMOK_HP - SUM))
        	sed -i "s/$DMOK_HP/$DMOK_HP_C/" ./bin/dmok-hp
	fi

else
	echo
	echo "           ----------  ...BUT NOTHING HAPPENED...  ----------"
	echo
fi

# Assessment if victory
if ((DMOK_HP <= 0))
then
        echo "               ----------  Victory!  ----------"
        echo
        echo
else
        ./bin/dmok-turn.sh
fi

