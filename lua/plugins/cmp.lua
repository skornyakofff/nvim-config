return {
    -- Autocompletion - nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp", priority = 1000 },
                    { name = "luasnip", priority = 750 },
                    { name = "path", priority = 250 },
                    { name = "buffer", priority = 100 },
                }),
                window = {
                    documentation = cmp.config.window.bordered(),
                },
            })
        end,
    },
}
