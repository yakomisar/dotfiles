-- make sure to set `mapleader` before lazy
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("autocommands")
require("statusline")
require("lsp")
require("lazy").setup("plugins", {
	change_detection = { notify = false },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			reset = true,
			disabled_plugins = {
				"2html_plugin",
				"fzf",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logiPat",
				"matchit",
				"matchparen",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"rrhelper",
				"shada",
				"spellfile",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
})
