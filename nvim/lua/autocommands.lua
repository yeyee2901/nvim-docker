local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- HIGHLIGHT ON YANK -----------------------------------------
-- provides better experience on knowing which one is copied
local yank_group = augroup("_UserYankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({
			timeout = 300,
			on_visual = false,
		})
	end,
})
