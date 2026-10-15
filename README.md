# Evan Pavlica's Dotfiles

Personal configuration files and dotfiles managed with [RCM](https://github.com/thoughtbot/rcm), tailored for macOS and Linux (including Wayland/Hyprland) environments.

---

## Required & Recommended Binaries

To take full advantage of this configuration, the following tools and binaries are used:

### Core & Essential
| Binary | Description |
| :--- | :--- |
| **`rcm`** | Dotfile management suite (`rcup`, `mkrc`, `rcdn`) used to link and manage dotfiles into `$HOME`. |
| **`zsh`** | Primary interactive shell (*replaces deprecated `bash`*). |
| **`nvim`** | [Neovim](https://neovim.io/) modern extensible text editor (*replaces deprecated `vim`*). |
| **`ghostty`** | Modern, GPU-accelerated terminal emulator (primary terminal). |
| **`tinty`** | [Tinted Theming CLI](https://github.com/tinted-theming/tinty) for Base16/Base24 theme management across Ghostty and Git Delta. |

### Shell, CLI & Git Utilities
| Binary | Description |
| :--- | :--- |
| **`lsd`** | Modern `ls` replacement with colors, icons, and tree views (aliased in Zsh when installed). |
| **`starship`** | Fast, cross-shell customized prompt configured via `config/starship.toml`. |
| **`git`** | Distributed version control system. |
| **`delta`** (`git-delta`) | Syntax-highlighting pager for `git diff`, `log`, and `blame`. |
| **`fzf`** | Command-line fuzzy finder used in Zsh, Neovim, and shell utilities. |
| **`rg`** (`ripgrep`) | High-performance search tool utilized by `fzf` and Neovim. |
| **`bat`** | Cat clone with syntax highlighting (used for `fzf` previews and aliased to `cat`). |
| **`tmux`** | Terminal multiplexer with Vi keybindings and Ollama popup integration. |
| **`gh`** | GitHub CLI, used for Git credential helper authentication. |
| **`git-lfs`** | Git Large File Storage filter. |

### Terminal Emulators & Desktop (Wayland / Linux)
| Binary / Package | Description |
| :--- | :--- |
| **`ghostty`** | Primary terminal emulator (`config/ghostty/config`). |
| **`kitty`** | Alternative GPU terminal emulator (`config/kitty/kitty.conf`). |
| **`alacritty`** | Alternative GPU terminal emulator (`config/alacritty/alacritty.toml`). |
| **`hyprland`** | Dynamic tiling Wayland compositor (`config/hypr/hyprland.conf`). |
| **`waybar`** | Status bar for Hyprland (`config/waybar/`). |
| **`hyprpaper`** | Wallpaper utility for Hyprland (`config/hypr/hyprpaper.conf`). |

### Language Runtimes & Dev Environments (Optional)
- **`rbenv`** - Ruby version manager (tracked as a git submodule).
- **`nvm`** / **`node`** / **`npm`** - Node.js version manager and package manager.
- **`python3`** / **`pyenv`** - Python runtime and environment manager.
- **`docker`** & **`docker-compose`** - Containerized development environment (see `docker/` and `werk`).
- **`ollama`** - Local LLM runner (integrated into `tmux` popup via `Ctrl-a T` and Zsh plugins).
- **`kubectl`** - Kubernetes command-line interface.

### Recommended Font
- [VictorMono Nerd Font](https://www.nerdfonts.com/) (configured in Ghostty, Kitty, and Alacritty configs for icons and ligatures).

---

## Deprecated

The following configurations and binaries are **deprecated** and maintained only for legacy fallbacks:

| Deprecated Binary | Replacement | Status & Notes |
| :--- | :--- | :--- |
| **`bash`** | **`zsh`** | Replaced by `zsh` + Oh My Zsh. Legacy configs (`bashrc`, `bash_aliases`, `.bashrc_mac`) are kept for fallback environments. |
| **`vim`** | **`nvim`** | Replaced by Neovim (`nvim`). Legacy configs (`vim/`, `.vimrc`, `vimrc.bundles`, Vundle plugins) are retained for environments without Neovim. In `zshrc.aliases`, `vim` is aliased to `nvim`. |

---

## Repository Contents

```
~/.dotfiles/
├── bin/                          # Custom executables and scripts
│   └── delta-colorscript         # Starfleet insignia ANSI colorscript
├── config/                       # XDG configuration files (~/.config)
│   ├── alacritty/                # Alacritty terminal emulator configuration
│   ├── ghostty/                  # Ghostty terminal emulator configuration
│   ├── hypr/                     # Hyprland Wayland compositor & hyprpaper config
│   ├── kitty/                    # Kitty terminal emulator configuration
│   ├── nvim/                     # Modern Neovim setup (lazy.nvim, LSP, Treesitter, snacks)
│   ├── pry/                      # Ruby Pry configuration (pryrc)
│   ├── python/                   # Interactive Python startup script (setup.py)
│   ├── starship.toml             # Custom Starship prompt configuration
│   ├── tinted-theming/           # Tinty configuration for Base16 theming
│   └── waybar/                   # Waybar modular bar configuration and styling
├── docker/                       # Arch Linux-based containerized dev environment
├── docker-compose.yml            # Docker Compose service definition for dev environment
├── oh-my-zsh/                    # Oh My Zsh custom themes and patches
│   └── custom/
│       ├── my_patches.zsh        # Zsh custom hooks and patches
│       └── themes/evan.zsh-theme # Custom Zsh theme
├── rbenv/                        # rbenv git submodule
├── vim/                          # (Deprecated) Legacy Vim config and Vundle bundles
├── .bashrc_mac                   # (Deprecated) macOS Bash startup config
├── alias-completion              # Alias completion support for Bash
├── bash_aliases                  # (Deprecated) Legacy Bash aliases
├── bashrc                        # (Deprecated) Legacy Bash runcom
├── dircolors                     # Custom color definitions for GNU ls
├── fzfrc                         # fzf configuration (uses ripgrep and bat preview)
├── git-completion.bash           # Bash git auto-completion script
├── git-prompt.sh                 # Git prompt script
├── gitconfig                     # Global Git configuration (delta, nvimdiff, gh auth, git-lfs)
├── gitignore_global              # Global Git ignore patterns
├── gitmessage                    # Git commit message template
├── inputrc                       # GNU Readline configuration
├── INSTALL.sh                    # System setup and package installer script
├── irbrc                         # Ruby interactive shell (IRB) config
├── npm-completion.sh             # NPM CLI auto-completion script
├── psqlrc                        # PostgreSQL interactive terminal (psql) configuration
├── rcrc                          # RCM configuration file (specifies excludes and undotted files)
├── rubocop.yml                   # RuboCop Ruby style guide rules
├── screenrc                      # GNU Screen configuration
├── tmux.conf                     # Tmux configuration (vi keys, custom status bar, Ollama popup)
├── werk                          # Helper script to launch dockerized dev container
├── zshrc                         # Primary Zsh shell configuration
└── zshrc.aliases                 # Zsh aliases (git shortcuts, directory jumping, bat, nvim, lsd)
```

---

## Installation & Usage

### 1. Clone the Repository
Clone this repository with its submodules to `~/.dotfiles`:
```bash
git clone --recursive https://github.com/e-pavlica/dotfiles.git ~/.dotfiles
```

### 2. Install RCM
Install Thoughtbot's `rcm` suite:
- **macOS (Homebrew):** `brew install rcm`
- **Arch Linux:** `sudo pacman -S rcm` (or via AUR: `rcm`)
- **Ubuntu/Debian:** `sudo apt install rcm`

### 3. Deploy Dotfiles
Use `rcup` to create symlinks in your home directory:
```bash
rcup
```

> [!NOTE]
> `rcrc` automatically excludes `README.md`, `INSTALL.sh`, `docker`, and `docker-compose.yml` from being symlinked with leading dots, and marks `werk` as undotted.

### 4. Initialize Theming
Synchronize colorschemes across Ghostty and Delta using `tinty`:
```bash
tinty install
tinty apply base16-gruvbox-dark
```

### 5. Launch Neovim
Launch `nvim`. Plugins will be automatically managed and installed by `lazy.nvim`:
```bash
nvim
```
