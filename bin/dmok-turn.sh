#!/bin/bash
# Dmok's turn script

# Player's HP
HP=$(tail -1 ./bin/plr-hp)

# Variables handling player's defense stance
DEF_STAT=$(tail -1 ./bin/plr-def)
DEF2_STAT=$(tail -2 ./bin/plr-def | head -1)

# Variables handling player's shield
SHLD=$(tail -1 ./bin/plr-shield)

# Nullification
NULL=0

# Variables handling dmok's attack (the base value of dmg is always even)
ATTACK=$((RANDOM %5 + 1))
DMG=$((ATTACK * 2))

# Damage reduction if player's during defense stance 
if [[ $DEF_STAT -ne 0 ]]
then
	DMG=$((DMG / 2))
fi

if (( $SHLD == 1 && $DMG >= 5 ))
then
	echo "        ----------  MAGIC SHIELD HAS PROTECTED YOU!  ----------"
	echo
	echo
	DMG=0
	sed -i "s/$SHLD/$NULL/" ./bin/plr-shield
fi

# Dmok's attack announce
echo "	     ----------  YOU'VE RECIEVED $DMG DMG!  ----------"
echo
echo


# Calculation of lost HP
HP_C=$((HP - DMG))
sed -i "s/$HP/$HP_C/" ./bin/plr-hp



# Reduction of defense stance
if [[ $DEF_STAT == 1 && $DEF2_STAT == 1 ]]
then
	sed -i "3 s/$DEF2_STAT/$NULL/" ./bin/plr-def
elif [[ $DEF_STAT == 1 && $DEF2_STAT == 0 ]]
then
	sed -i "4 s/$DEF_STAT/$NULL/" ./bin/plr-def
fi


# Check if player's defeated
if [[ $HP_C -le 0 ]]
then
	echo "	      ----------  YOU'VE BEEN DEFEATED! ----------"
else
	./bin/menu.sh
fi
