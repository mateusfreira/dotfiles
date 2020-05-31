#!/bin/bash
SESSION="mfsolutions"
cd ./elm-shot/ 
#OpenVim
tmux -2 new-session -d -s $SESSION
tmux send-keys "vim" C-m
tmux split-window -v
#Open terminal
tmux new-window -t $SESSION:1 -n 'bash'
#Open server
tmux select-window -t $SESSION:0
tmux -2 attach-session -t $SESSION
