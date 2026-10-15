return {
    -- Настройка LSP
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason-lspconfig.nvim", "cmp-nvim-lsp" },
        config = function()
            -- Расширение capabilities для cmp (для всех серверов)
            vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities(), })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true}),
                callback = function(event)
                    local bufnr = event.buf
                    local opts = function(desc)
                        return { buffer = bufnr, desc = desc }
                    end

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Goto Definition"))
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("References"))
                    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts("Goto Implementation"))
                    vim.keymap.set("n", "gY", vim.lsp.buf.type_definition, opts("Goto Type Definition"))
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Goto Declaration"))
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
                    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts("Signature Help"))
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
                    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename"))
                    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts("Format"))
                end,
            })

            -- Inlay hints
            vim.lsp.inlay_hint.enable(true)

            -- Настройка серверов lua
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        hint = { enable = true },
                    },
                },
            })
            -- Включаем сервер lua
            vim.lsp.enable("lua_ls")

            -- Настройка серверов clang
            vim.lsp.config("clangd", {
                init_options = {
                    fallbackFlags = { "--std=c11" },
                },
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--pch-storage=memory",
                },
                root_markers = {
                    "compile_commands.json",
                    "compile_flags.txt",
                    ".git",
                    "Makefile",
                    "CMakeLists.txt",
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "h" },
            })
            vim.lsp.enable("clangd")

            local jdtls_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/package/eclipse.jdt.ls/jdtls")
            if jdtls_path ~= "" then
                vim.lsp.config("jdtls", {
                    cmd = {
                        "java",
                        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                        "-Dosgi.bundle.parent=app",
                        "-Dfile.encoding=UTF-8",
                        "-jar",
                        jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar",
                    },
                    root_dir = function(name)
                        local root = vim.lsp.util.find_git_on_file(fname) or vim.lsp.util.find_root({".mvn", ".gradle", "pom.xml", "build.gradle" })
                        return root or vim.fn.getcwd()
                    end,
                    settings = {
                        java = {
                            home = os.getenv("JAVA_HOME"),
                            format = {
                                enabled = true,
                            },
                            import = {
                                gradle = {
                                    enabled = true,
                                },
                                maven = {
                                    enabled = true,
                                },
                            },
                        },
                    },
                    filetypes = { "java" },
                })
                vim.lsp.enable("jdtls")
            end

        end,
    },

}
