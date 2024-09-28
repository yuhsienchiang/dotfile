
# Equally resize all panes
tmux bind-key = select-layout even-horizontal
tmux bind-key | select-layout even-vertical

# Select panes 
tmux bind-key j select-pane -D 
tmux bind-key k select-pane -U 
tmux bind-key h select-pane -L 
tmux bind-key l select-pane -R

# Split horiziontal and vertical splits instead of % and "
# Also open them in the same directory
tmux unbind %
tmux unbind '"'
tmux bind-key v split-window -h -c '#{pane_current_path}'
tmux bind-key s split-window -v -c '#{pane_current_path}'
tmux bind-key c new-window -c '#{pane_current_path}'  # Re-bind new window to open in same directory

# Change active pane
tmux bind-key ] select-pane -t +1
tmux bind-key [ select-pane -t -1

# close pane
tmux bind-key x kill-pane
