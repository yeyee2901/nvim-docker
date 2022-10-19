local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

require('packer').startup(function(use)
  -- My plugins here
  use { 'wbthomason/packer.nvim' }

  -- DISCORD
  use { 'andweeb/presence.nvim' }

  -- THEME
  use { 'EdenEast/nightfox.nvim' }
  use { 'olimorris/onedarkpro.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'romgrk/barbar.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }

  -- IDE
  use { 'onsails/lspkind-nvim' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'honza/vim-snippets' }
  use { 'SirVer/ultisnips' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-path' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
  }

  use { 'neovim/nvim-lspconfig' }
  use { 'ray-x/lsp_signature.nvim' }

  use { 'nvim-treesitter/playground' }

  -- TELESCOPE
  use { 'nvim-lua/plenary.nvim' }
  use { 'fhill2/telescope-ultisnips.nvim' }

  use { 'nvim-telescope/telescope.nvim' }

  -- STARTIFY
  use { 'mhinz/vim-startify' }

  -- FORMATTER
  use { 'mhartington/formatter.nvim' }

  -- GIT SUPERPOWER
  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim' }

  -- COLOR UTILS
  -- use { 'norcalli/nvim-colorizer.lua' }
  use { 'max397574/colortils.nvim' }

  -- COMMENTARY PLUGIN
  use { 'tpope/vim-commentary' }

  -- BRACKET & SURROUND PLUGIN
  use { 'jiangmiao/auto-pairs' }
  use { 'tpope/vim-surround' }

  -- REMOTE EDITING
  use { 'chipsenkbeil/distant.nvim' }

  -- INDENT BLANKLINE
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- GO utils
  use { 'ray-x/go.nvim' }
  use { 'ray-x/guihua.lua' }
  use {
    'edolphin-ydf/goimpl.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
  }

  -- FLUTTER
  use { 'akinsho/flutter-tools.nvim' }

  -- TOGGLETERM
  use {
    'akinsho/toggleterm.nvim',
    lock = true,
  }

  -- DEBUGGER
  use { 'mfussenegger/nvim-dap' }
  use { 'leoluz/nvim-dap-go' }
  use {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' },
  }

  -- KITTY FILETYPE PLUGIN
  use { 'fladson/vim-kitty' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require 'dayum.plugins.activate'
