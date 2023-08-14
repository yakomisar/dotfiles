-- make sure to set `mapleader` before lazy
-- so your mappings are correct
vim.g.mapleader = " "
-- disable the startup splash screen
vim.opt.shortmess:append("I")

require("plugins")
require("treesitter")
require("options")
require("keymaps")
require("bufferline-config")
