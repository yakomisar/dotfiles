-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local komisar_group = augroup("komisar", {})
-- local statusline_group = augroup("StatusLine", {})

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

-- 2 spaces for selected filetypes
autocmd("FileType", {
	pattern = "xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

-- go: format and organize imports on save
-- autocmd("BufWritePre", {
-- 	pattern = { "*.go" },
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params()
-- 		params.context = { only = { "source.organizeImports" } }
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
-- 		for cid, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
-- 					vim.lsp.util.apply_workspace_edit(r.edit, enc)
-- 				end
-- 			end
-- 		end
-- 		vim.lsp.buf.format({ async = false })
-- 	end,
-- })

-- -- custom statusline
-- autocmd({ "WinEnter", "BufEnter" }, {
-- 	group = statusline_group,
-- 	pattern = "*",
-- 	command = [[setlocal statusline=%!v:lua.require('statusline').setup()]],
-- })
