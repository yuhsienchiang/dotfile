# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias vim="nvim"

# FZF
alias fzfp="fzf-tmux -p 65%,60% --preview 'bat --color always --style='plain' {}' --preview-window=right,40%,~5"
alias vimi="fzfp --multi --print0 | xargs -0 -o nvim -O"
alias brewi="brew formulae | fzf-tmux --multi -p 65%,60% --preview 'brew info {}' --preview-window=right,60% | xargs brew install"
alias ubrewi="brew leaves | fzf-tmux --multi -p 65%,60% --preview 'brew info {}' --preview-window=right,60% | xargs brew uninstall"
alias brewupdate="brew update && brew upgrade && brew cleanup"

# replace ls with eza
alias ls='eza --group-directories-first --color=always --icons=always --no-time --no-user'
alias ll='ls -l --git'
alias l='ll -a'
alias tree='l --tree'

# show disk usage with human readable sizes and list all files & folders
alias du='du -ah'
