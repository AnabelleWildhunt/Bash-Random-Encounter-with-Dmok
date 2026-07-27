#!/bin/bash
# If player decides to defend

# Current defense stance status (presumably, none)
DEF_STAT=$(tail -1 ./bin/plr-def)
DEF2_STAT=$(tail -1 ./bin/plr-def2)
DEF="1"

# Giving the defense stance value to both defense markers (for 1st and 2nd turn of defense)
sed -i "s/$DEF_STAT/$DEF/" ./bin/plr-def
sed -i "s/$DEF_STAT/$DEF/" ./bin/plr-def2
./bin/dmok-turn.sh
