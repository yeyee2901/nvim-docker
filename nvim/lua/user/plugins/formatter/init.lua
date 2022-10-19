local formatter_ok, _ = pcall(require, "formatter")

if not formatter_ok then
	return
end

-- install prettier in your projects
local prettier = function()
	return {
		exe = "prettier",
		stdin = true,
		args = {
			"--plugin-search-dir=.",
			"--stdin-filepath",
			vim.api.nvim_buf_get_name(0),
		},
	}
end

-- npm i -g clang-format
local clang_format = function()
	return {
		exe = "clang-format",
		stdin = true,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

-- pip3 install autopep8
local autopep = function()
	return {
		exe = "autopep8",
		stdin = true,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

local stylua = function()
	return {
		exe = "stylua",
		stdin = false,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

local rustfmt = function()
	return {
		exe = "rustfmt",
		stdin = false,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

local gofmt = function()
	return {
		exe = "gofmt",
		stdin = true,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

local protobuf = function()
	return {
		exe = "clang-format",
		stdin = true,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

local dart = function()
	return {
		exe = "flutter format",
		stdin = false,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

require("formatter").setup({
	logging = true,
	filetype = {
		astro = { prettier },
		html = { prettier },
		css = { prettier },
		json = { prettier },
		markdown = { prettier },
		javascript = { prettier },
		javascriptreact = { prettier },
		typescript = { prettier },
		typescriptreact = { prettier },
		c = { clang_format },
		cpp = { clang_format },
		python = { autopep },
		rust = { rustfmt },
		go = { gofmt },
		lua = { stylua },
		proto = { protobuf },
		dart = { dart },
	},
})
