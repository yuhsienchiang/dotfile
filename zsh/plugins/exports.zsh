if [[ -z $TMUX ]]; then
    # Default Editor
    export EDITOR="nvim"
    export VISUAL="nvim"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"

    export VIRTUAL_ENV_DISABLE_PROMPT=true
    # Bat (cat replacement) colorscheme
    # export BAT_THEME="Catppuccin-mocha"

    # Pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

    # Poetry
    export PATH=$PATH:$HOME/.pyenv/versions/poetry_venv/bin

    # Zoxide
    export _ZO_DATA_DIR="$HOME/.cache/zoxide"
    export _ZO_ECHO=0

    # FZF
    export FZF_DEFAULT_COMMAND='fd -tf -tl --hidden --follow --no-ignore-vcs'        # default: used by fzf commands without keymap
    export FZF_DEFAULT_OPTS=" \
        --height 60% --layout=reverse --border=sharp --cycle \
        --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
        --color=fg:#c6d0f5,header:#e78284,info:#8caaee,pointer:#8caaee \
        --color=marker:#e5c890,fg+:#c6d0f5,prompt:#8caaee,hl+:#e78284 \
        --color=gutter:#303446 \
        --prompt='󰍉 ' --pointer='▎' --marker='+ ' "

    export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"                               # ctrl-t: past selected to prompt
    export FZF_ALT_C_COMMAND='fd -td --hidden --follow --no-ignore-vcs'              # ctrl-f: change directory to selected

    # Sesh
    export PATH="$HOME/.config/sesh:$PATH"

    # starship
    export STARSHIP_CONFIG=~/.config/starship/starship.toml

    # decrease key timeout for faster response
    export KEYTIMEOUT=5
fi
