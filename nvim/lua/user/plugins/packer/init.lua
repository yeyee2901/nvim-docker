local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- UI
	use({ "EdenEast/nightfox.nvim", lock = true, commit = "6585499" })
	use({ "nvim-lualine/lualine.nvim", lock = true, commit = "dcd194f" })
	use({ "kyazdani42/nvim-web-devicons", lock = true, commit = "9061e2d" })
	use({ "romgrk/barbar.nvim", lock = true, commit = "f827ad6" })

	-- IDE
	use({ "onsails/lspkind-nvim", lock = true })
	use({ "nvim-treesitter/nvim-treesitter", lock = true, commit = "b9bcbf8" })
	use({ "honza/vim-snippets", lock = true, commit = "b47c2e3" })
	use({ "SirVer/ultisnips", lock = true })
	use({ "hrsh7th/nvim-cmp", lock = true })
	use({ "hrsh7th/cmp-nvim-lsp", lock = true })
	use({ "hrsh7th/cmp-nvim-lua", lock = true })
	use({ "hrsh7th/cmp-path", lock = true })
	use({ "quangnguyen30192/cmp-nvim-ultisnips", lock = true })
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		lock = true,
	})

	use({ "neovim/nvim-lspconfig", lock = true })
	use({ "ray-x/lsp_signature.nvim", lock = true })

	use({ "nvim-treesitter/playground", lock = true })

	-- FILE TREE
	use({ "kyazdani42/nvim-tree.lua", lock = true })

	-- TELESCOPE
	use({ "nvim-lua/plenary.nvim", lock = true })
	use({ "fhill2/telescope-ultisnips.nvim", lock = true })

	use({ "nvim-telescope/telescope.nvim", lock = true })

	-- STARTUP SCREEN
	use({ "glepnir/dashboard-nvim", lock = true, commit = "bd7163f" })

	-- FORMATTER
	use({ "mhartington/formatter.nvim", lock = true })

	-- GIT SUPERPOWER
	use({ "tpope/vim-fugitive", lock = true })
	use({ "lewis6991/gitsigns.nvim", lock = true })

	-- COLOR SELECTOR
	use({ "max397574/colortils.nvim", lock = true })

	-- COMMENT TOGGLE PLUGIN
	use({ "tpope/vim-commentary", lock = true })

	-- BRACKET & SURROUND PLUGIN
	use({ "tpope/vim-surround", lock = true })

	-- INDENT BLANKLINE
	use({ "lukas-reineke/indent-blankline.nvim", lock = true })

	-- GO utils
	use({ "ray-x/go.nvim", lock = true })
	use({ "ray-x/guihua.lua", lock = true })
	use({
		"edolphin-ydf/goimpl.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		lock = true,
	})

	-- DEBUGGER
	use({ "mfussenegger/nvim-dap", lock = true })
	use({ "leoluz/nvim-dap-go", lock = true })
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		lock = true,
	})

	-- KITTY FILETYPE PLUGIN
	use({ "fladson/vim-kitty", lock = true })


    -- automatically install packer after cloning
	if packer_bootstrap then
		require("packer").sync()
	end
end)
