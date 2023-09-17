-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

-- local cmp = require('cmp')
-- local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

-- menu: Enable the popup menu. You can navigate through this menu with keyboard commands.
-- menuone: Similar to menu, but the popup menu shows even when there's only one match. Useful if you want to see the completion suggestion even when there's no ambiguity.
-- noselect: When this is set, the menu will appear to show you your options, but none will be selected. You'll need to manually select one if you want to insert it. This is useful if you don't want Vim to automatically select the first option.
-- preview: If a 'complete' option specifies that documentation should be found (info, k, etc.), this option says that the documentation should be shown in the preview window above the completion.
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        scrollbar = false,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "path" },                   -- file system paths
        { name = "nvim_lsp", keyword_length = 1 }, -- lsp
        { name = "luasnip",  keyword_length = 3 }, -- snippets
        { name = "buffer",   keyword_length = 2 }, -- text within current buffer
    },
    -- configure lspkind for vs-code like icons
    formatting = {
        format = lspkind.cmp_format({
            -- mode = "symbol", -- show only symbol annotations
            mode = "symbol_text",
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        }),
    },
})
