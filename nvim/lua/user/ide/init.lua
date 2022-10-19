local lsp_ok, _ = pcall(require, "lspconfig")

-- DO NOT LOAD PLUGINS IF IT'S NOT INSTALLED
if not lsp_ok then
	return
end

require("user.ide.treesitter")
require("user.ide.lsp")
require("user.ide.cmp")
