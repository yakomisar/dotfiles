local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local format = null_ls.builtins.formatting

local opts = {
  sources = {
    -- Golang formatting
    format.gofumpt,
    format.goimports_reviser,
    format.golines,
    -- Web formatting (jsx,html, ts and many others...)
    format.prettierd.with({
                filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html", "json", "yaml", "markdown", "graphql"},
            }),
    format.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts
