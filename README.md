# Neovim Config Installation

This repository contains my Neovim configuration powered by **lazy.nvim**. Use the steps below to install it cleanly and get all required dependencies.

## Prerequisites
- Neovim 0.9+.
- Git (for fetching plugins).
- Build tools: `make`, C compiler (for Telescope FZF native build), and `bash` or a POSIX shell.
- CLI search tools: `ripgrep`, `fd` (package `fd-find` on Debian/Ubuntu).
- Optional but recommended: `fzf` for fuzzy finding.

### Linux (Debian/Ubuntu)
Install the common prerequisites with:
```bash
sudo apt install neovim git build-essential ripgrep fd-find fzf
```

### Windows
Use PowerShell with Administrator privileges.

- **Package manager:** Install **Chocolatey** from https://chocolatey.org/install.
- **Install prerequisites:**
  ```powershell
  choco install neovim git ripgrep fd fzf make mingw
  ```
  `mingw` provides a C compiler used to build native plugins.

## Installation
1. **Backup existing config (optional):**
   - **Linux/macOS:**
     ```bash
     mv ~/.config/nvim ~/.config/nvim.backup
     ```
   - **Windows (PowerShell):**
     ```powershell
     Move-Item "$env:LOCALAPPDATA\nvim" "$env:LOCALAPPDATA\nvim.backup" -ErrorAction SilentlyContinue
     ```
2. **Clone the config:**
   ```bash
   git clone https://github.com/mfrisch1/new_nvim_conf.git
   ```
3. **Place it in Neovim's config directory:**
   - **Linux/macOS:**
     ```bash
     mv new_nvim_conf ~/.config/nvim
     ```
   - **Windows (PowerShell):**
     ```powershell
     Move-Item new_nvim_conf "$env:LOCALAPPDATA\nvim"
     ```
4. **Start Neovim to bootstrap plugins:**
   ```bash
   nvim
   ```
   The first launch will download **lazy.nvim** and install all configured plugins automatically.

## Post-install steps
- **Build Telescope FZF native:**
  - **Linux/macOS:**
    ```bash
    cd ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy/telescope-fzf-native.nvim
    make
    ```
  - **Windows (PowerShell):**
    ```powershell
    Set-Location "$env:LOCALAPPDATA\nvim-data\lazy\telescope-fzf-native.nvim"
    make
    ```
  This enables the faster native sorter used by Telescope.
- **LSP servers and tools:** Mason is configured to ensure common servers (like `clangd`, `lua_ls`, `gopls`, `bashls`, `ts_ls`, and others) are available. Run `:Mason` inside Neovim to view or manage the installations.

You are now ready to use the configuration. Open Neovim and enjoy the setup!
