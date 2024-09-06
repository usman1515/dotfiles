return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "powerline_dark", -- "powerline", -- "nightfly", -- auto
                globalstatus = true,
                -- component_separators = { left = "|", right = "|" },
                -- section_separators = { left = "", right = "" },
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = '' },
                -- component_separators = { left = '', right = '' }
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                -- always_divide_middle = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {{'filename', path=1}, {require('auto-session.lib').current_session_name}},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {{'filename', path=1}},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {},
            },
            -- tabline = {
            --     lualine_a = {'buffers'},
            --     lualine_b = {},
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {'tabs'}
            -- },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_winbar = {},
            extensions = {}
        })
    end
}
