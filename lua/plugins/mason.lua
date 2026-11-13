return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "pyright",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "rust-analyzer",
        "yaml-language-server",

        -- install formatters
        "stylua",
        "black",
        "prettier",

        -- install debuggers
        "debugpy",
        "js-debug-adapter",
        "codelldb",

        -- install linters
        "flake8",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
