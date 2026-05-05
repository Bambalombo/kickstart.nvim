return {
  'akinsho/toggleterm.nvim',
  version = '*',
  -- opts = {},
  config = function()
    require('toggleterm').setup {
      function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      size = 55,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      direction = 'vertical',
    }
    vim.keymap.set('n', '<leader>ot', ':ToggleTerm<CR>', { desc = '[O]pen [T]erminal' })
  end,
}
