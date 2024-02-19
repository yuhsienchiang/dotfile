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
export PATH=$HOME/.pyenv/versions/poetry_venv/bin:$PATH

# Zoxide
export _ZO_DATA_DIR="$HOME/.cache/zoxide"
export _ZO_ECHO=1
eval "$(zoxide init --cmd cd zsh)"
