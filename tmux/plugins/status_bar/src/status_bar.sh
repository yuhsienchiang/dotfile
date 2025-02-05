#!/usr/bin/env bash

tmux_config_dir="${XDG_CONFIG_HOME}/tmux"

source $tmux_config_dir/themes/catppuccin_frappe.sh

tmux set-option -g status-position top
tmux set-option -g status-justify left
tmux set-option -g status-style "bg=${thm_base}"
tmux set-option -g status-left "#[fg=#{?client_prefix,${thm_yellow},${thm_green}},bg=${thm_base},bold]#S "
tmux set-option -g status-right "#[fg=${thm_flamingo},bold]#{pane_current_command} "
tmux set-option -g status-right-length "100"
tmux set-option -g status-left-length "100"
tmux set-option -g renumber-windows on
tmux set-option -g base-index 1
tmux set-option -g set-titles on
tmux set-option -g set-titles-string "#T"
tmux set-option -g allow-rename off
tmux set-window-option -g window-status-current-style "fg=${thm_blue},bg=${thm_base},bold,italics"
tmux set-window-option -g window-status-current-format ' #W #I'
tmux set-window-option -g window-status-style "fg=${thm_text},dim"
tmux set-window-option -g window-status-format ' #W #I'
