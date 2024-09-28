#!/usr/bin/env bash

tmux capture-pane -S -3000
tmp_file="$1/$(date +%Y-%m-%d-%H-%M-%S).txt"
tmux save-buffer "$tmp_file"

tmux new-window "nvim $tmp_file && tmux load-buffer $tmp_file && tmux delete-buffer && rm -i $tmp_file"
