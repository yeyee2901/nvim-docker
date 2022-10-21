-- SECTION: Ultisnips Snippet engine
-- Calling ExpandTrigger,
-- will make nvim-cmp completion behave
-- like a UltiSnips placeholder.
-- now nvim-cmp depends on snippet engine
local options = {
	UltiSnipsExpandTrigger = "<M-CR>",
	UltiSnipsJumpForwardTrigger = "<M-CR>",
	UltiSnipsJumpBackwardTrigger = "<M-BS>",
	UltiSnipsListSnippets = "<C-?>",
	UltiSnipsEditSplit = "vertical",
}

for opt, val in pairs(options) do
	vim.g[opt] = val
end

-- SECTION: Nvim-Cmp Autocomplete engine
local cmp = require("cmp")

vim.o.completeopt = "menuone,noselect"

cmp.setup({
	completion = {
		completeopt = vim.o.completeopt,
	},

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-q>"] = cmp.mapping.close(),
		["<C-c>"] = cmp.mapping.complete(), -- open completion menu
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	-- how the completion items are dis
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- short format
			-- vim_item.kind = require('lspkind').presets.default[vim_item.kind] or ''

			-- long format
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")"
			return vim_item
		end,
	},

	sources = {
		-- { name = 'buffer' },
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},

	-- INSTALL:
	-- quangnguyen30192/cmp-nvim-ultisnips
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
})
