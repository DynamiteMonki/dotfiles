# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed with GNU Stow for easy deployment across machines. The repository contains configuration files for:

- **nvim/**: Neovim configuration with minimal plugin setup
- **zsh/**: Zsh shell configuration  
- **wezterm/**: WezTerm terminal emulator configuration
- **p10k/**: Powerlevel10k prompt configuration

## Common Commands

### Deployment and Management
```bash
# Deploy all configurations (from repository root)
stow */

# Deploy specific configuration
stow nvim
stow zsh
stow wezterm
stow p10k

# Remove/unstow configuration
stow -D nvim

# Re-deploy after changes
stow -R nvim
```

### Neovim Development
```bash
# Test neovim configuration
nvim --version
nvim +checkhealth

# Update lazy.nvim plugins
nvim +Lazy

# Check LSP status
nvim +LspInfo

# Format code (inside nvim)
<leader>f  # Format file or range using conform.nvim

# Access Mason for LSP/tool management
nvim +Mason
```

## Architecture

### Neovim Configuration Structure
The nvim config follows a modular Lua-based architecture:

- **init.lua**: Entry point that loads core modules and lazy.nvim
- **lua/core/**: Core configuration modules
  - `options.lua`: Vim options and settings
  - `mappings.lua`: Key mappings with space as leader
  - `autocmd.lua`: Auto-commands
  - `lazy.lua`: Plugin manager setup
- **lua/plugins/**: Plugin configurations (auto-loaded by lazy.nvim)
  - `lspconfig.lua`: LSP configurations for Lua, C/C++, Rust, Python
  - `completions.lua`: Blink.cmp completion engine
  - `conform.lua`: Code formatting with language-specific formatters
  - `mason.lua`: LSP/tool installer
  - `trouble.lua`: Diagnostics UI
  - Other minimal plugins for colorscheme, UI, etc.

### Key Design Principles
- **Minimal plugin count**: Deliberately keeps plugins to a minimum
- **Language support**: Pre-configured for Lua, C/C++, Rust, Python, JavaScript, and TypeScript development
- **Modern Neovim**: Uses latest Neovim features (vim.lsp.config, lazy.nvim)
- **Cross-platform**: Stow-based deployment works across Unix-like systems

### Supported Languages & Tools
- **Lua**: lua_ls with vim globals configured
- **C/C++**: clangd LSP, clang-format formatting
- **Rust**: rust-analyzer + bacon-ls, rustfmt formatting  
- **Python**: pyright LSP, black formatting
- **JavaScript/TypeScript**: ts_ls LSP, prettier formatting (supports JS, TS, JSX, TSX)
- **Web Technologies**: prettier formatting for JSON, CSS, HTML, Markdown
- **Formatting**: stylua (Lua), clang-format (C/C++), rustfmt (Rust), black (Python), prettier (JS/TS/web)

## Development Notes

- The nvim configuration is designed to stay minimal - avoid adding unnecessary plugins
- All configurations use symlinks via Stow, so edit files in the dotfiles repo, not the deployed locations
- Plugin management is handled entirely through lazy.nvim with lazy-lock.json for reproducibility
- LSP capabilities are enhanced with blink.cmp for modern completion experience