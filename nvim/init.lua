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
require("lazy").setup("plugins", {
	defaults = {
		lazy = true,
		version = false,
	},
	checker = {
		enabled = false,
	},
	change_detection = {
		enabled = false,
		notify = false,
	},

	ui = {
		wrap = true,
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = "",
			import = "",
			keys = "",
			lazy = "  ",
			loaded = "",
			not_loaded = "",
			plugin = " ",
			runtime = "",
			source = " ",
			start = "",
			task = "",
			list = {
				"",
				"",
				"",
				"‒",
			},
		},
	},
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
