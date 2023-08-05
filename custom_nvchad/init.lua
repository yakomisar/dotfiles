local opt = vim.opt

-- Vim options
opt.timeoutlen = 150 -- Which-key timeout in ms
opt.backup = false
opt.swapfile = false

-- Enable auto indetation to keep my code neatly formatted
opt.autoindent = true

-- Set highlight on search
vim.o.hlsearch = false

-- Enable relative line numbers
opt.relativenumber = true

-- Disable macro recording
vim.api.nvim_set_keymap('n', 'q', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('v', 'q', '<Nop>', {noremap = true})

-- Highlighting groups 
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", {nocombine = true, fg="none"})
vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", {nocombine = false, underline=false, special="none"})

-- Disable arrow buttons on the keyboard
vim.api.nvim_set_keymap('n', '<Left>', ':echoerr "Use h"<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Right>', ':echoerr "Use l"<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Up>', ':echoerr "Use k"<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<Down>', ':echoerr "Use j"<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('i', '<Left>', ':echoerr "Use h"<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('i', '<Right>', ':echoerr "Use l"<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('i', '<Up>', ':echoerr "Use k"<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('i', '<Down>', ':echoerr "Use j"<CR>', {noremap = true, silent = false})
