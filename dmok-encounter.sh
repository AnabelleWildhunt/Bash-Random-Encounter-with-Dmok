#!/bin/bash
#Created by Anabell of the Wildhunt
#23.07.2026

echo "
========================================================================
	              SUDDENLY, DMOK ATTACKS YOU!!!
========================================================================
"

PLR_HP=$(tail -1 ./bin/plr-hp-origin)
DMOK_HP=$(tail -1 ./bin/dmok-hp-origin)
PLR_C_HP=$(tail -1 ./bin/plr-hp)
DMOK_C_HP=$(tail -1 ./bin/dmok-hp)
sed -i "s/$PLR_C_HP/$PLR_HP/" ./bin/plr-hp
sed -i "s/$DMOK_C_HP/$DMOK_HP/" ./bin/dmok-hp

./bin/menu.sh
