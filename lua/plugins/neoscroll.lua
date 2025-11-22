return {
  "karb94/neoscroll.nvim",
  opts = {
    easing = "quartic",
    mappings = { -- disable Ctrl+e mapping to avoid conflict with scnvim
      "<C-u>",
      "<C-d>",
      "<C-b>",
      "<C-f>",
      "<C-y>",
      -- "<C-e>", -- disabled to avoid conflict with scnvim
      "zt",
      "zz",
      "zb",
    },
  },
}
