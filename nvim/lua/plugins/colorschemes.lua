-- * disable lazy loading. want theme to be always loaded
-- * default priority is 50

return {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nightflyCursorColor = false
        vim.g.nightflyItalics = true
        vim.g.nightflyNormalFloat = false
        -- set global transparency
        vim.g.nightflyTransparent = true
        -- Apply the nightfly colorscheme
        vim.cmd("colorscheme nightfly")
    end,
    opts = {},
}

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

-- return {
--     "sainnhe/sonokai",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- vim.api.nvim_set_var('sonokai_style', 'default')    -- colorscheme 1
--         -- vim.api.nvim_set_var('sonokai_style', 'atlantis')   -- colorscheme 2
--         vim.api.nvim_set_var('sonokai_style', 'andromeda')  -- colorscheme 3
--         -- vim.api.nvim_set_var('sonokai_style', 'shusia')     -- colorscheme 4
--         -- vim.api.nvim_set_var('sonokai_style', 'maia')       -- colorscheme 5
--         -- vim.api.nvim_set_var('sonokai_style', 'espresso')   -- colorscheme 6
--         -- vim.api.nvim_set_var('sonokai_style', 'maia')       -- colorscheme 7
--         vim.cmd("colorscheme sonokai")                      -- set theme
--         vim.api.nvim_set_var('sonokai_better_performance', 1)   -- improve performance
--         vim.api.nvim_set_var('sonokai_enable_italic', 1) -- enable italic
--         vim.api.nvim_set_var('sonokai_transparent_background', 2) -- transparency
--     end,
--     opts = {},
-- }
