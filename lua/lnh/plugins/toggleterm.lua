return {
  'akinsho/toggleterm.nvim',
  version = '*',
  -- opts = {},
  config = function()
    require('toggleterm').setup {
      size = 55,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      direction = 'float',
    }
    -- vim.keymap.set('n', ')
  end,
}
