-- INFO: disable lazy loading. want theme to be always loaded
-- default priority is 50

return {
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
        vim.cmd("colorscheme nightfly")
    end,
    opts = {},
}

-- return {
--     "bluz71/vim-moonfly-colors",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.g.moonflyCursorColor = true
--         vim.g.moonflyItalics = true
--         vim.g.moonflyNormalFloat = false
--         -- set global transparency
--         vim.g.moonflyTransparent = false
--         -- Apply the moonfly colorscheme
--         vim.cmd("colorscheme moonfly")
--     end,
--     opts = {},
-- }

-- return {
--     "marko-cerovac/material.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- available colors
--         -- vim.cmd("colorscheme material-darker")
--         -- vim.cmd("colorscheme material-lighter")
--         -- vim.cmd("colorscheme material-oceanic")
--         -- vim.cmd("colorscheme material-palenight")
--         vim.cmd("colorscheme material-deep-ocean")
--         require('material').setup({
--             contrast = {
--                 terminal = true, -- Enable contrast for the built-in terminal
--                 sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--                 floating_windows = false, -- Enable contrast for floating windows
--                 cursor_line = false, -- Enable darker background for the cursor line
--                 lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
--                 non_current_windows = false, -- Enable contrasted background for non-current windows
--                 filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
--             },
--             styles = { -- Give comments style such as bold, italic, underline etc.
--                 comments = { [[ italic = true ]] },
--                 strings = { --[[ bold = true ]] },
--                 keywords = { --[[ underline = true ]] },
--                 functions = { [[ bold = true, undercurl = true ]] },
--                 variables = {},
--                 operators = {},
--                 types = {},
--             },
--             plugins = { -- Uncomment the plugins that you use to highlight them
--                 -- Available plugins:
--                 -- "coc",
--                 -- "colorful-winsep",
--                 -- "dap",
--                 -- "dashboard",
--                 -- "eyeliner",
--                 -- "fidget",
--                 -- "flash",
--                 "gitsigns",
--                 -- "harpoon",
--                 -- "hop",
--                 -- "illuminate",
--                 "indent-blankline",
--                 -- "lspsaga",
--                 -- "mini",
--                 -- "neogit",
--                 -- "neotest",
--                 "neo-tree",
--                 -- "neorg",
--                 -- "noice",
--                 "nvim-cmp",
--                 -- "nvim-navic",
--                 -- "nvim-tree",
--                 "nvim-web-devicons",
--                 "rainbow-delimiters",
--                 -- "sneak",
--                 "telescope",
--                 "trouble",
--                 "which-key",
--                 -- "nvim-notify",
--             },
--             high_visibility = {
--                 lighter = false,    -- Enable higher contrast text for lighter style
--                 darker = false      -- Enable higher contrast text for darker style
--             },
--             lualine_style = "stealth",  -- Lualine style ( can be 'stealth' or 'default' )
--         })
--     end,
--     opts = {},
-- }

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
