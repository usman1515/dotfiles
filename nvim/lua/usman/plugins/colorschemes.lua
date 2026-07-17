-- To switch colorscheme: uncomment the one you want and comment out the active one.
-- Then restart Neovim.

-- INFO: colorscheme: vim-nightfly-colors
vim.pack.add({ "https://github.com/bluz71/vim-nightfly-colors" })
local ok = pcall(function()
    vim.g.nightflyCursorColor = true
    vim.g.nightflyItalics = true
    vim.g.nightflyNormalFloat = false
    vim.g.nightflyTerminalColors = true
    vim.g.nightflyTransparent = true
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

-- INFO: colorscheme: vim-moonfly-colors
-- vim.pack.add({ "https://github.com/bluz71/vim-moonfly-colors" })
-- local ok = pcall(function()
--     vim.g.moonflyCursorColor = true
--     vim.g.moonflyItalics = true
--     vim.g.moonflyNormalFloat = false
--     vim.g.moonflyTerminalColors = true
--     vim.g.moonflyTransparent = false
--     vim.g.moonflyUndercurls = true
--     vim.g.moonflyVirtualTextColor = true
--     vim.g.moonflyWinSeparator = 2
--     vim.opt.fillchars = {
--         horiz = '━', horizup = '┻', horizdown = '┳',
--         vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋',
--     }
--     -- vim.cmd("colorscheme moonfly")
-- end)
-- if not ok then
--     vim.notify("moonfly not ready yet — restart Neovim after install", vim.log.levels.WARN)
-- end

-- INFO: colorscheme: gruvbox
-- vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })
-- local ok = pcall(function()
--     vim.g.terminal_colors = true
--     vim.g.undercurl = true
--     vim.g.underline = true
--     vim.g.bold = true
--     vim.g.italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--     }
--     vim.g.strikethrough = true
--     vim.g.invert_selection = false
--     vim.g.invert_signs = false
--     vim.g.invert_tabline = false
--     vim.g.inverse = true
--     vim.g.contrast = ""
--     vim.g.palette_overrides = {}
--     vim.g.overrides = {}
--     vim.g.dim_inactive = false
--     vim.g.transparent_mode = false
--     vim.cmd("colorscheme gruvbox")
-- end)
-- if not ok then
--     vim.notify("gruvbox not ready yet — restart Neovim after install", vim.log.levels.WARN)
-- end

-- INFO: colorscheme: nightfox
-- vim.pack.add({ "https://github.com/EdenEast/nightfox.nvim" })
-- local ok = pcall(function()
--     -- vim.cmd("colorscheme dayfox")   -- light
--     -- vim.cmd("colorscheme dawnfox")  -- light
--     -- vim.cmd("colorscheme nightfox") -- dark
--     -- vim.cmd("colorscheme duskfox")  -- dark
--     -- vim.cmd("colorscheme nordfox")  -- dark
--     -- vim.cmd("colorscheme terafox")  -- dark
--     vim.cmd("colorscheme carbonfox")    -- dark
-- end)
-- if not ok then
--     vim.notify("nightfox not ready yet — restart Neovim after install", vim.log.levels.WARN)
-- end
