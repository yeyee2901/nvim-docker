local theme_ok, _ = pcall(require, 'onedarkpro')
local lualine_ok, _ = pcall(require, 'lualine')
local nvim_tree_ok, _ = pcall(require, 'nvim-tree')

if theme_ok and lualine_ok and nvim_tree_ok then
  require 'dayum.theme.color'
  require 'dayum.theme.lualine'
  require 'dayum.theme.nvim-tree'
end
