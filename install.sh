#!/bin/bash

set -e

# set virables
USER=${USER:-$(id -u -n)}
HOME="${HOME:-$(eval echo ~$USER)}"

DOTFILES_DIR="${HOME}/.config"
OLD_ZDOTDIR="${ZDOTDIR:-"${HOME}"}"
BACKUP_SUFFIX=$(date +%Y-%m-%d_%H-%M-%S)

ZPROFILE="${HOME}/.zprofile"
TMUX_DIR="${HOME}/.tmux"
TMUX_CONF="${HOME}/.tmux.conf"

setup_zsh() {
    # backup the old .config/ directory
    if [ -e "$DOTFILES_DIR" ]; then
        OLD_DOTFILES_DIR="${DOTFILES_DIR}-${BACKUP_SUFFIX}"
        mv -f "${DOTFILES_DIR}" "${OLD_DOTFILES_DIR}"
    fi
    # clone the dotfiles to HOME
    git clone https://github.com/ $DOTFILES_DIR &> /dev/null || { echo "❌ Git is a dependency. Please install git and try again." && return 2 }
 
    echo "Configuring zsh..."
    # backup the old .zprofile
    if [ -f "$ZPROFILE" ] || [ -h "$ZPROFILE" ]; then
        OLD_ZPROFILE="${ZPROFILE}-${BACKUP_SUFFIX}"
        mv -f "$ZPROFILE" "$OLD_ZPROFILE"
        echo "Existing .zprofile backed up to $OLD_ZPROFILE"
    fi

    # backup the old .zshrc 
    if [ -f "$OLD_ZDOTDIR/.zshrc" ] || [ -h "$OLD_ZDOTDIR/.zshrc" ]; then
        ZSHRC="$OLD_ZDOTDIR/.zshrc"
        OLD_ZSHRC="${ZSHRC}-${BACKUP_SUFFIX}"
        mv -f "$ZSHRC" "$OLD_ZSHRC"
        echo "Existing .zshrc backed up to $OLD_ZSHRC"
    fi

    # create a symlink to the .zprofile
    ln -s "${DOTFILES_DIR}/zsh/.zprofile" "${ZPROFILE}"

    # Install zap - zsh plugin
    # without overriding the existing .zshrc with --keep option
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
  
    # source the .zprofile and .zshrc
    source $ZPROFILE
    source "${ZDOTDIR}/.zshrc"
}

setup_homebrew() {
    # Check for Homebrew and install if we don't have it
    if [ ! $(which brew) ]; then 
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi 

    # Install Homebrew packages
    brew install bat zoxide exa fzf fd tmux neovim ripgrep lazygit lolcat cowsay

    # Install font
    brew tap homebrew/cask-fonts
    brew install font-meslo-lg-nerd-font
    brew install font-fira-code-nerd-font
}

setup_tmux() {
    echo "Configuring tmux..."
    # backup the old .tmux.conf
    if [ -f "$TMUX_CONF" ] || [ -h "$TMUX_CONF" ]; then
        OLD_TMUX_CONF="${TMUX_CONF}-${BACKUP_SUFFIX}"
        mv "$TMUX_CONF" "$OLD_TMUX_CONF"
        echo "Existing .tmux.conf backed up to $OLD_TMUX_CONF"
    fi

    # backup the old .tmux directory
    if [ -f "$TMUX_DIR" ] || [ -h "$TMUX_DIR" ]; then
        OLD_TMUX_DIR="${TMUX_DIR}-${BOCKUP_SUFFIX}"
        mv "$TMUX_DIR" "$OLD_TMUX_DIR"
        echo "Existing .tmux backed up to $OLD_TMUX_DIR"
    fi

    # create a symlink to the .tmux.conf
    ln -s $CONFIG_DIR/tmux/.tmux.config $TMUX_CONF

    # setup tmux plugin manager and install plugins
    git clone https://github.com/tmux-plugins/tpm ${TMUX_DIR}/plugins/tpm && /bin/bash -c "${TMUX_DIR}/plugins/tpm/bin/install_plugins"
}


main() {
    echo "Setting up DevEnv for your Mac..."
    setup_zsh
    setup_homebrew
    setup_tmux

    echo "DevEnv setup complete!"
    printf "Remember to run\n"
    printf "\n    \$ p10k configure\n\n"
    printf "to configure powerlevel10k.\n"
}

main
