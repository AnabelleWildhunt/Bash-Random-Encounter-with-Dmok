#!/bin/bash
# Displays main menu and enables options

# Current player's HP
HP=$(tail -1 ./bin/plr-hp)


# Display of choices
echo "	-----  HP:$HP  -----"
echo
echo "            	 ---------  WHAT WILL YOU DO? ---------"
echo
echo "	A - ATTACK	M - MAGIC	D - DEFEND 	R - RUN"
echo "________________________________________________________________________"

# Script listens for player's input
read choice

# Executing next script
case $choice in
	A)
		./bin/attack-main.sh;;
	M)
		./bin/magic-main.sh;;
	D)
		./bin/defend-main.sh;;
	R)
		./bin/run-main.sh
esac
