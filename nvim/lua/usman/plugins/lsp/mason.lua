return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
        -- "saghen/blink.cmp",
    },
    config = function()
        -- import mason and mason_lspconfig
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- NOTE: Moved these local imports below back to lspconfig.lua due to mason depracated handlers

        -- local lspconfig = require("lspconfig")
        -- local cmp_nvim_lsp = require("cmp_nvim_lsp")             -- import cmp-nvim-lsp plugin
        -- local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "➜",
                    package_uninstalled = "",
                },
            },
        })

        -- LSP servers for mason to install
        mason_lspconfig.setup({
            automatic_enable = false,
            ensure_installed = {
                "arduino_language_server",
                "autotools_ls",
                "bashls",
                "clangd",
                "cmake",
                "jsonls",
                "ltex",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "verible",
                "vhdl_ls",
                "yamlls",
            },
        })

        -- Linters and Formatters for mason to install
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "pylint",
                "clangd",
                "denols",
                -- { 'eslint_d', version = '13.1.2' },
            },

            --     -- NOTE: mason BREAKING Change! Removed setup_handlers
            --     -- moved lsp configuration settings back into lspconfig.lua file
        })
    end,
}
