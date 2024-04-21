local opt = vim.opt -- as a shorthand

vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 -- disable netrw

-- disable the startup splash screen
opt.shortmess:append("I")

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- one status line for all windows
opt.laststatus = 3

-- vim options
opt.backup = false
opt.swapfile = false

-- turn off vi compatibility mode
opt.compatible = false

-- save file
opt.undofile = true
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- line numbers
-- opt.relativenumber = true
opt.relativenumber = false
opt.number = true

-- tabs & indentation
opt.showtabline = 1

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- set hidden
opt.hidden = true

-- scrolling + 8 in height
opt.scrolloff = 8
-- scrolling + 8 in weight
opt.sidescrolloff = 8

-- search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- disable text wrapping
opt.wrap = false

-- cursor line
opt.cursorline = true
-- opt.lazyredraw = true
-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- updatetime (too fast)
opt.updatetime = 100

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
