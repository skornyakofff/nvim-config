return {
     -- Мост Mason <-> lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        opts = {
            ensure_installed = { "lua_ls", "clangd" },
        },
    },
}
