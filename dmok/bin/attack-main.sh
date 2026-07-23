#!/bin/bash
# If player decides to attack

DMOK_C_HP=$(tail -1 ./bin/dmok-hp)
NUM=$((RANDOM %6))

if (($NUM == 0))
then
	echo "	----------  ATTACK MISSED!  ----------"
	echo
	echo
else
	echo "	----------  YOU DEALT $NUM DAMAGE!  ----------"
	echo
	echo
fi

DMOK_L_HP=$((DMOK_C_HP - NUM))

if ((DMOK_L_HP <= 0))
then
	echo "Victory!"
	echo
	echo
else
	sed -i "s/$DMOK_C_HP/$DMOK_L_HP/" ./bin/dmok-hp
	./bin/dmok-turn.sh
fi
