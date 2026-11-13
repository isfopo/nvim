# Neovim Configuration Manual

This manual documents the Neovim configuration in this repository. It is based on
[AstroNvim v5](https://github.com/AstroNvim/AstroNvim) and is tailored for Lua,
Python, JavaScript/TypeScript, Rust, HTML/CSS, YAML, Go, and LilyPond.

## 1. Prerequisites

- Neovim 0.9+ (tested with 0.12)
- Git
- A Nerd Font (recommended for icons)
- `fd` and `ag` (used by the Snacks picker)
- Language toolchains as needed:
  - `python3`, `black`, `flake8`
  - `node`, `tsc`
  - `cargo`, `rustc`, `rustfmt`
  - `go`, `gopls`
  - `lilypond`, `mpv`, `ffmpeg`

Mason installs most LSP servers, formatters, linters, and debuggers automatically.

## 2. Installation

```sh
git clone https://github.com/isfopo/nvim.git ~/.config/nvim
nvim
```

Lazy.nvim installs plugins on first start. Run `:MasonToolsInstall` to install
Mason-managed tools.

## 3. Neovim Basics

### Modes

- `i` - Insert mode
- `Esc` / `jk` (if configured) - Normal mode
- `v` - Visual mode
- `V` - Visual line mode
- `Ctrl-v` - Visual block mode
- `:` - Command-line mode

### Movement

- `h`, `j`, `k`, `l` - left/down/up/right
- `w`, `b`, `e` - word motions
- `0`, `$` - start/end of line
- `gg`, `G` - top/bottom of file
- `Ctrl-d`, `Ctrl-u` - half-page scroll (smooth via Neoscroll)
- `%` - matching bracket

### Editing

- `x` - delete character
- `dd` - delete line
- `yy` - yank line
- `p`, `P` - paste after/before
- `u` - undo
- `r` - redo (remapped in this config)
- `.` - repeat last change
- `ciw`, `di"`, `ya(` - change/delete/yank text objects

### Windows, Buffers, Tabs

- `Ctrl-w v` / `Ctrl-w s` - split vertically/horizontally
- `Ctrl-h/j/k/l` - move between windows
- `]b` / `[b` - next/previous buffer
- `<Leader>bd` - close buffer from tabline
- `:b name` - switch buffer

### Commands and Help

- `:w` - save
- `:q` - quit
- `:wq` - save and quit
- `:Lazy` - plugin manager
- `:Mason` - tool manager
- `:LspInfo` - LSP status
- `:help topic` - Neovim help
- `:checkhealth` - diagnostics

### Files

- `<Space>ff` (or dashboard `f`) - find files
- `<Space>fg` (or dashboard `g`) - grep text
- `<Space>fb` - find buffers
- `<Space>fr` - recent files

## 4. Configuration Structure

```
init.lua              # bootstrap Lazy.nvim
lua/lazy_setup.lua    # plugin spec imports
lua/community.lua     # disabled (AstroCommunity)
lua/polish.lua        # disabled
lua/plugins/*.lua     # user plugin specs
```

Plugin files return LazySpec tables. AstroNvim defaults are imported from
`astronvim.plugins`; files in `lua/plugins/` override or extend them.

## 5. Core Settings

Configured in `lua/plugins/astrocore.lua`:

- Relative and absolute line numbers
- Spell checking enabled
- Sign column always visible
- No line wrap
- Large-file safeguards
- Autopairs, completion, diagnostics, URL highlighting, notifications
- Redo mapped to `r`

## 6. UI

Configured in `lua/plugins/astroui.lua`:

- Colorscheme: `rose-pine-moon`
- Rose Pine plugin loaded from `lua/plugins/rose-pine.lua`

## 7. Completion

`lua/plugins/blink.lua` configures Blink.cmp:

- Sources: LSP, path, snippets, buffer
- `Tab` - accept completion / snippet forward / AI suggestion
- `Shift-Tab` - snippet backward
- `Ctrl-Space` - trigger completion

## 8. LSP

`lua/plugins/astrolsp.lua` configures AstroLSP:

- Format on save enabled
- Inlay hints, semantic tokens, codelens enabled
- Active servers:
  - `gopls`
  - Mason-managed servers (pyright, html-lsp, css-lsp, typescript-language-server,
    rust-analyzer, yaml-language-server, lua-language-server)

Common LSP keys (AstroNvim defaults):

- `gd` - go to definition
- `gD` - go to declaration
- `gr` - references
- `gi` - implementation
- `<Leader>lr` - rename
- `<Leader>la` - code action
- `<Leader>lh` - hover
- `<Leader>uY` - toggle semantic tokens

## 9. Formatting and Linting

`lua/plugins/none-ls.lua` adds:

- Formatters: `stylua`, `prettier`, `black`
- Linters: `yamllint`, `flake8`
- Spell completion

Mason installs tools listed in `lua/plugins/mason.lua`.

## 10. Treesitter

`lua/plugins/treesitter.lua` ensures parsers for:

- lua, vim, javascript, typescript, css, scss, html, python, csv, regex,
  rust, yaml, go

## 11. Debugging

AstroNvim provides nvim-dap with these keys:

- `F5` / `<Leader>dc` - start/continue
- `F9` / `<Leader>db` - toggle breakpoint
- `F10` / `<Leader>do` - step over
- `F11` / `<Leader>di` - step into
- `Shift+F11` / `<Leader>dO` - step out
- `<Leader>dq` - close session
- `<Leader>dQ` - terminate session

Go debugging uses `delve` via `nvim-dap-go`.

## 12. Language Support

### Lua

- `lua-language-server`
- `stylua` formatting

### Python

- `pyright`
- `black` formatting
- `flake8` linting
- `debugpy` debugging

### JavaScript / TypeScript

- `typescript-language-server`
- `prettier` formatting
- `js-debug-adapter` debugging

### Rust

- `rust-analyzer`
- `rustfmt` formatting
- `codelldb` debugging

### HTML / CSS

- `html-lsp`, `css-lsp`

### YAML

- `yaml-language-server`
- `yamllint`

### Go

- `gopls`
- `delve` debugging
- Format on save via gopls

### LilyPond

Plugin: `martineausimon/nvim-lilypond-suite`

- Syntax highlighting
- Async `:make`
- Audio player using `mpv` + `ffmpeg`
- Hyphenation for lyrics
- Supports embedded LilyPond in LaTeX/TeXinfo

Dependencies: `lilypond`, `mpv`, `ffmpeg`.

## 13. Key Mappings

### Core

| Key | Action |
|-----|--------|
| `r` | Redo |
| `]b` / `[b` | Next/previous buffer |
| `<Leader>bd` | Close buffer from tabline |
| `Ctrl-e` | Toggle file explorer sidebar |
| `Ctrl-p` | Find files |

### OpenCode (AI)

| Key | Action |
|-----|--------|
| `Ctrl-a` | Ask AI about selection |
| `Ctrl-x` | Execute AI action |
| `ga` | Add selection to AI context |
| `Ctrl-.` | Toggle OpenCode |
| `Shift-Ctrl-u` / `Shift-Ctrl-d` | Scroll chat |

### Neoscroll

| Key | Action |
|-----|--------|
| `Ctrl-u/d/b/f/y` | Smooth scroll |
| `zt`, `zz`, `zb` | Scroll positioning |

## 14. Customization

- Add plugins in `lua/plugins/`
- Modify mappings/options in `lua/plugins/astrocore.lua`
- Change colorscheme in `lua/plugins/astroui.lua`
- Configure LSP in `lua/plugins/astrolsp.lua`
- Adjust Mason tools in `lua/plugins/mason.lua`

## 15. Troubleshooting

- Plugins not loading: `rm -rf ~/.local/share/nvim/lazy && nvim`
- LSP issues: `:LspInfo`, `:Mason`
- Missing tools: `:MasonToolsInstall`
- Profile performance: `:Lazy profile`

## 16. Managed Files

- `init.lua`
- `lua/lazy_setup.lua`
- `lua/plugins/astrocore.lua`
- `lua/plugins/astrolsp.lua`
- `lua/plugins/astroui.lua`
- `lua/plugins/blink.lua`
- `lua/plugins/mason.lua`
- `lua/plugins/neoscroll.lua`
- `lua/plugins/none-ls.lua`
- `lua/plugins/rose-pine.lua`
- `lua/plugins/treesitter.lua`
- `lua/plugins/user.lua`
- `lua/plugins/aerial.lua`
- `lua/plugins/dap-go.lua`
- `lua/plugins/lilypond.lua`
