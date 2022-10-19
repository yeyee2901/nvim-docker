local telescope_ok, _ = pcall(require, 'telescope')

if not telescope_ok then
  return
end

local preview_size = 50 -- in percent
local transparency = 0 -- in percent

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = ' (>ω<)  ',
    selection_caret = '-> ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        preview_width = 70,
        prompt_position = 'bottom',
        width = 0.8,
      },
      vertical = {
        height = preview_size,
        mirror = false,
      },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = { '.png', '.jpg', '.jpeg', '.snippets' },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = transparency,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,

    extensions = {
      project = {
        hidden_files = true,
      },
    },
  },
}

require('telescope').load_extension 'ultisnips'

-- check for flutter extension
local flutter_ok, _ = pcall(require, 'flutter')

require('telescope').load_extension 'flutter'
vim.keymap.set('n', '<leader>tF', require('telescope').extensions.flutter.commands)
