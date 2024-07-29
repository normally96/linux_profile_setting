#!/bin/bash
# Create tmux session with specific session name and window names

SESSION_NAME=$1
WINDOW_NAMES=("ws" "conf" "misc")
WINDOW_DIRS=("/home/anie/workspace" \
			"/home/anie/linux_profile_setting" \
			"/home/anie" )

Len=${#WINDOW_NAMES[@]}

tmux new-session -d -s $SESSION_NAME -n ${WINDOW_NAMES[0]} -c ${WINDOW_DIRS[0]}

for (( i = 1; i < ${Len}; i++));
do
	tmux new-window -n ${WINDOW_NAMES[i]} -t $SESSION_NAME -c ${WINDOW_DIRS[i]}
done
tmux next # To move to the first window
tmux a -t $SESSION_NAME

