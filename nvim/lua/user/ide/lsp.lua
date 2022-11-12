-- SECTION: GLOBAL VARS
MY_HOME = os.getenv("HOME")

-- SECTION: SERVER SETTINGS
vim.fn.sign_define(
	"DiagnosticSignError",
	{ text = "✗", texthl = "DiagnosticSignError", linehl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
)

vim.fn.sign_define("DiagnosticSignWarn", { text = "⁉", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" })

vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" })

vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

vim.diagnostic.config({
	signs = true,
	virtual_text = false,
	update_in_insert = true,
	float = {
		border = "double",
	},
})

-- SECTION: SERVER SETUP
local lspconfig = require("lspconfig")

-- LSP Saga is backkkkk
local saga = require("lspsaga")
saga.init_lsp_saga({
	border_style = "rounded",

	-- 100 = fully transparent
	saga_winblend = 0,

	code_action_lightbulb = {
		enable = false,
		enable_in_insert = false,
		cache_code_action = true,
		sign = true,
		update_time = 300,
		sign_priority = 20,
		virtual_text = true,
	},

	finder_action_keys = {
		open = "o",
		vsplit = "v",
		split = "s",
		tabe = "t",
		quit = "q",
	},

	show_outline = {
		win_position = "right",
		win_with = "",
		win_width = 40,
		auto_enter = true,
		auto_preview = true,
		virt_text = "┃",
		jump_key = "o",
		-- auto refresh when change buffer
		auto_refresh = true,
	},
	symbol_in_winbar = {
		enable = true,
		in_custom = false, -- use custom handler
		click_support = false, -- apa itu mouse
		separator = " ",

		-- define how to customize filename, eg: %:., %
		-- if not set, use default value `%:t`
		-- more information see `vim.fn.expand` or `expand`
		-- ## only valid after set `show_file = true`
		show_file = true,
		file_formatter = "%:t",
	},
})

-- update LSP capabilities to include nvim-cmp (completion)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities_updated = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities_updated.snippetSupport = true

local custom_on_attach = function(_, _)
	-- Better function signature hinting
	require("lsp_signature").on_attach({
		bind = true, -- Mandatory for config
		doc_lines = 5,
		fix_pos = false,
		hint_enable = true,
		hint_prefix = "🔍 ",
		hint_scheme = "String",
		hi_parameter = "Search",
		max_height = 12,
		max_width = 120,
		handler_opts = {
			border = "double", -- single/double/shadow
		},

		floating_window = true,
		use_lspsaga = true,
	})
end

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup({
	cmd = { MY_HOME .. "/go/bin/gopls" },
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
    settings = {
        gopls = {
            buildFlags = {
                -- I have noticed issues when developing
                -- using root user in docker, even though it's already
                -- marked as save.directory from git config, gopls keeps yelling
                -- if the go-module name includes a version control information
                -- e.g: github.com/yeyee2901/my-module
                -- produces error:
                --      'error obtaining VCS status: exit status 128'
                -- apparently this is only present in go > 1.17
                -- The building process runs fine though, so we just need to tell
                -- gopls to ignore this diagnostic
                "-buildvcs=false",
            }
        }
    }
})

-- rustup component add rust-analyzer
local rust_tools = require("user.plugins.rust-tools")
rust_tools.init(
    rust_tools.init_opts(capabilities_updated, custom_on_attach)
)

-- lspconfig.rust_analyzer.setup({
--     cmd = { "rustup", "run", "stable", "rust-analyzer" },
-- 	capabilities = capabilities_updated,
-- 	on_attach = custom_on_attach,
-- })

-- apt install
lspconfig.ccls.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
	init_options = {
		diagnostics = {
			onOpen = 0,
			onChange = 1,
			onSave = 0,
		},
		index = {
			comments = 1, -- index only doxygen comment markers
			onChange = true, -- force index file to be not on every save
		},
		cache = {
			directory = "", -- have to disable caching, data race are common occurences
		},
	},
})

-- npm i -g pyright
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = custom_on_attach,
})

-- npm i -g intelephense
lspconfig.intelephense.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
})

-- npm i -g typescript typescript-language-server
-- npm i -g vscode-langservers-extracted
lspconfig.tsserver.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
})

-- npm i -g @astrojs/language-server
lspconfig.astro.setup({
	capabilities = capabilities_updated,
	on_attach = custom_on_attach,
})

-- npm i -g eslint
lspconfig.eslint.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"astro",
	},
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		packageManager = "npm",
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "auto",
		},
	},
})
