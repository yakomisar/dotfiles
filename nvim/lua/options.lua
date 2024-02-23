local opt = vim.opt -- as a shorthand

-- disable the startup splash screen
opt.shortmess:append("I")
-- make sure to set `mapleader` before lazy
vim.g.mapleader = " "
-- one status line for all windows
opt.laststatus = 3
-- vim options
opt.backup = false
opt.swapfile = false

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

-- disable scrolling
opt.scrolloff = 8

-- search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true
-- opt.lazyredraw = true
-- appearance
opt.termguicolors = true
opt.background = "dark"
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
