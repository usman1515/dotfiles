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
    -- vim.cmd("colorscheme nightfly")
end)
if not ok then
    vim.notify("nightfly not ready yet — restart Neovim after install", vim.log.levels.WARN)
end

-- INFO: colorscheme: tokyonight
vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
require("tokyonight").setup({
    -- style = "storm",
    style = "night",
    -- style = "moon",
    -- style = "day",
    transparent = false,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
    on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
    end,
})
local ok = pcall(function()
    -- vim.cmd("colorscheme tokyonight-storm")
    -- vim.cmd("colorscheme tokyonight-night")
    -- vim.cmd("colorscheme tokyonight-moon")
    -- vim.cmd("colorscheme tokyonight-day")
end)
if not ok then
    vim.notify("tokyonight not ready yet — restart Neovim after install", vim.log.levels.WARN)
end

-- INFO: colorscheme: vim-moonfly-colors
vim.pack.add({ "https://github.com/bluz71/vim-moonfly-colors" })
local ok = pcall(function()
    vim.g.moonflyCursorColor = true
    vim.g.moonflyItalics = true
    vim.g.moonflyNormalFloat = false
    vim.g.moonflyTerminalColors = true
    vim.g.moonflyTransparent = false
    vim.g.moonflyUndercurls = true
    vim.g.moonflyVirtualTextColor = true
    vim.g.moonflyWinSeparator = 2
    vim.opt.fillchars = {
        horiz = '━', horizup = '┻', horizdown = '┳',
        vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋',
    }
    -- vim.cmd("colorscheme moonfly")
end)
if not ok then
    vim.notify("moonfly not ready yet — restart Neovim after install", vim.log.levels.WARN)
end

-- INFO: colorscheme: gruvbox
vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })
local ok = pcall(function()
    require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = true,
        inverse = true,
        contrast = "", -- keep empty so dark0 is used (not "hard"/"soft")
        palette_overrides = {
            dark0 = "#1c1c1c", -- retrobox default background
        },
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
    })
    -- vim.o.background = "dark"
    -- vim.cmd.colorscheme("gruvbox")
end)
if not ok then
    vim.notify("gruvbox not ready yet — restart Neovim after install", vim.log.levels.WARN)
end

-- INFO: colorscheme: nightfox
vim.pack.add({ "https://github.com/EdenEast/nightfox.nvim" })
local ok = pcall(function()
    -- vim.cmd("colorscheme dayfox")   -- light
    -- vim.cmd("colorscheme dawnfox")  -- light
    -- vim.cmd("colorscheme nightfox") -- dark
    -- vim.cmd("colorscheme duskfox")  -- dark
    -- vim.cmd("colorscheme nordfox")  -- dark
    -- vim.cmd("colorscheme terafox")  -- dark
    -- vim.cmd("colorscheme carbonfox")    -- dark
end)
if not ok then
    vim.notify("nightfox not ready yet — restart Neovim after install", vim.log.levels.WARN)
end

-- INFO: colorscheme: catppuccin
vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })
local ok = pcall(function()
    require("catppuccin").setup({
        flavour = "auto",       -- latte, frappe, macchiato, mocha
        background = {          -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        float = {
            transparent = true, -- enable transparent floating windows
            solid = false, -- use solid styling for floating windows, see |winborder|
        },
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = true, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = {},
            conditionals = { "italic" },
            loops = {},
            functions = { "bold" },
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
                ok = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        color_overrides = {},
        custom_highlights = {},
        auto_integrations = true, -- auto-enables integrations for installed plugins
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        },
    })
    -- vim.cmd.colorscheme("catppuccin-latte")
    -- vim.cmd.colorscheme("catppuccin-frappe")
    -- vim.cmd("catppuccin-macchiato")
    vim.cmd.colorscheme("catppuccin-mocha")
end)
if not ok then
    vim.notify("catppuccin not ready yet — restart Neovim after install", vim.log.levels.WARN)
end

