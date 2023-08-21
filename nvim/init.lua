-- make sure to set `mapleader` before lazy
-- so your mappings are correct
vim.g.mapleader = " "
require("plugins")
require("options")
require("keymaps")
vim.cmd[[colorscheme selenized]]
-- disable the startup splash screen
vim.opt.shortmess:append("I")
