-- JANGAN LUPA GANTI LUALINE

-- ONE DARK PRO THEME --------------------------------------------------
-- local onedarkpro = require 'onedarkpro'
-- onedarkpro.setup({
--   -- theme = "onelight",
--   -- theme = "onedark_dark",
--   theme = "onedark_vivid",
--   colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes
--   highlights = {}, -- Override default highlight groups
--   plugins = { -- Override which plugins highlight groups are loaded
--     nvim_cmp = true,
--     barbar = true,
-- 		native_lsp = true,
-- 		treesitter = true,
--     startify = true,
--     nvim_tree = true,
--     toggleterm = true,
--     telescope = true,
-- 	},
--   styles = {
--       strings = "italic", -- Style that is applied to strings
--       comments = "NONE", -- Style that is applied to comments
--       keywords = "bold,italic", -- Style that is applied to keywords
--       functions = "bold", -- Style that is applied to functions
--       variables = "NONE", -- Style that is applied to variables
--   },
--   options = {
--       bold = true, -- Use the themes opinionated bold styles?
--       italic = true, -- Use the themes opinionated italic styles?
--       underline = true, -- Use the themes opinionated underline styles?
--       undercurl = false, -- Use the themes opinionated undercurl styles?
--       cursorline = true, -- Use cursorline highlighting?
--       transparency = true, -- Use a transparent background?
--       terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
--       window_unfocused_color = true, -- When the window is out of focus, change the normal background?
--   }
-- })

-- onedarkpro.load()

-- TAMBAHAN THEME BIAR GA BOSEN ----------------------------------------------------
require('nightfox').setup {
  options = {
    compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
    compile_file_suffix = '_compiled',
    transparent = true,
    terminal_colors = true,
    dim_inactive = false,
    styles = {
      comments = 'italic',
      conditionals = 'bold,italic',
      constants = 'bold',
      functions = 'bold',
      keywords = 'bold,italic',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'italic',
      types = 'bold',
      variables = 'NONE',
    },

    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },

    modules = {
      barbar = false,
      cmp = true,
      dap_ui = true,
      diagnostic = { enable = true },
      gitsigns = true,
      lsp_saga = true,
      nvimtree = true,
      treesitter = true,
      telescope = true,
    },
  },
  palettes = {},
  specs = {},
  groups = {},
}

vim.cmd [[ autocmd VimEnter * highlight BufferDefaultTabpageFill guibg=NONE ]]
vim.cmd [[ autocmd VimEnter * highlight BufferCurrent guibg=#545556 ]]
vim.cmd [[ autocmd VimEnter * highlight BufferCurrentSign guibg=#545556 ]]
vim.cmd [[ autocmd VimEnter * highlight BufferCurrentIndex guibg=#545556 ]]
vim.cmd [[ autocmd VimEnter * highlight BufferCurrentTarget guibg=#545556 ]]
vim.cmd [[ autocmd VimEnter * highlight BufferCurrentIcon guibg=#545556 ]]
vim.cmd [[ autocmd VimEnter * highlight BufferCurrentMod guibg=#545556 ]]
vim.cmd [[ colorscheme nightfox ]]

-- ADDTIONAL CUSTOM HIGHLIGHT -----------------------------------------------------
-- Additional custom highlighting
vim.cmd [[autocmd BufEnter * highlight TelescopeNormal guibg=NONE]]
vim.cmd [[autocmd BufEnter * highlight TelescopePreviewTitle guibg=NONE]]
vim.cmd [[autocmd BufEnter * highlight TelescopePromptTitle guibg=NONE]]
vim.cmd [[autocmd BufEnter * highlight Normal guibg=NONE]]
vim.cmd [[highlight NormalFloat guibg=NONE]]
vim.cmd [[autocmd BufEnter,VimEnter,FileType NvimTree highlight NvimTreeFolderIcon guibg=NONE]]
vim.cmd [[autocmd BufEnter,VimEnter,FileType NvimTree highlight NvimTreeNormalNC guibg=NONE]]

-- vertical split
vim.cmd[[autocmd VimEnter * highlight VertSplit guifg=#5475E2]]

-- cursorline highlight
vim.cmd [[hi CursorLine guibg=#0A2544]]
