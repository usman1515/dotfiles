return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "󰸞",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "lua_ls",
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
    end,
}



