-- so your mappings are correct
-- disable the startup splash screen
vim.opt.shortmess:append("I")
-- make sure to set `mapleader` before lazy
vim.g.mapleader = " "
require("options")
require("keymaps")
require("plugins")
