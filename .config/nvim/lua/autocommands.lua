-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set -- as a shorthand

local komisar_group = augroup("komisar", {})

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

-- Clear register 'a' on VimLeave
autocmd("VimLeave", {
    group = komisar_group,
    pattern = "*",
    command = "let @a = ''",
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

autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.bo.commentstring = "-- %s"
    end,
})

autocmd("LspAttach", {
    group = augroup("UserLspAttach", { clear = false }),
    callback = function(ev)
        map("n", "gd", vim.lsp.buf.definition, { desc = "Go to declaration [LSP]", buffer = ev.buf })
        map("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, { desc = "Hover documentation [LSP]", buffer = ev.buf })

        map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration [LSP]", buffer = ev.buf })
        map("n", "gt", vim.lsp.buf.type_definition, { desc = "Show type definitions [LSP]", buffer = ev.buf })
        map(
            { "n", "v" },
            "<leader>ca",
            vim.lsp.buf.code_action,
            { desc = "See available code actions", buffer = ev.buf }
        )

        map("n", "<leader>D", vim.diagnostic.open_float, { desc = "Show line diagnostics", buffer = ev.buf })
        map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = ev.buf })
        map(
            "n",
            "<leader>cl",
            vim.lsp.codelens.display,
            { desc = "Show function/types usage/reference count", buffer = ev.buf }
        )
        map(
            "n",
            "<leader>cc",
            vim.lsp.codelens.clear,
            { desc = "Clear function/types usage/reference count", buffer = ev.buf }
        )
    end,
})
