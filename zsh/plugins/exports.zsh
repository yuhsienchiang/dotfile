#!/bin/sh

# Environment variables set everywhere
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="alacritty"

# Bat (cat replacement) colorscheme
export BAT_THEME="Catppuccin-macchiato"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Poetry
export PATH=$PATH:$HOME/.pyenv/versions/poetry_venv/bin

# Zoxide
export _ZO_DATA_DIR="$HOME/.cache/zoxide"
export _ZO_ECHO=0
eval "$(zoxide init --cmd cd zsh)"

# FZF
# default
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border=rounded --cycle'
export FZF_DEFAULT_COMMAND='fd -tf -tl --hidden --follow --no-ignore-vcs'

# ctrl-t: past selected to prompt
export FZF_CTRL_T_COMMAND='fd -td -tf -tx -tl --hidden --follow --no-ignore-vcs'

# alt-c: change directory to selected (keymap is remapped to ctrl-f in .zshrc)
export FZF_ALT_C_COMMAND='fd -td --hidden --follow --no-ignore-vcs'
