if [[ -z $TMUX ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)

    # XDG Paths
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_CACHE_HOME=$HOME/.cache
    export XDG_DATA_HOME=$HOME/.local/share

    # zsh config dir
    export ZDOTDIR=$HOME/.config/zsh
    export HISTFILE=${ZDOTDIR}/.zsh_history
    export HISTSIZE=1000000
    export SAVEHIST=1000000
fi
