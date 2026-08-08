#!/bin/bash
# A spell which has a small chance to kill an enemy instantly

# Enemy's HP
DMOK_HP=$(tail -1 ./bin/dmok-hp)

# Player's HP
HP=$(tail -1 ./bin/plr-hp)
# Fixed damage of fireball
DMG=10

# Probability of successful casting
NUM=$((RANDOM %100 + 1))

# Casting death
if (( NUM == 1 ))
then
	echo
	echo "-------  SPELL BACKFIRED! YOUR SOUL HAS BEEN TORN OUT OF YOUR BODY!  -------"
	echo
	echo "             ----------  YOU'VE BEEN DEFEATED!  ----------"
	echo
elif (( NUM == 100 ))
then
	echo
	echo "     ----------  SUCCESFUl CAST! THE ENEMY DIES INSTANTLY!  ----------"
	echo
	echo "                    ----------  VICTORY!  ----------"
	echo
else
	echo
	echo "           ----------  ...BUT NOTHING HAPPENED...  ----------"
	echo
	echo
	./bin/dmok-turn.sh
fi

