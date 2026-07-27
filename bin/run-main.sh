#!/bin/bash
# If player decides to run

# Assessing the chance to run away successfully
chance=$((RANDOM %99 + 1))

# Displaying the outcome
if (($chance < 67))
then
	echo "	     ----------  YOU FAILED TO ESCAPE!  ----------"
	echo
	echo
	./bin/dmok-turn.sh
else
	echo "	       ----------  ESCAPE SUCCEEDED!  ----------"
	echo
	echo
fi
