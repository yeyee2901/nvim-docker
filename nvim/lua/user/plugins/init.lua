require("user.plugins.packer")

-- DO NOT LOAD PLUGINS IF EVEN ONE IS NOT INSTALLED (for docker)
local ok, _ = pcall(require, "telescope")

if not ok then
	return
end

require("user.plugins.telescope")
require("user.plugins.golang-tools")
require("user.plugins.todo-comments")
require("user.plugins.colortils")
require("user.plugins.gitsigns")
require("user.plugins.formatter")
require("user.plugins.bufferline")
require("user.plugins.nvim-tree")
require("user.plugins.dap")
require("user.plugins.dashboard")
