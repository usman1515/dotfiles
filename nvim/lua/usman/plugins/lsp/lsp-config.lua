-- URL: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

return {
	"neovim/nvim-lspconfig",
	-- use LSP only when inside a buffer
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- integrate autocompletion with the LSP
		"hrsh7th/cmp-nvim-lsp",
		-- adds support for file operations using built-in LSP
		{ "antosha417/nvim-lsp-file-operations", config = true },
		-- setup for init.lua and plugin development
		"folke/neodev.nvim",
	},

    config = function()

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings
                -- Check `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- keymaps
                opts.desc = "Show LSP references"
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                vim.keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end,
        })

        -- NOTE : Moved all this to Mason including local variables
        -- used to enable autocompletion (assign to every lsp server config)
        -- local capabilities = cmp_nvim_lsp.default_capabilities()
        -- Change the Diagnostic symbols in the sign column (gutter)

        -- Define sign icons for each severity
        local signs = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰠠 ",
            [vim.diagnostic.severity.INFO]  = " ",
        }

        -- Set the diagnostic config with all icons
        vim.diagnostic.config({
            signs = {
                text = signs -- Enable signs in the gutter
            },
            virtual_text = true,        -- Specify Enable virtual text for diagnostics
            underline = true,           -- Specify Underline diagnostics
            update_in_insert = false,   -- Keep diagnostics active in insert mode
        })

        -- NOTE :
        -- Moved back from mason_lspconfig.setup_handlers from mason.lua file
        -- as mason setup_handlers is deprecated & its causing issues with lsp settings
        --
        -- Setup servers
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Config lsp servers here
        -- "lua_ls"
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
        -- TODO: "arduino_language_server",
        -- TODO: "autotools_ls",
        -- TODO: "bashls",
        -- TODO: "clangd",
        -- TODO: "cmake",
        -- TODO: "jsonls",
        -- "ltex",
        lspconfig.ltex.setup({
            capabilities = capabilities,
            settings = {
                ltex = {
                    language = "en-US",
                    filetypes = { "bib", "gitcommit", "markdown", "plaintex", "rst", "tex", "pandoc", "html", "xhtml", "mail", "text" },
                },
            },
        })
        -- pyright
        lspconfig.pyright.setup({
            capabilities = capabilities,
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true
                },
            },
        })
        -- "rust_analyzer",
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            diagnostics = {
                enable = false;
            }

        })
        -- "verible",
        lspconfig.verible.setup({
            capabilities = capabilities,
            filetypes = { "systemverilog", "verilog" },
        })
        -- "vhdl_ls",
        lspconfig.vhdl_ls.setup({
            capabilities = capabilities,
            cmd = { "vhdl_ls" },
            filetypes = { "vhd", "vhdl" },
        })
        -- "yamlls",
        lspconfig.yamlls.setup({
            -- other configuration for setup {}
            capabilities = capabilities,
            settings = {
                yaml = {
                    -- other settings. note this overrides the lspconfig defaults.
                    schemas = {
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                        ["/path/from/root/of/project"] = "/.github/workflows/*",
                    },
                },
            },
        })
    end,
}

