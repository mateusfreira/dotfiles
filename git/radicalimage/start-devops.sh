#!/bin/bash
SESSION="nucleus-devops"
cd ./nucleus/Nucleus
#OpenVim
tmux -2 new-session -d -s $SESSION
tmux send-keys "vim" C-m
#Open terminal
tmux new-window -t $SESSION:1 -n 'bash'
tmux new-window -t $SESSION:2 -n 'performance'
tmux send-keys "cd /Users/mateusfreira/git/radicalimage/nucleus/vision-performance-testing/" C-m
tmux new-window -t $SESSION:3 -n 'notes'
tmux send-keys "cd /Users/mateusfreira/git/radicalimage/nucleus/notes/&&./start-vim.sh" C-m
tmux new-window -t $SESSION:4 -n 'dev-docker-run'
tmux send-keys "cd /Users/mateusfreira/git/radicalimage/nucleus/dev-docker/dev" C-m
tmux send-keys "./dev.sh --start"
tmux split-window -h
tmux send-keys "cd /Users/mateusfreira/git/radicalimage/nucleus/dev-docker/dev" C-m
tmux send-keys "./dev.sh --ndx"

tmux new-window -t $SESSION:5 -n 'dev-docker-code'
tmux send-keys "cd /Users/mateusfreira/git/radicalimage/nucleus/dev-docker/dev" C-m
tmux send-keys "./dev.sh --nix"

tmux select-window -t $SESSION:0
tmux -2 attach-session -t $SESSION

