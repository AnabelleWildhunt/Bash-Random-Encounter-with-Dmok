#!/bin/bash
# Displays main menu and enables options

echo
echo "            	 ---------  WHAT WILL YOU DO? ---------"
echo
echo "	A - ATTACK	M - MAGIC	D - DEFEND 	R - RUN"
echo "________________________________________________________________________"

read choice

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
