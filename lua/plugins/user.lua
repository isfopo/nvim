-- You can also add or configure plugins by creating files in this `plugins/` folder
---@type LazySpec
return {
  -- customize snacks options
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.notifier = opts.notifier or {}
      opts.notifier.timeout = 10000
      opts.input = opts.input or {}
      opts.terminal = opts.terminal or {}
      opts.scope = { enabled = false }
      opts.indent = opts.indent or {}
      opts.indent.scope = opts.indent.scope or {}
      opts.indent.scope.enabled = false
      opts.indent.scope.treesitter = opts.indent.scope.treesitter or {}
      opts.indent.scope.treesitter.injections = false
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.files = opts.picker.sources.files or { cmd = "fd" }
      opts.picker.sources.grep = opts.picker.sources.grep or { cmd = "ag", git = false }
      return opts
    end,
  },
  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.auto_reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set(
        { "n", "x" },
        "<C-a>",
        function() require("opencode").ask("@this: ", { submit = true }) end,
        { desc = "Ask opencode" }
      )
      vim.keymap.set(
        { "n", "x" },
        "<C-x>",
        function() require("opencode").select() end,
        { desc = "Execute opencode action…" }
      )
      vim.keymap.set(
        { "n", "x" },
        "ga",
        function() require("opencode").prompt "@this" end,
        { desc = "Add to opencode" }
      )
      vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
      vim.keymap.set(
        "n",
        "<S-C-u>",
        function() require("opencode").command "session.half.page.up" end,
        { desc = "opencode half page up" }
      )
      vim.keymap.set(
        "n",
        "<S-C-d>",
        function() require("opencode").command "session.half.page.down" end,
        { desc = "opencode half page down" }
      )
      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
    end,
  },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
