local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- PARSER FOR NEORG
-- parser_configs.norg_meta = {
--   install_info = {
--     url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
--     files = { 'src/parser.c' },
--     branch = 'main',
--   },
-- }

-- parser_configs.norg_table = {
--   install_info = {
--     url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
--     files = { 'src/parser.c' },
--     branch = 'main',
--   },
-- }

require('nvim-treesitter.configs').setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    'lua',
    'bash',
    'cpp',
    'c',
    'rust',
    'go',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'astro',
    'php',
    'python',
    'vim',
    'json',
    'query',
    'jsdoc',
    'latex',
    'comment',
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    enable = true,
    disable = {
      'help',
    },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled ().
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    disable = {
      'python',
      'javascript',
      'typescript',
      'html',
      'css',
      'javascriptreact',
      'typescriptreact',
      'go',
      'help',
    },
  },
}

require("dayum.ide.gg-treesitter")
