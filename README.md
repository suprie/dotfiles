# Dotfiles

Personal configuration files for development environment setup on macOS.

## Contents

```
dotfiles/
├── nvim/           # Neovim configuration (NvChad v2.5)
├── zsh/            # Zsh shell configuration
├── rio/            # Rio terminal configuration
├── Code/           # VS Code settings
├── claude/         # Claude Code custom agents
└── vim-cheatsheet.html  # Interactive Vim cheatsheet
```

## Neovim

Based on [NvChad](https://nvchad.com/) v2.5 with custom configurations:

### Features
- LSP support for multiple languages
- Treesitter for Go, Kotlin, Java, Swift, Lua, HTML, CSS
- FZF integration (telescope-fzf-native + fzf.vim)
- Conform.nvim for code formatting

### FZF Keybindings
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Ripgrep search |
| `<leader>fb` | List buffers |
| `<leader>fh` | File history |
| `<leader>fc` | Git commits |
| `<leader>fs` | Git status |
| `<leader>fl` | Lines in buffers |
| `Ctrl+p` | Find files |

### Installation
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Symlink
ln -s ~/dotfiles/nvim ~/.config/nvim

# Open nvim to install plugins
nvim
```

## Zsh

Oh-My-Zsh configuration with:
- Theme: `robbyrussell`
- Plugins: `git`, `fabric`, `xc`, `osx`
- Fastlane in PATH

### Installation
```bash
# Symlink
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
```

## Rio Terminal

[Rio](https://raphamorim.io/rio/) terminal configuration:
- Font: Hack (with Hasklig extras)
- Navigation: Top tabs with click support
- Uses current path for new tabs

### Installation
```bash
mkdir -p ~/.config/rio
ln -s ~/dotfiles/rio/config.toml ~/.config/rio/config.toml
```

## VS Code

Settings include:
- Font: Fira Code with ligatures
- Theme: Monokai
- Format on save
- Vim extension support
- Block cursor style

### Installation
```bash
# macOS
ln -s ~/dotfiles/Code/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

## Claude Code Agents

Custom agents for Claude Code CLI:
- **ios-senior-engineer**: Expert iOS development guidance with UIKit, SwiftUI, RxSwift
- **ios-architecture-reviewer**: iOS architecture review agent

### Installation
```bash
mkdir -p ~/.claude/agents
ln -s ~/dotfiles/claude/agents/*.md ~/.claude/agents/
```

## Vim Cheatsheet

Open `vim-cheatsheet.html` in a browser for a comprehensive, single-page Vim reference including:
- Modes, Navigation, Editing
- Search & Replace
- Windows, Tabs, Buffers
- Macros, Registers, Marks
- Text Objects
- Custom FZF keybindings

## Requirements

- [Neovim](https://neovim.io/) >= 0.9
- [Oh-My-Zsh](https://ohmyz.sh/)
- [Rio Terminal](https://raphamorim.io/rio/) (optional)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- Fonts: Hack, Hasklig, Fira Code

## Quick Setup

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# Install dependencies (macOS)
brew install neovim fzf ripgrep
brew install --cask font-hack-nerd-font font-fira-code

# Create symlinks
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
```

## License

MIT
