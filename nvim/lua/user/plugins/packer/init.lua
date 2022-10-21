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
	use({ "onsails/lspkind-nvim", lock = true, commit = "c68b3a003483cf382428a43035079f78474cd11e" })
	use({ "nvim-treesitter/nvim-treesitter", lock = true, commit = "b9bcbf8" })
	use({ "honza/vim-snippets", lock = true, commit = "b47c2e3" })
	use({ "SirVer/ultisnips", lock = true, commit = "e99fdf15cd55a4a8e0cb0a80a6810c1867a5c401" })
	use({ "hrsh7th/nvim-cmp", lock = true, commit = "e94d3489311f941788756953df23ca84f83eec95" })
	use({ "hrsh7th/cmp-nvim-lsp", lock = true, commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" })
	use({ "hrsh7th/cmp-nvim-lua", lock = true, commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
	use({ "hrsh7th/cmp-path", lock = true, commit = "91ff86cd9c29299a64f968ebb45846c485725f23" })
	use({ "quangnguyen30192/cmp-nvim-ultisnips", lock = true, commit = "21f02b62deb409ce69928a23406076bd0043ddbc" })
	use({ "glepnir/lspsaga.nvim", lock = true, commit = "5f17b9b7a8becc7d1593aae80d263ec936ae5ca7" })
	use({ "neovim/nvim-lspconfig", lock = true, commit = "ee2e8c63cff0a8bfc7f4ef985ea466f10bb7e691" })
	use({ "ray-x/lsp_signature.nvim", lock = true, commit = "ad1f9b413e27a8cb86893326e7b02982c69fe3f3" })
	use({ "nvim-treesitter/playground", lock = true, commit = "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf" })

	-- FILE TREE
	use({ "kyazdani42/nvim-tree.lua", lock = true, commit = "2b970635d1ef531355a380258372411576ecad4d" })

	-- TELESCOPE
	use({ "nvim-lua/plenary.nvim", lock = true, commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })
	use({ "nvim-telescope/telescope.nvim", lock = true, commit = "f174a0367b4fc7cb17710d867e25ea792311c418" })
	use({ "fhill2/telescope-ultisnips.nvim", lock = true, commit = "f48b6d4f53b31507d3fd514905c6940409e8ada8" })

	-- STARTUP SCREEN
	use({ "glepnir/dashboard-nvim", lock = true, commit = "bd7163f" })

	-- FORMATTER
	use({ "mhartington/formatter.nvim", lock = true, commit = "88aa63ba216708611b472d8737b96af71c2f3785" })

	-- GIT SUPERPOWER
	use({ "tpope/vim-fugitive", lock = true, commit = "dd8107cabf5fe85df94d5eedcae52415e543f208" })
	use({ "lewis6991/gitsigns.nvim", lock = true, commit = "21ab05c2629ef613b1c3452d12469f936855648b" })

	-- COLOR SELECTOR
	use({ "max397574/colortils.nvim", lock = true, commit = "49bbc9c849fa279378d451765f4a978878691c42" })

	-- COMMENT TOGGLE PLUGIN
	use({ "tpope/vim-commentary", lock = true, commit = "3654775824337f466109f00eaf6759760f65be34" })

	-- BRACKET & SURROUND PLUGIN
	use({ "tpope/vim-surround", lock = true, commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" })

	-- INDENT BLANKLINE
	use({ "lukas-reineke/indent-blankline.nvim", lock = true, commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })

	-- GO utils
	use({ "ray-x/go.nvim", lock = true, commit = "7720ddcbeac7fee4a2d30079f3c3c9d26a1236b5" })
	use({ "ray-x/guihua.lua", lock = true, commit = "2fce8a8b462cf6599d9422efb157773126e1c7ce" })
	use({
		"edolphin-ydf/goimpl.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		lock = true,
        commit = "df010c46af75f3231e5369e60dd39a69fbc9449b",
	})

	-- DEBUGGER
	use({ "mfussenegger/nvim-dap", lock = true, commit = "3d0d7312bb2a8491eb2927504e5cfa6e81b66de4" })
	use({ "leoluz/nvim-dap-go", lock = true, commit = "c2902bb96c45e872d947d7e174775e652439add4" })
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		lock = true,
        commit = "0a63115d72e071223e1711ce630e9e7b5737c948",
	})

	-- KITTY FILETYPE PLUGIN
	use({ "fladson/vim-kitty", lock = true, commit = "b2d3453bf7925b5657f853afe3ca0f9b6edf30b4" })

    -- automatically install packer after cloning
	if packer_bootstrap then
		require("packer").sync()
	end
end)
