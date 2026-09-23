return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    keys = {
        { "<leader>w", ":Neotree focus<CR>", silent = true, desc = "File Explorer"}
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_modified_markers = true,
            update_cwd = true,
            enable_diagnostics = true,
            sort_case_insensitive = true,
            default_component_configs = {
                container = {
                    enable_character_fade = true,
                },
                indent = {
                    with_marker = true,
                    with_expanders = true,
                    --indent_size = 2,
                },
                file_size = {
                    enabled = false,
                    --required_width = 64,
                },
            },
            window = {
                position = "left",
                width = 50,
            },
            filesystem = {
                use_libuv_file_watcher = true,
                filtered_items = {
                    visable = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "node_modules",
                    },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
                renderers = {
                    root = {
                        { "indent" },
                        { "icon", default = "C" },
                        { "name", zindex = 10 },
                    },
                    symbol = {
                        { "indent", with_expanders = true },
                        { "kind_icon", default = "?" },
                        { "container", content = {
                            { "name", zindex = 10 },
                            { "kind_name", zindex = 20, align = "right" },
                        }}
                    }
                },
            },
            buffers = {
                follow_current_file = {
                    enabled = true
                },
            },
            event_handlers = {},
        })
    end,
}
