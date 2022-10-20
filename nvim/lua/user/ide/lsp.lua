-- SECTION: GLOBAL VARS
MY_HOME = os.getenv 'HOME'

-- SECTION: SERVER SETTINGS
vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '✗', texthl = 'DiagnosticSignError', linehl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' }
)

vim.fn.sign_define('DiagnosticSignWarn', { text = '⁉', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' })

vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' })

vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' })

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

vim.diagnostic.config {
  signs = true,
  virtual_text = false,
  update_in_insert = true,
  float = {
    border = 'double',
  },
}

-- SECTION: SERVER SETUP
local lspconfig = require 'lspconfig'

-- LSP Saga is backkkkk
local saga = require 'lspsaga'
saga.init_lsp_saga {
  border_style = 'rounded',

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
    open = 'o',
    vsplit = 'v',
    split = 's',
    tabe = 't',
    quit = 'q',
  },

  show_outline = {
    win_position = 'right',
    win_with = '',
    win_width = 40,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  symbol_in_winbar = {
    enable = true,
    in_custom = false, -- use custom handler
    click_support = false, -- apa itu mouse
    separator = ' ',

    -- define how to customize filename, eg: %:., %
    -- if not set, use default value `%:t`
    -- more information see `vim.fn.expand` or `expand`
    -- ## only valid after set `show_file = true`
    show_file = true,
    file_formatter = '%:t',
  },
}

-- update LSP capabilities to include nvim-cmp (completion)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities_updated = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities_updated.snippetSupport = true

local custom_on_attach = function(_, _)
  -- Better function signature hinting
  require('lsp_signature').on_attach {
    bind = true, -- Mandatory for config
    doc_lines = 5,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = '🔍 ',
    hint_scheme = 'String',

    hi_parameter = 'Search',
    max_height = 12,
    max_width = 120,
    handler_opts = {
      border = 'double', -- single/double/shadow
    },

    -- The signature floating_window is reaaaallyy big, and i have to
    -- disable it so I can read the completion pop up menu
    floating_window = true,

    use_lspsaga = true,
  }
end

lspconfig.gopls.setup {
  cmd = { MY_HOME .. '/go/bin/gopls' },
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
}

lspconfig.ccls.setup {
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
      directory = '', -- have to disable caching, supaya tidak ada data race
    },
  },
}

-- lspconfig.pyright.setup {
--   capabilities = capabilities,
--   on_attach = custom_on_attach,
-- }

-- ALTERNATIVE: (masih coba-coba)
lspconfig.jedi_language_server.setup {
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
}

-- npm i -g vscode-langservers-extracted
-- lspconfig.html.setup {
--   capabilities = capabilities,
--   on_attach = custom_on_attach,
-- }

-- npm i -g intelephense
lspconfig.intelephense.setup {
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
}

-- npm i -g typescript typescript-language-server
lspconfig.tsserver.setup {
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
}

-- npm i -g @astrojs/language-server
lspconfig.astro.setup {
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
}

-- npm i -g eslint
lspconfig.eslint.setup {
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'astro',
  },
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = 'separateLine',
      },
      showDocumentation = {
        enable = true,
      },
    },
    codeActionOnSave = {
      enable = false,
      mode = 'all',
    },
    format = true,
    nodePath = '',
    onIgnoredFiles = 'off',
    packageManager = 'npm',
    quiet = false,
    rulesCustomizations = {},
    run = 'onType',
    useESLintClass = false,
    validate = 'on',
    workingDirectory = {
      mode = 'auto',
    },
  },
}

-- npm i -g bashls
lspconfig.bashls.setup {
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
  filetypes = { 'bash', 'zsh', 'sh' },
}

-- npm i -g vim-language-server
lspconfig.vimls.setup {
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
}

-- npm i -g docker-file-language-server-nodejs
lspconfig.dockerls.setup {
  capabilities = capabilities_updated,
  on_attach = custom_on_attach,
}

-- FLUTTER --
require('flutter-tools').setup {
  ui = {
    border = 'rounded',
    notification_style = 'native',
  },

  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
  },

  widget_guides = {
    enabled = true,
  },

  closing_tags = {
    highlight = 'Comment', -- highlight for the closing tag
    prefix = '>>', -- character to use for close tag e.g. > Widget
    enabled = true, -- set to false to disable
  },

  dev_log = {
    enabled = true,
    open_cmd = 'tabedit', -- command to use to open the log buffer
  },

  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },

  outline = {
    open_cmd = '30vnew', -- command to use to open the outline buffer
    auto_open = false, -- if true this will open the outline automatically when it is first populated
  },

  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = '■', -- the virtual text character to highlight
    },

    on_attach = custom_on_attach,
    capabilities = capabilities_updated,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {},
      renameFilesWithClasses = 'prompt', -- "always"
      enableSnippets = true,
    },
  },
}

-- SUMNEKO LUA
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities_updated,

  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim', 'use' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
