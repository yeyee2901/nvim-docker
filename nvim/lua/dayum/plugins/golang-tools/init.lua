-- go.nvim humongous life quality improvement plugin for golang development 😎
require('go').setup {
  goimport = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls', -- if set to gopls will use golsp format
  max_line_len = 90,
  tag_transform = "camelcase",
  test_dir = '',
  test_runner = 'gotestsum',
  comment_placeholder = '   ',
  lsp_cfg = false, -- false: use your own lspconfig
  lsp_on_attach = false, -- use on_attach from go.nvim
  lsp_codelens = false,
  dap_debug = false,
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_inlay_hints = {
    enable = false
  }
}

-- GoImpl (implement a struct methods based on interface stubs)
require('telescope').load_extension 'goimpl'
