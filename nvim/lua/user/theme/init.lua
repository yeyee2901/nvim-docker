local theme_ok, _ = pcall(require, 'onedarkpro')
local lualine_ok, _ = pcall(require, 'lualine')
local nvim_tree_ok, _ = pcall(require, 'nvim-tree')

if theme_ok and lualine_ok and nvim_tree_ok then
  require 'user.theme.color'
  require 'user.theme.lualine'
end
