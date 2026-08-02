#!/bin/bash
# If player decides to cast magic

echo
echo "#############"
echo "#############"
echo "#############"
echo "#####  FB - Fireball"
echo "#####  H - Heal"
echo "#####  S - Swiftness"
echo "#####  C - Charm"
echo "#####  SH - Shield"
echo "#####  D - Death"
echo "#####  B - Go Back"
echo "#############"
echo "#############"
echo "#############"

read choice

case $choice in
	FB) ./bin/fireball.sh;;
	H) ./bin/heal-spell.sh;;
	S) echo;;
	C) echo;;
	SH) echo;;
	D) ./bin/death-spell.sh;;
	B) ./bin/menu.sh
esac
