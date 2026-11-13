-- This will run last in the setup process.

-- Neovim 0.12's built-in Markdown `#set-lang-from-info-string!` directive is
-- currently broken, so build an explicit injection query for common fenced
-- code block languages instead.
local injection_aliases = {
  lua = "lua",
  python = "python",
  py = "python",
  bash = "bash",
  sh = "bash",
  zsh = "bash",
  javascript = "javascript",
  js = "javascript",
  typescript = "typescript",
  ts = "typescript",
  rust = "rust",
  go = "go",
  vim = "vim",
  c = "c",
  cpp = "cpp",
  css = "css",
  scss = "scss",
  html = "html",
  json = "json",
  yaml = "yaml",
  yml = "yaml",
  toml = "toml",
  sql = "sql",
  markdown = "markdown",
  md = "markdown",
  xml = "xml",
  regex = "regex",
  query = "query",
  csv = "csv",
  kdl = "kdl",
  supercollider = "supercollider",
}

local parts = {}
for alias, lang in pairs(injection_aliases) do
  parts[#parts + 1] = string.format(
    [[(fenced_code_block
  (info_string (language) @_lang)
  (code_fence_content) @injection.content
  (#eq? @_lang %q)
  (#set! injection.language %q))]],
    alias,
    lang
  )
end

parts[#parts + 1] = [[((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))]]

parts[#parts + 1] = [[((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))]]

parts[#parts + 1] = [[((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))]]

vim.treesitter.query.set("markdown", "injections", table.concat(parts, "\n"))

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then
        return
      end
      vim.treesitter.start(args.buf, "markdown")
      local parser = vim.treesitter.get_parser(args.buf, "markdown")
      if parser then
        parser:parse(true)
      end
    end)
  end,
})

if vim.fn.argc() == 0 then
  vim.schedule(function()
    require("lazy").load { plugins = { "neo-tree.nvim" } }
    vim.cmd "Neotree show"
  end)
end
