-- INFO: disable lazy loading. want theme to be always loaded
-- default priority is 50

return {
    {
        "oxfist/night-owl.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("night-owl").setup({
                -- These are the default settings
                bold = true,
                italics = true,
                underline = true,
                undercurl = true,
                transparent_background = false,
            })
            vim.cmd("colorscheme night-owl")
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            -- vim.cmd("colorscheme vscode")
        end,
        opts = {},
    },
    {
        "bluz71/vim-nightfly-colors",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nightflyCursorColor = true
            vim.g.nightflyItalics = true
            vim.g.nightflyNormalFloat = false
            -- set global transparency
            vim.g.nightflyTransparent = false
            -- Apply the nightfly colorscheme
            -- vim.cmd("colorscheme nightfly")
        end,
        opts = {},
    },
    {
        "bluz71/vim-moonfly-colors",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.moonflyCursorColor = true
            vim.g.moonflyItalics = true
            vim.g.moonflyNormalFloat = false
            -- set global transparency
            vim.g.moonflyTransparent = false
            -- Apply the moonfly colorscheme
            -- vim.cmd("colorscheme moonfly")
        end,
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- colorschemes for the different styles. use one only
            -- vim.cmd("colorscheme tokyonight-storm") --dark
            -- vim.cmd("colorscheme tokyonight-night") --dark
            -- vim.cmd("colorscheme tokyonight-moon")  --dark
            -- vim.cmd("colorscheme tokyonight-day")   --light
        end,
        opts = {},
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme dayfox")   -- light
            -- vim.cmd("colorscheme dawnfox")  -- light
            -- vim.cmd("colorscheme nightfox") -- dark
            -- vim.cmd("colorscheme duskfox")  -- dark
            -- vim.cmd("colorscheme nordfox")  -- dark
            -- vim.cmd("colorscheme terafox")  -- dark
            -- vim.cmd("colorscheme carbonfox")    -- dark
        end,
        opts = {},
    },

}

