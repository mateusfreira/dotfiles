#!/bin/bash
SESSION="nucleus-devops"
cd ./nucleus/KNucleus-cs
#OpenVim
tmux -2 new-session -d -s $SESSION
tmux send-keys "vim" C-m
#Open terminal
tmux new-window -t $SESSION:1 -n 'bash'
tmux new-window -t $SESSION:2 -n 'kb8s proxy'
tmux new-window -t $SESSION:3 -n 'notes'
tmux send-keys "cd /Users/mateus/git/radicalimage/&&vim Notes-devops.md" C-m

tmux select-window -t $SESSION:0
tmux -2 attach-session -t $SESSION
