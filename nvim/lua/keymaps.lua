local map = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

-- SET LEADER KEY
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

VISUAL_MODE_MAPPING = {
	-- INDENT CONTROL
	{ ["<Tab>"] = ">gv" },
	{ ["<S-Tab>"] = "<gv" },

	-- DELETING MULTIPLE ROW IN SAME COLUMN (in V-BLOCK mode)
	{ ["<BS>"] = "xgv" },

	-- APPENDING ON LAST COLUMN ON (V-BLOCK MODE ONLY)
	{ ["aa"] = "$<S-a>" },
}

INSERT_MODE_MAPPING = {
	{ ["<C-K>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
}

NORMAL_MODE_MAPPING = {
	-- SESSION
	{ ["<Leader>so"] = "<cmd>source Session.vim<CR>" },
	{ ["<Leader>ss"] = "<cmd>mksession!<CR>" },

	-- FOLDING
	-- activate fold
	{ ["<Leader>zf"] = ":set foldmethod=indent<CR>" },

	-- SEARCHING & REPLACE
	{ ["S"] = ":%s" },
	{ ["<S-h>"] = "<cmd>set hlsearch!<CR>" },

	-- WINDOW MOVEMENT KEYMAPS
	{ ["<C-h>"] = "<C-w>h" },
	{ ["<C-l>"] = "<C-w>l" },
	{ ["<C-j>"] = "<C-w>j" },
	{ ["<C-k>"] = "<C-w>k" },

	-- OPEN SPLIT WINDOW
	{ ["sh"] = "<C-w>s" },
	{ ["sv"] = "<C-w>v" },
	{ ["sq"] = "<C-w>q" },

	-- SPLIT WINDOW RESIZING
	{ ["<M-k>"] = "<C-w>+" },
	{ ["<M-j>"] = "<C-w>-" },
	{ ["<M-l>"] = "<C-w>>" },
	{ ["<M-h>"] = "<C-w><" },

	-- ROTATING WINDOW
	{ ["<S-r>"] = "<C-w>r" },

	-- PLUGIN: barbar.nvim
	{ ["<Tab>l"] = "<cmd>BufferNext<CR>" },
	{ ["<Tab>h"] = "<cmd>BufferPrevious<CR>" },
	{ ["<Tab>1"] = "<cmd>BufferGoto 1<CR>" },
	{ ["<Tab>2"] = "<cmd>BufferGoto 2<CR>" },
	{ ["<Tab>3"] = "<cmd>BufferGoto 3<CR>" },
	{ ["<Tab>4"] = "<cmd>BufferGoto 4<CR>" },
	{ ["<Tab>5"] = "<cmd>BufferGoto 5<CR>" },
	{ ["<Tab>6"] = "<cmd>BufferGoto 6<CR>" },
	{ ["<Tab>7"] = "<cmd>BufferGoto 7<CR>" },
	{ ["<Tab>8"] = "<cmd>BufferGoto 8<CR>" },
	{ ["<Tab>9"] = "<cmd>BufferGoto 9<CR>" },
	{ ["<Tab>0"] = "<cmd>BufferLast<CR>" },
	{ ["<Tab>p"] = "<cmd>BufferPin<CR>" },
	{ ["<Tab><Tab>"] = "<cmd>BufferPick<CR>" },
	{ ["<Tab>H"] = "<cmd>BufferMovePrevious<CR>" },
	{ ["<Tab>L"] = "<cmd>BufferMoveNext<CR>" },
	{ ["<Tab>q"] = "<cmd>BufferClose<CR>" },
	{ ["<Tab>Q"] = "<cmd>BufferCloseAllButPinned<CR>" },

	-- PLUGIN: Nvim-tree
	{ ["<Leader>n"] = "<cmd>NvimTreeToggle<CR>" },

	-- PLUGIN: Telescope
	{ ["<Leader>t?"] = "<cmd>Telescope keymaps<CR>" },
	{ ["<Leader>th"] = "<cmd>Telescope help_tags<CR>" },
	{ ["<Leader>tc"] = "<cmd>Telescope commands<CR>" },
	{ ["<Leader>tf"] = "<cmd>Telescope find_files<CR>" },
	{ ["<Leader>tb"] = "<cmd>Telescope buffers<CR>" },
	{ ["<Leader>tz"] = "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
	{ ["<Leader>ts"] = "<cmd>Telescope live_grep<CR>" },
	{ ["<Leader>tt"] = "<cmd>Telescope treesitter<CR>" },
	{ ["<Leader>td"] = "<cmd>Telescope diagnostics<CR>" },
	{ ["<Leader>tlds"] = "<cmd>Telescope lsp_document_symbols<CR>" },
	{ ["<Leader>tla"] = "<cmd>Telescope lsp_range_code_actions<CR>" },
	{ ["<Leader>tlgd"] = "<cmd>Telescope lsp_definitions<CR>" },
	{ ["<Leader>tlr"] = "<cmd>Telescope lsp_references<CR>" },
	{ ["<Leader>tgb"] = "<cmd>Telescope git_branches<CR>" },
	{ ["<Leader>tgs"] = "<cmd>Telescope git_status<CR>" },
	{ ["<Leader>tgf"] = "<cmd>Telescope git_files<CR>" },
	{ ["<Leader>tgca"] = "<cmd>Telescope git_commits<CR>" },
	{ ["<Leader>tgcb"] = "<cmd>Telescope git_bcommits<CR>" },
	{ ["<C-s>"] = "<cmd>Telescope ultisnips<CR>" },

	-- PLUGIN: Formatter.nvim
	{ ["<Leader>ff"] = "<cmd>Format<CR>" },

	-- PLUGIN: Fugitive
	{ ["<Leader>gs"] = "<cmd>G<CR>" },
	{ ["<Leader>ga"] = "<cmd>Git add .<CR>" },
	{ ["<Leader>gh"] = "<cmd>diffget //2<CR>" },
	{ ["<Leader>gl"] = "<cmd>diffget //3<CR>" },

	-- PLUGIN: LSP
	{ ["K"] = "<cmd>lua vim.lsp.buf.hover()<CR>" },
	{ ["<Leader>K"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
	{ ["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>" },
	-- { ['<Leader>lr'] = '<cmd>lua vim.lsp.buf.references()<CR>' },  -- substituted by "Lspsaga lsp_finder"
	{ ["<Leader>j"] = "<cmd>lua vim.diagnostic.goto_next()<CR>" },
	{ ["<Leader>k"] = "<cmd>lua vim.diagnostic.goto_prev()<CR>" },
	{ ["<Leader>r"] = "<cmd>lua vim.lsp.buf.rename()<CR>" },

	-- outline using LspSaga
	{ ["<Leader>o"] = "<cmd>LSoutlineToggle<CR>" },

	-- untuk clear document highlight
	{ ["<Leader>lc"] = "<cmd>lua vim.lsp.buf.clear_references()<CR>" },

	-- I dont want to do this but oh well
	{ ["<C-LeftMouse>"] = "<cmd>lua vim.lsp.buf.definition()<CR>" },
	{ ["<M-LeftMouse>"] = "<C-o>" },
	{ ["<2-LeftMouse>"] = "<cmd>lua vim.lsp.buf.hover()<CR>" },

	-- PLUGIN: LSP saga
	{ ["<Leader>lp"] = "<cmd>Lspsaga peek_definition<CR>" },
	{ ["<Leader>la"] = "<cmd>Lspsaga code_action<CR>" },
	{ ["<Leader>lr"] = "<cmd>Lspsaga lsp_finder<CR>" },

	-- PLUGIN: ToggleTerm
	{ ["TT"] = "<cmd>ToggleTerm<CR>" },
	{ ["TG"] = ":ToggleTerm<CR>lazygit<CR>" },

	-- PLUGIN: Various golang related tools
	{ ["<Leader>Gt"] = ":GoAddTag<CR>" },
	{ ["<Leader>Gi"] = ":GoImport<CR>" },
	{ ["<Leader>Ga"] = ":GoImport<CR>" },
	{ ["<Leader>Gm"] = ":GoModTidy<CR>" },
	{ ["<Leader>GT"] = ":GoTestSum<CR>" },
	{ ["<Leader>GI"] = ":lua require('telescope').extensions.goimpl.goimpl<CR>" },

	-- PLUGIN: Flutter related tools
	{ ["<Leader>Fo"] = ":FlutterOutlineToggle<CR>" },

	-- PLUGIN: nvim dap (debugger)
	{ ["<Leader>dr"] = '<cmd>lua require("dap").run()<CR>' },
	{ ["<Leader>db"] = '<cmd>lua require("dap").toggle_breakpoint()<CR>' },
	{ ["<Leader>d<CR>"] = '<cmd>lua require("dap").continue()<CR>' },
	{ ["<Leader>dp"] = '<cmd>lua require("dap").pause()<CR>' },
	{ ["<Leader>dj"] = '<cmd>lua require("dap").step_over()<CR>' },
	{ ["<Leader>dJ"] = '<cmd>lua require("dap").step_into()<CR>' },
	{ ["<Leader>de"] = '<cmd>lua require("dapui").eval()<CR>' },
	{
		["<Leader>dq"] = '<cmd>lua require("dap").disconnect({ restart = false, terminateDebuggee = true }, function() require("dap").close() end)<CR>',
	},
}

---------------------------------------------
-- SET THE KEYMAPS
-- NORMAL MODE MAPPING
for _, mapping in pairs(NORMAL_MODE_MAPPING) do
	for lhs, rhs in pairs(mapping) do
		map("n", lhs, rhs, opts)
	end
end

-- VISUAL MODE MAPPING
for _, mapping in pairs(VISUAL_MODE_MAPPING) do
	for lhs, rhs in pairs(mapping) do
		map("v", lhs, rhs, opts)
	end
end

-- INSERT MODE MAPPING
for _, mapping in pairs(INSERT_MODE_MAPPING) do
	for lhs, rhs in pairs(mapping) do
		map("i", lhs, rhs, opts)
	end
end
