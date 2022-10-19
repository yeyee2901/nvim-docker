-- BASIC SETTINGS -----------------------------------------------
local my_options = {
  encoding = 'utf8',
  number = true,
  clipboard = 'unnamedplus', -- Requires xclip (apt)
  mouse = 'a',
  swapfile = false,
  tabstop = 4, -- Default
  softtabstop = 4, -- Default
  shiftwidth = 4, -- Default
  expandtab = true, -- tab turns into spaces
  smartindent = true,
  smarttab = true,
  wrap = false,
  ignorecase = true, -- ignore case for search commands
  timeout = true, -- set keystroke timeout to be longer
  timeoutlen = 2000, -- in this case 2 seconds (pardon, I have slow hand sickness)
  updatetime = 1000,
  hlsearch = false,
  hidden = true,
  termguicolors = true,
  cursorline = true,
  inccommand = 'split',
  signcolumn = 'yes',
  colorcolumn = '0', -- disable color column
  lazyredraw = true,
  splitbelow = true,
  splitright = true,
  laststatus = 3, -- 3 = global, 2 = each window
  winbar = '%f', -- %f = show filename by default, requires neovim 0.8.0
}

-- Allow Lua syntax in vimscripts ('l' = lua)
vim.g.vimsyn_embed = 'l'

vim.cmd 'filetype indent plugin on'
vim.cmd 'syntax on'

-- set all options
for option, value in pairs(my_options) do
  vim.opt[option] = value
end

-- FOLDING
-- https://www.reddit.com/r/neovim/comments/opznf4/custom_foldtext_in_lua/
vim.cmd [[
function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
    return '    ' . line_text . repeat('.', fillcharcount) . '  ' . folded_line_num . ' Lines'
endfunction

set foldtext=MyFoldText()
]]
