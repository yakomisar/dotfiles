vim.lsp.enable({
	"lua_ls",
	"clangd",
	"gopls",
	"bufls",
})

-- vim.o.winborder = "rounded"
vim.diagnostic.config({ virtual_text = true })
-- vim.diagnostic.config({
--     virtual_text = { current_line = true }
-- })
-- vim.diagnostic.config({
--     -- Use the default configuration
--     -- virtual_lines = true
--
--     -- Alternatively, customize specific options
--     virtual_lines = {
--         -- Only show virtual line diagnostics for the current cursor line
--         current_line = true,
--     },
-- })

-- У меня есть blink поэтому это не надо
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method("textDocument/completion") then
-- 			-- Create a keymap for vim.lsp.buf.implementation ...
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })
