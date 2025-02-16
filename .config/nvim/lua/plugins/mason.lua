return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                -- "tsserver",
                "bashls",
                -- "gopls",
                "dockerls",
                "docker_compose_language_service",
                "yamlls",
            },
            automatic_installation = true,
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "clang-format",
                "stylua",               -- lua formatter
                "gofumpt",              -- go better gofmt
                "goimports-reviser",    -- go better imports handler
                { "gotests", version = "develop" }, -- go tests codegen
                "golangci-lint",
            },
        })
    end,
}
