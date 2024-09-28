
# set prefix key to C-a
tmux unbind C-b
tmux set-option -g prefix C-a
tmux bind-key C-a send-prefix

tmux bind-key w run-shell "seshi"

