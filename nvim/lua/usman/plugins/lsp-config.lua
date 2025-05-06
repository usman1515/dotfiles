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
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = false }

				-- set keybinds
				-- they are only available when an LSP client attaches to a buffer.
				-- -- they will only be available wihtin that buffer.
				-- opts.desc = "Show LSP references"
				-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				--
				-- opts.desc = "Go to declaration"
				-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				--
				-- opts.desc = "Show LSP definitions"
				-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				--
				-- opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				--
				-- opts.desc = "Show LSP type definitions"
				-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				--
				-- opts.desc = "See available code actions"
				-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				--
				-- opts.desc = "Smart rename"
				-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
				--
				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				--
				-- opts.desc = "Show line diagnostics"
				-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
				--
				-- opts.desc = "Go to previous diagnostic"
				-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				--
				-- opts.desc = "Go to next diagnostic"
				-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
				--
				-- opts.desc = "Show documentation for what is under cursor"
				-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
				--
				-- opts.desc = "Restart LSP"
				-- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- change the diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- special way to configure LSPs in a particular way
		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
                    -- enable autocompletion with nvim-cmp
					capabilities = capabilities,
				})
			end,
            -- "lua_ls",
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
            -- TODO: "arduino_language_server",
            -- TODO: "autotools_ls",
            -- TODO: "bashls",
            -- TODO: "clangd",
            -- TODO: "cmake",
            -- TODO: "jsonls",
            -- TODO: "ltex",
            -- "lua_ls",
            -- "pyright",
            ["pyright"] = function ()
                -- configure pyright language server
                lspconfig["pyright"].setup({
                    capabilities = capabilities,
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true
                        },
                    },
                })
            end,
            -- TODO: "rust_analyzer",
            -- "verible",
            ["verible"] = function()
                -- configure verible language server
                lspconfig["verible"].setup({
                    capabilities = capabilities,
                    filetypes = { "systemverilog", "verilog" },
                })
            end,
            -- "vhdl_ls",
            ["vhdl_ls"] = function ()
                -- configure vhdl_ls language server
                lspconfig["vhdl_ls"].setup({
                    capabilities = capabilities,
                    cmd = { "vhdl_ls" },
                    filetypes = { "vhd", "vhdl" },
                })
            end,
            -- "yamlls",
            ["yamlls"] = function ()
                -- configure yamlls language server
                lspconfig["yamlls"].setup({
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
        })
    end,
}


