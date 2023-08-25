vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- underline = true,
  -- update_in_insert = true,
  underline = false,
  update_in_insert = false,
  virtual_text = {
    spacing = 2,
    severity_limit = "Warning",
  },
})

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "go",
    "vimdoc",
    "query",
    "html",
    "javascript",
    "go",
    "gomod",
    "gowork",
    "gosum",
    "sql",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
})
