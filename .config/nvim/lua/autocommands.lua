-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local komisar_group = augroup("komisar", {})
local statusline_group = augroup("StatusLine", {})

--  Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	pattern = "*",
	group = augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			timeout = 60,
		})
	end,
})

--- remove all trailing whitespace on save
autocmd("BufWritePre", {
	group = komisar_group,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

-- don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt.fo:remove("c")
		vim.opt.fo:remove("r")
		vim.opt.fo:remove("o")
	end,
})
