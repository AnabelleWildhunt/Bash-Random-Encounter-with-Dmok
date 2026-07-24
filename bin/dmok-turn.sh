#!/bin/bash
# Dmok's turn script

HP=$(tail -1 ./bin/plr-hp)

DEF_STAT=$(tail -1 ./bin/plr-def)
DEF_N="0"
ATTACK=$((RANDOM %5 + 1))
DMG=$((ATTACK * 2))

if [[ $DEF_STAT -ne 0 ]]
then
	DMG=$((DMG / 2))
fi

echo "	     ----------  YOU'VE RECIEVED $DMG DMG!  ----------"
echo
echo

HP_C=$((HP - DMG))
sed -i "s/$HP/$HP_C/" ./bin/plr-hp

sed -i "s/$DEF_STAT/$DEF_N/" ./bin/plr-def

if [[ $HP_C -le 0 ]]
then
	echo "	      ----------  YOU'VE BEEN DEFEATED! ----------"
else
	./bin/menu.sh
fi
