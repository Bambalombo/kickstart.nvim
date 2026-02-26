return {
    'tpope/vim-fugitive',
    config = function()
      --
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'git status' })
      vim.keymap.set('n', '<leader>gf', ':Git fetch<CR>', { buffer = bufnr, desc = 'git fetch' })
      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = 'git [p]ush' })
      vim.keymap.set('n', '<leader>gP', ':Git pull<CR>', { desc = 'git [P]ull' })
      -- vim.keymap.set('n', '<leader>gP', vim.cmd.Git, { desc = 'git pull' })
    end,
  }

