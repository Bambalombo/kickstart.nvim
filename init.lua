require 'lnh'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Fix `diffget` not replacing enture conflict, source; https://github.com/tpope/vim-fugitive/issues/2444
vim.opt.diffopt:remove 'linematch:40'

-- [[ Setting options ]]
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!

vim.o.showmode = false -- Don't show the mode, since it's already in the status line

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.o.undofile = true -- Save undo history

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 15

vim.o.confirm = true -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- normal autocommands events (`:help autocmd-events`).

-- Highlight when yanking (copying) text - See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  -- Essential kickstart plugins --
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  require 'lnh.plugins.gitsigns',
  require 'lnh.plugins.which-key',
  require 'lnh.plugins.telescope',
  --
  -- -- LSP Plugins
  require 'lnh.plugins.lazydev',
  require 'lnh.plugins.nvim-lspconfig',
  --
  -- -- Other kickstart plugins --
  require 'lnh.plugins.conform', -- Autoformat
  require 'lnh.plugins.blink', -- Autocompletion
  require 'lnh.plugins.tokyonight', -- looks
  require 'lnh.plugins.todo-comments', -- Highlight todo, notes, etc in comments
  require 'lnh.plugins.mini', -- Collection of various small independent plugins/modules
  require 'lnh.plugins.treesitter', -- Highlight, edit, and navigate code

  -- Additional optional kickstart plugins --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- LNH plugins --
  require 'lnh.plugins.harpoon',
  require 'lnh.plugins.undotree',
  require 'lnh.plugins.fugitive',
  require 'lnh.plugins.oil',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugi:ns to `lua/custom/plugins/*.lua` to get going.
  -- TODO: Find out what is the difference between this line 'import' below and using 'require' as above
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
