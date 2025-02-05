#!/usr/bin/env bash

tmux_config_dir="${XDG_CONFIG_HOME}/tmux"
source $tmux_config_dir/themes/catppuccin_frappe.sh

# set tmux message style
tmux set-option -g message-style "fg=${thm_sky},bg=${thm_base},bold,italics,align=centre"

# set tmux command line style
tmux set-option -g message-command-style "fg=${thm_sky},bg=${thm_base},align=centre"

# set clock mode style
tmux set-window-option -g clock-mode-colour "${thm_green}"

# set copy mode style (the selected text fg and bg color)
tmux set-window-option -g mode-style "fg=${thm_pink},bg=${thm_surface2},bold"

# set border style
tmux set-option -g pane-border-indicators arrows
tmux set-option -g pane-border-lines single
tmux set-option -g pane-border-status off
tmux set-option -g pane-border-style "fg=${thm_overlay0},bg=${thm_base}"
tmux set-option -g pane-active-border-style "fg=${thm_peach},bg=${thm_base},bold"
