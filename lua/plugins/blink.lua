return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {
        "snippet_forward",
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          name = "lsp",
          module = "blink.cmp.sources.lsp",
          score_offset = 100,
        },
        path = {
          name = "path",
          module = "blink.cmp.sources.path",
          score_offset = 25,
        },
        snippets = {
          name = "snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = -50,
        },
        buffer = {
          name = "buffer",
          module = "blink.cmp.sources.buffer",
          score_offset = -100,
        },
      },
    },
    completion = {
      menu = {
        border = "rounded",
      },
      documentation = {
        window = {
          border = "rounded",
        },
      },
    },
  },
}