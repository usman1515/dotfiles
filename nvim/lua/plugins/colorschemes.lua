-- disable lazy loading. want theme to be always loaded
-- default priority is 50

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- colorschemes for the different styles. use one only
--         -- vim.cmd("colorscheme tokyonight-storm") --dark
--         vim.cmd("colorscheme tokyonight-night") --dark
--         -- vim.cmd("colorscheme tokyonight-moon")  --dark
--         -- vim.cmd("colorscheme tokyonight-day")   --light
--     end,
--     opts = {},
-- }

-- return {
--     "EdenEast/nightfox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- vim.cmd("colorscheme dayfox")   -- light
--         -- vim.cmd("colorscheme dawnfox")  -- light
--         -- vim.cmd("colorscheme nightfox") -- dark
--         -- vim.cmd("colorscheme duskfox")  -- dark
--         -- vim.cmd("colorscheme nordfox")  -- dark
--         -- vim.cmd("colorscheme terafox")  -- dark
--         vim.cmd("colorscheme carbonfox")    -- dark
--     end,
--     opts = {},
-- }

return {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme nightfly")
    end,
    opts = {},
}