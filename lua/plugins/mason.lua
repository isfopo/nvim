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
        -- "sass-language-server",
        "typescript-language-server",
        "omnisharp",
        "rust-analyzer",
        "svelte-language-server",
        "clangd",

        -- install formatters
        "stylua",
        "black",
        "prettier",
        "csharpier",
        "rustfmt",
        "clang-format",

        -- install debuggers
        "debugpy",
        "js-debug-adapter",
        "netcoredbg",
        "codelldb",

        -- install linters
        "flake8",
        -- "eslint",
        -- "clippy",
        -- "clang-tidy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
