-- PDF viewing support
-- Requires a Kitty/Ghostty-compatible terminal for image rendering;
-- otherwise pdfreader.nvim falls back to text mode.

---@type LazySpec
return {
  "r-pletnev/pdfreader.nvim",
  lazy = false,
  dependencies = {
    "folke/snacks.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("pdfreader").setup()
  end,
}