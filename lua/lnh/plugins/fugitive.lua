return {
  'tpope/vim-fugitive',
  config = function()
    --
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'git status' })
    local group = vim.api.nvim_create_augroup('fugitive_maps', { clear = true })
    local autocmd = vim.api.nvim_create_autocmd

    autocmd('BufWinEnter', {
      group = group,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set('n', '<leader>p', function()
          vim.cmd.Git 'push'
        end, opts)

        -- rebase always
        vim.keymap.set('n', '<leader>P', function()
          vim.cmd.Git { 'pull', '--rebase' }
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set('n', '<leader>t', ':Git push -u origin ', opts)
      end,
    })

    vim.keymap.set('n', '<leader>gu', '<cmd>diffget //2<CR>')
    vim.keymap.set('v', '<leader>gu', '<cmd>diffget //2<CR>')
    vim.keymap.set('n', '<leader>gh', '<cmd>diffget //3<CR>')
    vim.keymap.set('v', '<leader>gh', '<cmd>diffget //3<CR>')

    vim.keymap.set('n', '<leader>gf', ':Git fetch<CR>', { buffer = bufnr, desc = 'git fetch' })
    vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = 'git [p]ush' })
    vim.keymap.set('n', '<leader>gP', ':Git pull<CR>', { desc = 'git [P]ull' })
    vim.keymap.set('n', '<leader>gb', ':Git branch<CR>', { desc = 'git [B]ranch' })
    -- vim.keymap.set('n', '<leader>gP', vim.cmd.Git, { desc = 'git pull' })

    function _G.cd_dir()
      local ok, oil = pcall(require, 'oil')
      if not ok then
        print 'oil.nvim not loaded'
        return
      end

      local dir = oil.get_current_dir()
      if dir then
        vim.cmd('cd ' .. vim.fn.fnameescape(dir))
        print('Changed directory to ' .. dir)
      else
        print 'Not in an oil buffer'
      end
    end
    vim.keymap.set('n', '<leader>cd', cd_dir, { desc = 'cd to oil dir' })
  end,
}
