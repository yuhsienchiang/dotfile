# Print welcome message
$HOME/.config/pfetch/pfetch.zsh

# Enable starship promt line
eval "$(starship init zsh)"

# zoxide (set before completion for plugins/completion.zsh to work)
eval "$(zoxide init --cmd cd zsh)"

# zsh settings
source $HOME/.config/zsh/plugins/exports.zsh
source $HOME/.config/zsh/plugins/completion.zsh
source $HOME/.config/zsh/plugins/aliases.zsh

# zsh-vi-mode
source $HOME/.config/zsh-vi-mode/zsh-vi-mode.zsh

# zsh-syntax-highlighting
source $HOME/.config/zsh-syntax-highlight/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source $HOME/.config/fzf/fzf-file-widget.zsh
source $HOME/.config/fzf/fzf-cd-widget.zsh
source $HOME/.config/fzf/fzf-history-widget.zsh
source $HOME/.config/fzf/fzf-completion.zsh

# # pyenv 
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

