#!/bin/bash
# Spel that charms enemy to attack themself

# Enemy's HP
DMOK_HP=$(tail -1 ./bin/dmok-hp)

# Player's HP
HP=$(tail -1 ./bin/plr-hp)

# Probability of successful casting
NUM=$((RANDOM %100 + 1))

# Damage dealt by dmok
ATK=$((RANDOM %5 + 1))
DMG=$((ATK * 2))

# Casting charm
if (( NUM <= 10 ))
then
	echo
	echo "-  CHARM FAILED! FORIOUS DMOK ATTACKS TWICE! YOU'VE TAKEN $((DMG * 2)) DMG!  -"
	echo
	HP_C=$((HP - (DMG * 2)))
	sed -i "s/$HP/$HP_C/" ./bin/plr-hp
	./bin/menu.sh
elif (( NUM > 10 && NUM <= 90 ))
then
	echo
	echo "           ----------  ...BUT NOTHING HAPPENED...  ----------"
	echo
	./bin/dmok-turn.sh
else
	echo
	echo "    ----------  SUCCESSFUL CAST! DMOK DEALS $DMG DMG TO THEMSELF!  ----------"
	echo
	DMOK_HP_C=$((DMOK_HP - DMG))
	sed -i "s/$DMOK_HP/$DMOK_HP_C/" ./bin/dmok-hp
	./bin/menu.sh
fi

# If spell was casted or backfired, next turn starts (since that was technically enemy's turn)
