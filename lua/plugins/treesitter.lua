-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "python",
      "csv",
      "regex",
      "cpp",
      "rust",
      "c_sharp",
      "razor",
      "supercollider",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
