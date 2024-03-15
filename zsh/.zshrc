# Print welcome message if cowsay and lolcat are installed
if [ $(which cowsay) ] && [ $(which lolcat) ]; then
    cowsay -f elephant "Time to Code!" | lolcat
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Load 3rd part plugins
plug "zsh-users/zsh-syntax-highlighting"
plug "romkatv/powerlevel10k"

# Load local configuration
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/plugins/completion.zsh"
plug "$HOME/.config/zsh/plugins/fzf/fzf-file-widget.zsh"
plug "$HOME/.config/zsh/plugins/fzf/fzf-cd-widget.zsh"
plug "$HOME/.config/zsh/plugins/fzf/fzf-history-widget.zsh"
plug "$HOME/.config/zsh/plugins/fzf/fzf-completion.zsh"

