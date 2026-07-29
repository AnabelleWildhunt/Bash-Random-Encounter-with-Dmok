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
DEF1=$(tail -1 ./bin/plr-def-origin)
DEF2=$(tail -2 ./bin/plr-def-origin | head -1)
DEF1_C=$(tail -1 ./bin/plr-def)
DEF2_C=$(tail -2 ./bin/plr-def | head -1)
sed -i "s/$PLR_C_HP/$PLR_HP/" ./bin/plr-hp
sed -i "s/$DMOK_C_HP/$DMOK_HP/" ./bin/dmok-hp
sed -i "s/$DEF1_C/$DEF1/" ./bin/plr-def
sed -i "s/$DEF2_C/$DEF2/" ./bin/plr-def

./bin/menu.sh
