local opt = vim.opt

-- Vim options
opt.timeoutlen = 10 -- Which-key timeout in ms
opt.backup = false
opt.swapfile = false

-- Set highlight on search
vim.o.hlsearch = false

-- Highlighting groups 
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", {nocombine = true, fg="none"})
vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", {nocombine = false, underline=false, special="none"})
