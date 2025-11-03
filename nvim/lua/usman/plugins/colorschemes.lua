-- INFO: disable lazy loading. want theme to be always loaded
-- default priority is 50

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- colorschemes for the different styles. use one only
--         vim.cmd("colorscheme tokyonight-storm") --dark
--         -- vim.cmd("colorscheme tokyonight-night") --dark
--         -- vim.cmd("colorscheme tokyonight-moon")  --dark
--         -- vim.cmd("colorscheme tokyonight-day")   --light
--     end,
--     opts = {},
-- }

return {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nightflyCursorColor = true
        vim.g.nightflyItalics = true
        vim.g.nightflyNormalFloat = false
        vim.g.nightflyTerminalColors = true
        vim.g.nightflyTransparent = false
        vim.g.nightflyUndercurls = true
        vim.g.nightflyVirtualTextColor = true
        vim.g.nightflyWinSeparator = 2
        vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳',
            vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋',
        }
        -- Apply the nightfly colorscheme
        vim.cmd("colorscheme nightfly")
    end,
    opts = {}
}

-- return {
--     "bluz71/vim-moonfly-colors",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.g.moonflyCursorColor = true
--         vim.g.moonflyItalics = true
--         vim.g.moonflyNormalFloat = false
--         vim.g.moonflyTerminalColors = true
--         vim.g.moonflyTransparent = false
--         vim.g.moonflyUndercurls = true
--         vim.g.moonflyVirtualTextColor = true
--         vim.g.moonflyWinSeparator = 2
--         vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳',
--             vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋',
--         }
--         -- Apply the moonfly colorscheme
--         vim.cmd("colorscheme moonfly")
--     end,
--     opts = {}
-- }

-- return {
--     "ellisonleao/gruvbox.nvim",
--     lazy = false,
--     priority = 1000 ,
--     config = function()
--         vim.g.terminal_colors = true   -- add neovim terminal colors
--         vim.g.undercurl = true
--         vim.g.underline = true
--         vim.g.bold = true
--         vim.g.italic = {
--             strings = true,
--             emphasis = true,
--             comments = true,
--             operators = false,
--             folds = true,
--         }
--         vim.g.strikethrough = true
--         vim.g.invert_selection = false
--         vim.g.invert_signs = false
--         vim.g.invert_tabline = false
--         vim.g.inverse = true        -- invert background for search, diffs, statuslines and errors
--         vim.g.contrast = ""         -- can be "hard", "soft" or empty string
--         vim.g.palette_overrides = {}
--         vim.g.overrides = {}
--         vim.g.dim_inactive = false
--         vim.g.transparent_mode = false
--         vim.cmd("colorscheme gruvbox")
--     end,
--     opts = {}
-- }
