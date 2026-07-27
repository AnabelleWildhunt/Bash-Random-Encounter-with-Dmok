#!/bin/bash
# If player decides to attack

# Dmok's current HP
DMOK_C_HP=$(tail -1 ./bin/dmok-hp)

# Amount of DMG
NUM=$((RANDOM %6))

# Announcing if missed or hit
if (($NUM == 0))
then
	echo "	         ----------  ATTACK MISSED!  ----------"
	echo
	echo
else
	echo "	       ----------  YOU DEALT $NUM DAMAGE!  ----------"
	echo
	echo
fi


# Dmok's remaining HP
DMOK_L_HP=$((DMOK_C_HP - NUM))

# Assessment if victory (if not, HP is replaced with new value)
if ((DMOK_L_HP <= 0))
then
	echo "	             ----------  Victory!  ----------"
	echo
	echo
else
	sed -i "s/$DMOK_C_HP/$DMOK_L_HP/" ./bin/dmok-hp
	./bin/dmok-turn.sh
fi
