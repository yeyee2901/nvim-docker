local cmp_ok, _ = pcall(require, 'cmp')
local lsp_ok, _ = pcall(require, 'lspconfig')
local ts_ok, _ = pcall(require, 'nvim-treesitter')

if cmp_ok and lsp_ok and ts_ok then
  require 'user.ide.treesitter'
  require 'user.ide.lsp'
  require 'user.ide.cmp'
end
