#!/bin/bash
SESSION="blog"
cd ./notes/blog
tmux -2 new-session -d -s $SESSION
tmux send-keys "nvim" C-m
#Open terminal
tmux new-window -t $SESSION:1 -n 'bash'
#Open server
tmux new-window -t $SESSION:6 -n 'notes'
tmux send-keys "cd ../" C-m
tmux select-window -t $SESSION:0
tmux -2 attach-session -t $SESSION
