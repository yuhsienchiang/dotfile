# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# FZF
alias fzfp="fzf-tmux -p 65%,60% --preview 'bat --color always --style='plain' {}' --preview-window=right,40%,~5"

# neovim as default editor
alias vim="nvim"
alias vimf="fzfp --print0 | xargs -0 -o nvim"

# replace ls with eza
alias ls='eza --group-directories-first --icons'
alias ll='ls -l --git'
alias l='ll -a'
alias tree='l --tree'

# show disk usage with human readable sizes and list all files & folders
alias du='du -ah'
