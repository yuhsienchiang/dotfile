<div align="center">
        <img src="doc/lego.png", width="200">
    <h1 align="center">Dotfile</h1>
</div>

This repo keeps as my personal dotfiles and helps me setup development environment quickly.

- You are welcome to fork this repo and use it.
- The scripts and configs are crafted to fit my needs, beware that adjustments might be required to have it work on your device.

## Requirement

- MacOS
- Zsh
- [Alacritty](https://github.com/alacritty/alacritty) >= 0.13.0

## 📦 Install

Run the command bellow to setup the dev env:

```bash
/bin/bash -c "$(curl -s https://raw.githubusercontent.com/yuhsienchiang/dotfile/main/install.sh)"
```

## What's Included?

### Packages

| Packages                                          | Description                                                                              |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| [homebrew](https://brew.sh/)                      | The Missing Package Manager for macOS.                                                   |
| [tmux](https://github.com/tmux/tmux)              | Terminal multiplexer.                                                                    |
| [neovim](https://github.com/neovim/neovim)        | Vim-fork text editor.                                                                    |
| [bat](https://github.com/sharkdp/bat)             | A replacement of cat(1).                                                                 |
| [eza](https://github.com/eza-community/eza)       | A modern replacement for ‘ls’.                                                           |
| [fzf](https://github.com/junegunn/fzf)            | A command-line fuzzy finder.                                                             |
| [fd](https://github.com/sharkdp/fd)               | A simple, fast and user-friendly alternative to 'find'.                                  |
| [zoxide](https://github.com/ajeetdsouza/zoxide)   | Smarter **cd** command which allows you to jump to directories in just a few keystrokes. |
| [pyenv](https://github.com/pyenv/pyenv)           | Simple Python version management tool.                                                   |
| [poetry](https://github.com/python-poetry/poetry) | Python packaging and dependency management tool.                                         |

### Configurations

#### Alacritty

<details>
    <summary>Configuration</summary>

- [dotfile/alacritty/alacritty.toml](alacritty/alacritty.toml) : Alacritty configuration file.

</details>

<details>
    <summary>Plugins</summary>

- [catppuccin/alacritty](https://github.com/catppuccin/alacritty) : Catppuccin color theme for Alacritty.

</details>

#### Zsh

<details>
    <summary>Configuration</summary>

- [dotfile/zsh/.zshrc](zsh/.zshrc) : Zsh configuration file loaded for interactive shell sessions.
- [dotfile/zsh/.zprofile](zsh/.zprofile) : Zsh configuration file loaded for login shells.

</details>

<details>
    <summary>Plugins</summary>

- [zap](https://github.com/zap-zsh/zap) : A minimal zsh plugin manager.
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) : Powerlevel10k is a theme for Zsh prompt.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) : Fish shell-like syntax highlighting for Zsh.
- [zap-zsh/fzf](https://github.com/zap-zsh/fzf) : A helper plugin for users with fzf installed.

</details>

#### Tmux Plugins

<details>
    <summary>Configuration</summary>

- [dotfile/tmux/.tmux.conf](tmux/.tmux.conf) : Tmux configuration file.

</details>

<details>
    <summary>Plugins</summary>

- [tpm](https://github.com/tmux-plugins/tpm) : Plugin manager for tmux.
- [tmux-open](https://github.com/tmux-plugins/tmux-open) : Tmux plugin for opening highlighted selection directly from Tmux copy mode.
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) : Tmux plugin for copying to system clipboard.
- [tmux-prefix-highlight](https://arc.net/l/quote/fhlcdoxe) : Tmux plugin that highlights when you press tmux prefix key.
- [catppuccin/tmux](https://github.com/catppuccin/tmux) : Catppuccin color theme for Tmux.

</details>

#### Neovim Plugins

<details>

See plugin config files in [dotfile/nvim/lua/yuhsienchiang/](nvim/lua/yuhsienchiang/)

</details>
