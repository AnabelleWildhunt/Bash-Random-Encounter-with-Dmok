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

# Casting fireball
if (( NUM <= 20 ))
then
	echo
	echo "      ----------  SPELL BACKFIRED! YOU'VE TAKEN $DMG DMG!  ----------"
	echo
	HP_C=$((HP - DMG))
	sed -i "s/$HP/$HP_C/" ./bin/plr-hp
elif (( NUM > 80 ))
then
	echo
	echo "           ----------  ...BUT NOTHING HAPPENED...  ----------"
	echo
else
	echo
	echo "    ----------  SUCCESSFUL CAST! DMOK HAVE TAKEN $DMG DMG!  ----------"
	echo
	DMOK_HP_C=$((DMOK_HP - DMG))
	sed -i "s/$DMOK_HP/$DMOK_HP_C/" ./bin/dmok-hp
fi

# Enemy's turn
./bin/dmok-turn.sh
