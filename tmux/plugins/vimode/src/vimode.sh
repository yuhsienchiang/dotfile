#!/usr/bin/env bash

tmux bind-key e copy-mode

tmux set-option -g mouse on                                                          # Mouse mode on
tmux set-window-option -g mode-keys vi                                        # Use vim keybindings in copy mode
tmux unbind -T copy-mode-vi MouseDragEnd1Pane                                 # don't exit copy mode when dragging with mouse
tmux bind-key -T copy-mode-vi 'v' send-keys -X begin-selection                # setup 'v' to begin selection as in Vim
tmux bind-key -T copy-mode-vi 'y' send -X copy-selection 'pbcopy'             # copy text with `y` in copy mode

# Update default binding of `Enter` and `Space to also use copy-pipe
tmux unbind -T copy-mode-vi Enter
tmux unbind -T copy-mode-vi Space
tmux bind-key -T edit-mode-vi Up send-keys -X history-up
tmux bind-key -T edit-mode-vi Down send-keys -X history-down

