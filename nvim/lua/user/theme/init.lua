-- DO NOT LOAD PLUGINS IF EVEN ONE IS NOT INSTALLED (for docker)
local ok, _ = pcall(require, "telescope")

if not ok then
	return
end

require("user.theme.color")
require("user.theme.lualine")
