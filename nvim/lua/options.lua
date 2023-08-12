local opt = vim.opt -- as a shorthand

-- vim options
opt.backup = false
opt.swapfile = false

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- disable scrolling
opt.scrolloff = 8

-- search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

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
