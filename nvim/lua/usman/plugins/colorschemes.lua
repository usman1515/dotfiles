-- To switch colorscheme: uncomment the one you want and comment out the active one.
-- Then restart Neovim.

-- INFO: colorscheme: vim-nightfly-colors
vim.pack.add({ "https://github.com/bluz71/vim-nightfly-colors" })
local ok = pcall(function()
    vim.g.nightflyCursorColor = true
    vim.g.nightflyItalics = true
    vim.g.nightflyNormalFloat = false
    vim.g.nightflyTerminalColors = true
    vim.g.nightflyTransparent = false
    vim.g.nightflyUndercurls = true
    vim.g.nightflyVirtualTextColor = true
    vim.g.nightflyWinSeparator = 2
    vim.opt.fillchars = {
        horiz = '━', horizup = '┻', horizdown = '┳',
        vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋',
    }
    vim.cmd("colorscheme nightfly")
end)
if not ok then
    vim.notify("nightfly not ready yet — restart Neovim after install", vim.log.levels.WARN)
end

-- INFO: colorscheme: tokyonight
-- vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
-- local ok = pcall(function()
--     vim.cmd("colorscheme tokyonight-storm")
--     -- vim.cmd("colorscheme tokyonight-night")
--     -- vim.cmd("colorscheme tokyonight-moon")
--     -- vim.cmd("colorscheme tokyonight-day")
-- end)
-- if not ok then
--     vim.notify("tokyonight not ready yet — restart Neovim after install", vim.log.levels.WARN)
-- end

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
