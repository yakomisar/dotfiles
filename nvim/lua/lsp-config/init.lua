-- local on_attach = function(_, bufnr)
-- 	local bufmap = function(keys, func)
-- 		vim.keymap.set("n", keys, func, { buffer = bufnr })
-- 	end
local on_attach = function(_, bufnr)
  local bufmap = function(keys, func)
    vim.api.nvim_buf_set_keymap(bufnr, "n", keys, func, { noremap = true, silent = true })
  end

  bufmap("<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
  bufmap("<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  bufmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  bufmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  bufmap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  bufmap("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bufmap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  bufmap("<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  bufmap("<leader>q", "<cmd>Telescope diagnostics bufnr=0<CR>")
  bufmap("[d", vim.diagnostic.goto_prev) -- jump to previous diagnostic in buffer
  bufmap("]d", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    "tsserver",
    "gopls",
    "lua_ls",
  },
})

local util = require("lspconfig/util")
require("mason-lspconfig").setup_handlers({

  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      single_file_support = true,
      flags = {
        debounce_text_changes = 150,
      },
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    })
  end,

  ["gopls"] = function()
    require("lspconfig").gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    })
  end,

  ["tsserver"] = function()
    require("lspconfig").tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  ["html"] = function()
    require("lspconfig").html.setup({
      filetypes = { "html", "css" },
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  -- another example
  -- ["omnisharp"] = function()
  --     require('lspconfig').omnisharp.setup {
  --         filetypes = { "cs", "vb" },
  --         root_dir = require('lspconfig').util.root_pattern("*.csproj", "*.sln"),
  --         on_attach = on_attach,
  --         capabilities = capabilities,
  --         enable_roslyn_analyzers = true,
  --         analyze_open_documents_only = true,
  --         enable_import_completion = true,
  --     }
  -- end,
})
