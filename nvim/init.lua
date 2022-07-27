-- mouse in all modes
vim.opt.mouse = 'a'

vim.opt.splitright = true

-- indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- line numbers
vim.opt.relativenumber = true
vim.opt.nu = true

-- searching
vim.opt.incsearch = true
vim.opt.termguicolors = true

-- scroll
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'


-- persistant undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim/undo'

require 'plugins'
require 'mappings'
require 'lsp'
require 'init_dashboard'
