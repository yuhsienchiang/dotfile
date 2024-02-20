#!/bin/bash

set -e

# set virables
USER="${USER:-$(id -u -n)}"
HOME="${HOME:-$(eval echo ~$USER)}"

DOTFILES_DIR="${HOME}/.config"
BACKUP_SUFFIX="$(date +%Y-%m-%d_%H-%M-%S)"

# zsh variables
ZDOT_DIR="${ZDOTDIR:-"${HOME}"}"
ZPROFILE="${HOME}/.zprofile"

# tmux variables
TMUX_DIR="${HOME}/.tmux"
TMUX_CONF="${HOME}/.tmux.conf"

# poetry variables
PYENV_ROOT="${HOME}/.pyenv"
POETRY_VENV="${PYENV_ROOT}/versions/poetry_venv"


back_up() {
    # backup the old file or directory
    # $1: file or dir
    # $2: file or dir path
    # $3: backup suffix
    if [ "$1" = "file" ]; then
        if [ -f "$2" ] || [ -h "$2" ]; then
            mv -f "$2" "${2}-${3}"
            echo "Existing $2 backed up to ${2}-${3}"
        fi
    elif [ "$1" = "dir" ]; then
        if [ -e "$2" ]; then
            mv -f "$2" "${2}-${3}"
            echo "Existing $2 backed up to ${2}-${3}"
        fi
    fi
}


setup_zsh() {
    echo "Configuring zsh..."
    # backup the old .zprofile and .zshrc
    back_up "file" "$ZPROFILE" "$BACKUP_SUFFIX"
    back_up "file" "${ZDOT_DIR}/.zshrc" "$BACKUP_SUFFIX"

    # create a symlink to the .zprofile
    ln -s "${DOTFILES_DIR}/zsh/.zprofile" "${ZPROFILE}"
 
    # loading the .zprofile
    # .zshrc will be sourced by zap installer, no need to source it here
    source "$ZPROFILE"

    # Install zap - zsh plugin
    # without overriding the existing .zshrc with --keep option
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
}


setup_homebrew() {
    echo "Install tools through Homebrew..."
    # Install Homebrew packages
    brew install bat zoxide exa fzf fd tmux neovim ripgrep lazygit pyenv pyenv-virtualenv lolcat cowsay

    # Install font
    brew tap homebrew/cask-fonts
    brew install font-meslo-lg-nerd-font
    brew install font-fira-code-nerd-font
}


setup_tmux() {
    echo "Configuring tmux..."

    # backup the old .tmux.conf and .tmux directory
    back_up "file" "$TMUX_CONF" "$BACKUP_SUFFIX"
    back_up "dir" "$TMUX_DIR" "$BACKUP_SUFFIX"

    # create a symlink to the .tmux.conf
    ln -s "${CONFIG_DIR}/tmux/.tmux.config" "$TMUX_CONF"

    # setup tmux plugin manager and install plugins
    git clone https://github.com/tmux-plugins/tpm "${TMUX_DIR}/plugins/tpm" && /bin/bash -c "${TMUX_DIR}/plugins/tpm/bin/install_plugins"
}


setup_pyenv() {
    echo "Configuring pyenv..."
    if [ $(which pyenv) ]; then
        pyenv install -s 3.10.12
        pyenv global 3.10.12
    else
        echo "pyenv does not exist, skip configuring pyenv."
    fi
}


setup_poetry() {
    echo "Setting up poetry..."
    # create a virtual env for poetry
    echo "    Creating virtual env for poetry..."
    if [ ! -e "${POETRY_VENV}" ]; then
        pyenv virtualenv 3.10.12 poetry_venv
        echo "    poetry_venv created."
    else
        echo "    poetry_venv already exists, skip creating poetry_venv."
    fi

    echo "    Installing poetry..."
    if ! $("${POETRY_VENV}/bin/pip" freeze | grep -q "poetry"); then
        ${POETRY_VENV}/bin/pip install -U pip setuptools
        ${POETRY_VENV}/bin/pip install poetry
        echo "    poetry installed."
    else
        echo "    poetry already exists, skip installing."
    fi
}

print_success() {
    printf "\n"
    printf "  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗  \n"
    printf "  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝  \n"
    printf "  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗    \n"
    printf "  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝    \n"
    printf "  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗  \n"
    printf "  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝  \n"
    printf "\n"

    printf "Dotfile setup completed! Remember to run\n"
    printf "\n    \$ p10k configure\n\n"
    printf "to configure powerlevel10k.\n"
}

main() {
    # Check for Homebrew and install if we don't have it
    if [ ! $(which brew) ]; then 
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Check for homebrew version git and install if we don't have it
    if $(which git | grep -q "homebrew"); then 
        brew install git
        source "$ZPROFILE"
    fi

    # backup the old .config/ directory
    back_up "dir" "$DOTFILES_DIR" "$BACKUP_SUFFIX"

    # clone the dotfiles to HOME
    echo "Cloning Dotfile to {$DOTFILES_DIR}..."
    git clone https://github.com/yuhsienchiang/dotfile.git "$DOTFILES_DIR"

    setup_zsh
    setup_homebrew
    setup_tmux
    setup_pyenv
    setup_poetry

    print_success
}

main
