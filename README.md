# AstroNvim Configuration

**NOTE:** This is for AstroNvim v5+

A comprehensive Neovim configuration based on [AstroNvim](https://github.com/AstroNvim/AstroNvim) with enhanced features for development across multiple languages including C#, Python, JavaScript/TypeScript, Rust, Lua, and SuperCollider.

## ✨ Features & Capabilities

### 🚀 Core Features
- **Modern Plugin Management**: Lazy-loaded plugins with [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Fast Completion**: [Blink.cmp](https://github.com/Saghen/blink.cmp) with LSP, snippets, and buffer completion
- **AI-Powered Coding**: [Supermaven](https://github.com/supermaven-inc/supermaven-nvim) AI code completion
- **Smooth Scrolling**: [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) for buttery smooth scrolling
- **Beautiful UI**: [Rose Pine](https://github.com/rose-pine/neovim) color scheme with custom highlights
- **Dashboard**: [Snacks](https://github.com/folke/snacks.nvim) dashboard with project management

### 💻 Language Support

#### C# / .NET Development
- **OmniSharp LSP**: Full C# language server support with Roslyn
- **Easy Dotnet**: Project management, testing, debugging, and building
- **Netcoredbg**: Integrated debugging for .NET applications
- **Csharpier**: Code formatting
- **Test Runner**: Integrated test execution and debugging

#### Python Development
- **Pyright LSP**: Type checking and IntelliSense
- **Black**: Code formatting
- **Flake8**: Linting
- **Debugpy**: Python debugging

#### JavaScript/TypeScript
- **TypeScript Language Server**: Full TypeScript support
- **Prettier**: Code formatting
- **ESLint**: Linting (configurable)

#### Rust
- **rust-analyzer**: Complete Rust language support
- **rustfmt**: Code formatting

#### Lua
- **lua-language-server**: Lua LSP with full Neovim API support
- **Stylua**: Lua code formatting

#### SuperCollider
- **scnvim**: SuperCollider development environment
- **Post Window**: Integrated REPL and output display
- **Server Control**: Start/stop SuperCollider server

#### Web Development
- **HTML/CSS LSP**: Web development support
- **YAML**: YAML language support with linting

### 🛠️ Development Tools
- **Mason**: Automatic installation of LSP servers, formatters, linters, and debuggers
- **Treesitter**: Advanced syntax highlighting for 20+ languages
- **None-ls**: Additional formatters and linters
- **Spell Checking**: Built-in spell checking
- **Auto Pairs**: Automatic bracket completion
- **Snippets**: LuaSnip integration

### 🎨 UI/UX Enhancements
- **Relative Line Numbers**: Better navigation
- **Sign Column**: Git and diagnostic indicators
- **Virtual Text**: Inline diagnostics
- **Inlay Hints**: Type hints and parameter information
- **Semantic Tokens**: Enhanced syntax highlighting
- **Notifications**: Toast-style notifications

## 🛠️ Installation

### Prerequisites
- Neovim 0.9+
- Git
- A Nerd Font (recommended for icons)

### Quick Install

#### Backup existing config (if any)
```shell
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null || true
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null || true
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null || true
```

#### Clone this repository
```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim
```shell
nvim
```

Lazy.nvim will automatically install all plugins and Mason tools on first startup.

## 🚀 Usage

### Getting Started
1. Open Neovim: `nvim`
2. The dashboard will appear on startup (if no file is opened)
3. Use `<Space>ff` to find files
4. Use `<Space>fg` to search text
5. Use `<Space>fb` to browse buffers

### Key Concepts
- **Leader Key**: `<Space>` (spacebar)
- **Local Leader**: `,` (comma)
- **Window Navigation**: `<C-h/j/k/l>` (Ctrl + h/j/k/l)
- **Buffer Navigation**: `]b` / `[b` (next/previous buffer)

## ⌨️ Key Mappings

### Core Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>` | Leader | Main command prefix |
| `,` | Local Leader | Secondary command prefix |
| `<C-h/j/k/l>` | Window Navigation | Move between splits |
| `]b` / `[b` | Buffer Navigation | Next/previous buffer |
| `<Space>bd` | Close Buffer | Close current buffer |

### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>ff` | Find Files | Fuzzy find files |
| `<Space>fg` | Grep Search | Search text in files |
| `<Space>fb` | Find Buffers | Browse open buffers |
| `<Space>fr` | Recent Files | Recently opened files |

### LSP Features
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to Definition | Jump to definition |
| `gD` | Go to Declaration | Jump to declaration |
| `gr` | References | Find all references |
| `gi` | Implementation | Go to implementation |
| `<Space>lr` | Rename | Rename symbol |
| `<Space>la` | Code Action | Show code actions |
| `<Space>lh` | Hover | Show hover information |
| `<Space>uY` | Toggle Semantic | Toggle semantic highlighting |

### Completion & Snippets
| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | Complete/Accept | Complete or accept AI suggestion |
| `<S-Tab>` | Previous | Previous completion/snippet |
| `<C-Space>` | Trigger | Manually trigger completion |

### .NET Development (Easy Dotnet)
| Key | Action | Description |
|-----|--------|-------------|
| `<C-p>` | Run Project | Run .NET project |
| `<leader>r` | Run Test | Run test from buffer |
| `<leader>R` | Run All Tests | Run all tests |
| `<leader>d` | Debug Test | Debug test |
| `<leader>p` | Peek Stacktrace | View test failure details |

### SuperCollider (SCNvim)
| Key | Action | Description |
|-----|--------|-------------|
| `<M-e>` | Send Line | Execute current line |
| `<F3>` | Send Block | Execute selected block |
| `<CR>` | Toggle Post | Show/hide post window |
| `<F12>` | Hard Stop | Stop all sound |
| `<leader>st` | Start SCLang | Start SuperCollider |
| `<leader>sk` | Recompile | Recompile class library |
| `<F1>` | Boot Server | Start SuperCollider server |
| `<F2>` | Show Meter | Display audio meter |

### AI Assistant (OpenCode)
| Key | Action | Description |
|-----|--------|-------------|
| `<C-a>` | Ask AI | Ask AI about selection |
| `<C-x>` | Execute Action | Execute AI action |
| `ga` | Add to Context | Add selection to AI context |
| `<C-.>` | Toggle AI | Toggle AI assistant |

### Other Features
| Key | Action | Description |
|-----|--------|-------------|
| `r` | Redo | Redo last action |
| `<Space>th` | Toggle Theme | Switch color schemes |
| `<Space>tl` | Toggle LSP | Toggle LSP features |

## 🔧 Customization

### Adding Plugins
Add new plugins in `lua/plugins/` directory. Each plugin should return a LazySpec table.

Example: `lua/plugins/my-plugin.lua`
```lua
return {
  "author/plugin-name",
  opts = {
    -- plugin options
  }
}
```

### Modifying Mappings
Edit `lua/plugins/astrocore.lua` to add custom keybindings:

```lua
mappings = {
  n = {
    ["<Leader>mykey"] = { ":MyCommand<CR>", desc = "My custom command" }
  }
}
```

### Colorscheme
The default colorscheme is `rose-pine-moon`. Change in `lua/plugins/astroui.lua`:

```lua
colorscheme = "your-colorscheme"
```

### LSP Configuration
Modify LSP settings in `lua/plugins/astrolsp.lua`:
- Add new language servers
- Configure formatting options
- Customize diagnostics

## 🐛 Troubleshooting

### Common Issues

**Plugins not loading:**
```bash
# Clear plugin cache
rm -rf ~/.local/share/nvim/lazy
# Restart Neovim
```

**LSP not working:**
```vim
:LspInstall <language-server>
:LspInfo
```

**Mason tools not installing:**
```vim
:Mason
:MasonInstallAll
```

### Performance
- Large files (>1MB) automatically disable heavy features
- Use `:Lazy profile` to identify slow plugins
- Consider disabling unused language servers

### Logs
- LSP logs: `~/.local/state/nvim/lsp.log`
- Lazy logs: `:Lazy log`
- General logs: `:messages`

## 📚 Resources

- [AstroNvim Documentation](https://docs.astronvim.com/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This configuration is provided as-is. Feel free to use and modify for your needs.
