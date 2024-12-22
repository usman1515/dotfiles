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
                package_installed = "",
                package_pending = "➜",
                package_uninstalled = "",
            },
        },
    })

    -- list of LSP servers for mason to install
    mason_lspconfig.setup({
        ensure_installed = {
            "arduino_language_server",
            "autotools_ls",
            "bashls",
            "clangd",
            "grammarly",
            "lua_ls",
            "ltex",
            "verible",
        },
    })
    end,

    -- list of formatter and linter for mason to install
}
