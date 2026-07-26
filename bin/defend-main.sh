#!/bin/bash
# If player decides to defend

DEF_STAT=$(tail -1 ./bin/plr-def)
DEF2_STAT=$(tail -1 ./bin/plr-def2)
DEF="1"

sed -i "s/$DEF_STAT/$DEF/" ./bin/plr-def
sed -i "s/$DEF_STAT/$DEF/" ./bin/plr-def2
./bin/dmok-turn.sh
