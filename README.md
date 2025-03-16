# Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and environments. It's designed to help quickly set up a consistent development environment across different machines.

## Overview

This repository includes configurations for:

- **Shell**: ZSH with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
- **Terminal**: Alacritty terminal emulator
- **Git**: Global Git configurations and utilities
- **Fonts**: Programming and special-purpose fonts
- **OS-specific setups**:
  - Windows setup scripts and PowerShell configuration
  - Linux setup scripts (primarily for Arch Linux)

## Directory Structure

```sh
.
├── .devcontainer/       # Development container configuration
├── .docs/               # Documentation and resume templates
├── .vscode/             # VS Code settings
├── .zsh/                # ZSH configuration files
│   ├── .p10k.zsh        # Powerlevel10k theme configuration
│   └── .zshrc           # ZSH runtime configuration
├── fonts/               # Typography for development and documents
├── git/                 # Git configuration and helper scripts
├── linux/               # Linux-specific configurations
│   ├── grub/            # GRUB bootloader settings
│   └── setup/           # Linux setup scripts
└── windows/             # Windows-specific configurations
    ├── powershell/      # PowerShell profiles and scripts
    ├── setup/           # Windows setup scripts
    └── utility/         # Windows utility scripts
```

## Installation

### ZSH & Powerlevel10k Setup

1. Install ZSH and Oh My ZSH:

   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. Install Powerlevel10k theme:
   - On Arch Linux:

     ```bash
     yay -S zsh-theme-powerlevel10k-git
     echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
     ```

   - On other systems:

     ```bash
     git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
     ```

3. Install recommended plugins:

   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```

4. Copy the `.zsh/.zshrc` and `.zsh/.p10k.zsh` files to your home directory

### Windows Setup

1. Install PowerShell 7 and Oh My Posh:

   ```powershell
   winget install JanDeDobbeleer.OhMyPosh -s winget
   ```

2. Create PowerShell profile:

   ```powershell
   New-Item -Path $PROFILE -Type File -Force
   notepad $PROFILE
   ```

3. Add Oh My Posh initialization to your profile:

   ```powershell
   oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/pure.omp.json" | Invoke-Expression
   ```

4. If you encounter execution policy errors:

   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```

### Linux Setup

The `linux/setup/setup-arch.sh` script provides a comprehensive setup for Arch Linux, including:

- Git configuration
- Font installation
- Alacritty terminal setup
- ZSH and Oh My ZSH installation with plugins

## Git Helpers

The repository includes helpful Git utilities:

- `git/config.ps1` and `git/config.sh`: Scripts for basic Git configuration
- `git/filter-repo.ps1` and `git/filter-repo.sh`: Scripts to help with Git repository filtering

## Fonts

The `fonts` directory contains various typography resources:

- Programming fonts optimized for code readability
- Special-purpose fonts for documentation and presentations

## Development Container

A `.devcontainer` setup is included for consistent development environments that automatically:

- Installs Node.js (if needed)
- Sets up shell formatting tools
- Configures ZSH with plugins

## License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.
