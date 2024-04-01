if [[ -z $TMUX ]]; then
    # Default Editor
    export EDITOR="nvim"
    export VISUAL="nvim"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"


    # Bat (cat replacement) colorscheme
    export BAT_THEME="Catppuccin-mocha"

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
        --height 40% --layout=reverse --border=rounded --cycle \
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"                               # ctrl-t: past selected to prompt
    export FZF_ALT_C_COMMAND='fd -td --hidden --follow --no-ignore-vcs'              # alt-c: change directory to selected (keymap is remapped to ctrl-f in .zshrc)

    # Sesh
    export PATH="$HOME/.config/sesh:$PATH"
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(zoxide init --cmd cd zsh)"
