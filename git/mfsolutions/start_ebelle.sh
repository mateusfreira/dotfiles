#!/bin/bash
SESSION="mfsolutions-ebelle"
cd ./gerir-me
#OpenVim
tmux -2 new-session -d -s $SESSION
tmux send-keys "nvim" C-m
#Open terminal
tmux new-window -t $SESSION:1 -n 'bash'
#Open server
tmux new-window -t $SESSION:2 -n 'api'
tmux new-window -t $SESSION:3 -n 'notes'
tmux new-window -t $SESSION:4 -n 'client'
tmux send-keys "cd ../notes" C-m
tmux select-window -t $SESSION:0
tmux -2 attach-session -t $SESSION
