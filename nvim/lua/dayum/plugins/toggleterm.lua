require('toggleterm').setup {
  size = 20,
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = '<number>',
  start_in_insert = true,
  insert_mappings = false,
  terminal_mappings = false,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,

  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    width = 125,
    height = 30,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
}
