-- disable lazy loading. want theme to be always loaded
-- default priority is 50

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- colorschemes for the different styles. use one only
        vim.cmd("colorscheme tokyonight-storm") --dark
        -- vim.cmd("colorscheme tokyonight-night") --dark
        -- vim.cmd("colorscheme tokyonight-moon")  --dark
        -- vim.cmd("colorscheme tokyonight-day")   --light
    end,
    opts = {},
}
