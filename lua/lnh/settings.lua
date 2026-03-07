vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Settings ]]
vim.o.breakindent = true
vim.o.confirm = true -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.list = true
vim.o.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 15
vim.o.showmode = false -- Don't show the mode, since it's already in the status line
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 300

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250
vim.opt.diffopt:remove 'linematch:40' -- Fix `diffget` not replacing enture conflict, source; https://github.com/tpope/vim-fugitive/issues/2444
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
