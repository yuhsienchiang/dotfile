#!/bin/sh

# Environment variables set everywhere
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="alacritty"

# Bat (cat replacement) colorscheme
export BAT_THEME="Catppuccin-macchiato"

# Poetry
export PATH=$PATH:$HOME/.pyenv/versions/poetry_venv/bin
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Zoxide
export _ZO_DATA_DIR="$HOME/.cache/zoxide"
export _ZO_ECHO=1
eval "$(zoxide init zsh)"
