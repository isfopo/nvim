return {
  {
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function() require("dap-go").setup() end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "delve" },
      automatic_installation = true,
    },
  },
}