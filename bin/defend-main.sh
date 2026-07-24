#!/bin/bash
# If player decides to defend

DEF_STAT=$(tail -1 ./bin/plr-def)
DEF="1"

sed -i "s/$DEF_STAT/$DEF/" ./bin/plr-def
./bin/dmok-turn.sh
