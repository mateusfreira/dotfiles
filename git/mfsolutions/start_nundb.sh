#!/bin/bash
SESSION="nun-db"
cd ./nun-db
#OpenVim
tmux -2 new-session -d -s $SESSION
tmux send-keys "nvim" C-m
#Open terminal
tmux new-window -t $SESSION:1 -n 'bash'
#Open server
tmux new-window -t $SESSION:2 -n 'api'
tmux new-window -t $SESSION:3 -n 'client'
tmux new-window -t $SESSION:6 -n 'notes'
tmux send-keys "cd ../notes" C-m
tmux send-keys "nvim" C-m
tmux new-window -t $SESSION:7 -n 'nun-db-js'
tmux send-keys "cd ../nun-db-js" C-m
tmux new-window -t $SESSION:8 -n 'nun-db-react'
tmux select-window -t $SESSION:0
tmux -2 attach-session -t $SESSION
