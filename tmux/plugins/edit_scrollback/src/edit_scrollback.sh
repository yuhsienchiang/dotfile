#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

temp_file="$1/scroll_back-$(date +%Y-%m-%d-%H-%M-%S).txt"
keep_temp_file=$2

tmux capture-pane -S -3000
tmux save-buffer "$temp_file"

tmux new-window -n SCROLLBACK "nvim $temp_file && $CURRENT_DIR/temp_file_handler.sh $temp_file $keep_temp_file"
tmux delete-buffer
