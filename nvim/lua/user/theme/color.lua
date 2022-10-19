require("nightfox").setup({
	options = {
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled",
		transparent = true,
		terminal_colors = true,
		dim_inactive = false,
		styles = {
			comments = "italic",
			conditionals = "bold,italic",
			constants = "bold",
			functions = "bold",
			keywords = "bold,italic",
			numbers = "NONE",
			operators = "NONE",
			strings = "italic",
			types = "bold",
			variables = "NONE",
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
	groups = {
    all = {
      ["@property"] = { link = "Identifier" },   -- kayaknya authornya kelewatan satu identifier ini
    }
	},
})

vim.cmd([[ colorscheme nightfox ]])

-- ADDTIONAL CUSTOM HIGHLIGHT -----------------------------------------------------
-- transparent = best
vim.cmd([[autocmd BufEnter * highlight TelescopeNormal guibg=NONE]])
vim.cmd([[autocmd BufEnter * highlight TelescopePreviewTitle guibg=NONE]])
vim.cmd([[autocmd BufEnter * highlight TelescopePromptTitle guibg=NONE]])
vim.cmd([[autocmd BufEnter * highlight Normal guibg=NONE]])
vim.cmd([[highlight NormalFloat guibg=NONE]])
vim.cmd([[autocmd BufEnter,VimEnter,FileType NvimTree highlight NvimTreeFolderIcon guibg=NONE]])
vim.cmd([[autocmd BufEnter,VimEnter,FileType NvimTree highlight NvimTreeNormalNC guibg=NONE]])
vim.cmd([[autocmd VimEnter * highlight VertSplit guifg=#5475E2]])
vim.cmd([[hi CursorLine guibg=#0A2544]])
