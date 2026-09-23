return {
--    {
--        "Mofiqul/dracula.nvim",
--        lazy = false,
--        priority = 1000,
--        config = function()
--            require("dracula").setup({
--                transparent_bg = true,
--                show_end_of_buffer = true,
--                italic_comment = true,
--            })
--            vim.cmd.colorscheme("dracula")
--        end,
--    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-nvim")
        end,
    },
}
