# Dotfiles

Development environment configuration files for Neovim, Ghostty terminal, and associated tools. Built after transitioning away from Cursor due to excessive RAM consumption causing system freezes on M4 Pro.

## Stack

- **Terminal**: [Ghostty](https://ghostty.org/) with JetBrainsMono Nerd Font
- **Editor**: [Neovim](https://neovim.io/) 0.11+ with [NvChad](https://nvchad.com/)
- **AI Assistant**: [Claude Code](https://docs.anthropic.com/en/docs/quickstarts/claude-code)
- **Git UI**: [Lazygit](https://github.com/jesseduffield/lazygit)
- **Shell**: Zsh
- **Primary Languages**: Go, TypeScript, PHP, HCL

## Features

- VSCode-style keybindings for easy transition
- Claude Code integration for AI-assisted development
- Full LSP support for multiple languages
- Intelligent auto-completion via gopls, ts_ls, and other language servers
- Fuzzy finding with Telescope
- Git integration through Gitsigns and Lazygit
- Auto-format on save for all configured languages
- Treesitter-powered syntax highlighting

## Quick Install
```bash
# Clone the repository
git clone https://github.com/pipethedev/dotfiles.git ~/dotfiles
https://github.com/pipethedev/dotfiles
# Run the installer
cd ~/dotfiles
chmod +x install.sh
./install.sh

# Install dependencies (macOS)
brew install neovim ghostty lazygit ripgrep fd
brew install --cask font-hack-nerd-font

# Install Claude Code
brew install claude

# Open Neovim and allow plugins to install
nvim
```

## Manual Installation

For manual setup:
```bash
# Neovim configuration
ln -sf ~/dotfiles/nvim ~/.config/nvim

# Ghostty configuration
mkdir -p ~/.config/ghostty
ln ln-sf ~/dotfiles/ghostty-config ~/.config/ghostty/config

# Shell configuration
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Git configuration
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
```

## Keybindings

### VSCode-Style Shortcuts

This configuration uses VSCode-style keybindings to facilitate transition from traditional IDEs.

**File Navigation:**
- `Ctrl + P` - Fuzzy file search
- `Ctrl + Shift + P` - Command palette
- `Ctrl + F` - Search across files (live grep)
- `Cmd/Ctrl + B` - Toggle sidebar
- `Alt + ]` - Next buffer
- `Alt + [` - Previous buffer

**Editing:**
- `Ctrl + S` - Save file
- `Space + C` - Toggle comment
- `Space + FM` - Format document
- `Space + D` - Delete line
- `Ctrl + A` - Select all

**Code Navigation:**
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show hover documentation
- `Space + .` - Code actions
- `Space + RE` - Rename symbol
- `F8` - Next diagnostic
- `Shift + F8` - Previous diagnostic

**Window Management:**
- `Ctrl + H/J/K/L` - Navigate between splits
- `Space + W` - Create vertical split
- `Alt + H/L` - Resize splits horizontally

**Terminal:**
- `Space + T + T` - Toggle terminal
- `Space + T + H` - Horizontal terminal
- `Space + T + V` - Vertical terminal
- `Space + GG` - Open Lazygit

**File Tree:**
- `Space + E` - Toggle file explorer
- `a` - Add file or folder
- `r` - Rename
- `d` - Delete
- `x` - Cut
- `c` - Copy
- `p` - Paste

**Additional:**
- `jj` - Exit insert mode
- `Space + CH` - Display keybinding cheatsheet
- `;` - Enter command mode

## LSP Servers

Installed via Mason (accessible with `:Mason`):

- **Go**: gopls, gofumpt, golangci-lint
- **TypeScript/JavaScript**: typescript-language-server, prettier, eslint
- **PHP**: intelephense, php-cs-fixer
- **HCL**: terraform-ls (for Nomad/Consul configurations)
- **XML**: lemminx
- **HTML/CSS**: html-lsp, css-lsp, emmet
- **Lua**: lua-language-server

## Core Plugins

- **NvChad** - Configuration framework
- **nvim-lspconfig** - LSP configuration
- **nvim-cmp** - Completion engine
- **telescope.nvim** - Fuzzy finder
- **nvim-treesitter** - Syntax parsing and highlighting
- **gitsigns.nvim** - Git integration
- **nvim-ts-autotag** - Auto-close HTML/JSX tags
- **mason.nvim** - LSP and tool manager
- **which-key.nvim** - Keybinding reference

## Workflow

### Multi-Tab Setup

Typical workflow uses three Ghostty tabs:

1. **Tab 1**: Neovim for code editing
2. **Tab 2**: Claude Code for AI assistance
3. **Tab 3**: Shell for commands and testing

Navigate between tabs using `Cmd + 1/2/3`.

### Git Operations

1. Edit files in Neovim
2. Open Lazygit with `Space + GG`
3. Stage changes with `Space`
4. Commit with `c`
5. Push with `P`

### AI-Assisted Development
```bash
# Start Claude Code in project directory
cd ~/projects/myapp
claude code

# Interact with Claude for code assistance and generation
```

## Customization

### Theme Configuration

Edit `~/.config/nvim/lua/chadrc.lua`:
```lua
M.ui = {
  theme = "onedark", -- Options: "catppuccin", "gruvbox", etc.
}
```

### Custom Keybindings

Edit `~/.config/nvim/lua/mappings.lua`:
```lua
map("n", "<your-key>", "<your-command>", { desc = "Description" })
```

```
### Progressive Vim Motion Adoption

Recommended learning path:

1. Basic navigation: `h/j/k/l`
2. Mode switching: `i` for insert, `jj` to exit
3. File operations: `Ctrl + S` to save
4. Line operations: `dd` to delete line
5. Visual selection: `v` to select, `d` to delete

Reference `Space + CH` for keybinding cheatsheet.

### Efficiency Tips

- Use `Ctrl + P` for file navigation instead of manual browsing
- Learn text objects like `ciw` (change inner word) for faster editing
- Use `Space + GG` for git operations instead of command line
- Leverage autocomplete by pressing `Tab` to accept suggestions

## Troubleshooting

### LSP Issues
```bash
# Check LSP status
:LspInfo

# Restart LSP server
:LspRestart
```

### Completion Not Working
```bash
# Open Mason
:Mason

# Search and install required language servers
# Examples: gopls, typescript-language-server
```
## License

MIT

---

If you find this configuration useful, consider starring the repository.
