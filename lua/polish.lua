-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

if vim.fn.argc() == 0 then
  vim.schedule(function()
    require("lazy").load { plugins = { "neo-tree.nvim" } }
    vim.cmd "Neotree show"
  end)
end