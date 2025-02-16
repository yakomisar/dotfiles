local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            local builtin = require("telescope.builtin")

            opts.desc = "Show references [LSP]"
            vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts) -- show definition, references

            opts.desc = "Go to declaration [LSP]"
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show definitions [LSP]"
            vim.keymap.set("n", "gd", builtin.lsp_definitions, opts) -- show lsp definitions

            opts.desc = "Show implementations [LSP] "
            vim.keymap.set("n", "gi", builtin.lsp_implementations, opts) -- show lsp implementations

            opts.desc = "Show type definitions [LSP]"
            vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            vim.keymap.set("n", "<leader>d", builtin.diagnostics, opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Prev diagnostic"
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Next diagnostic"
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Next error"
            vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), opts)

            opts.desc = "Prev error"
            vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), opts)

            opts.desc = "Next warning"
            vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), opts)

            opts.desc = "Prev warning"
            vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), opts)

            opts.desc = "Signature help"
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

            opts.desc = "Show documentation for what is under cursor"
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            opts.desc = "Show function/types usage/reference count"
            vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.display, opts) -- mapping to restart lsp if necessary

            opts.desc = "Clear function/types usage/reference count"
            vim.keymap.set("n", "<leader>cc", vim.lsp.codelens.clear, opts) -- mapping to restart lsp if necessary
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        -- local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }
        -- for type, icon in pairs(signs) do
        --   local hl = "DiagnosticSign" .. type
        --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        -- Diagnostic signs

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)"","●"
        local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Hover configuration
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            -- Specify border styling here, or reference a predefined style
            border = "rounded", -- Or use { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } for custom borders
        })

        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["bashls"].setup({
            cmd = { "bash-language-server", "start" },
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    directoryFilters = { "-.git", "-node_modules" },
                    analyses = {
                        unusedparams = true,
                        unusedvariable = true,
                        unusedwrite = true,
                        nilness = true,
                        useany = true,
                    },
                    codelenses = {
                        generate = true,
                        run_govulncheck = true,
                        tidy = true,
                        upgrade_dependency = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                    semanticTokens = true,
                },
            },
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
