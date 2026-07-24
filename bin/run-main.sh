#!/bin/bash
# If player decides to run

chance=$((RANDOM %99 + 1))

if (($chance < 67))
then
	echo "	     ----------  YOU FAILED TO ESCAPE!  ----------"
	echo
	echo
	./bin/menu.sh
else
	echo "	       ----------  ESCAPE SUCCEEDED!  ----------"
	echo
	echo
fi
