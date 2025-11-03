local opt = vim.opt

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

return {
    "lukas-reineke/indent-blankline.nvim",
    version = "v2.20.8",
    main = "ibl",
    lazy = false,
    opts = {},
    indent = {
        highlight = highlight,
        char = ""
    },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    config = function()
        vim.opt.list = true
        vim.opt.termguicolors = true
        vim.g.indent_blankline_use_treesitter = true
        vim.g.indent_blankline_char = "┊" --"▎"
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = true
        vim.g.indent_blankline_show_current_context = true

        vim.opt.listchars:append "space:⋅"
        -- vim.opt.listchars:append "eol:↴"

        -- Custom highlight for indent lines
        vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

        -- config
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = true,
            show_end_of_line = true,
            space_char_blankline = " ",
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                "IndentBlanklineIndent4",
                "IndentBlanklineIndent5",
                "IndentBlanklineIndent6",
            },
        })
    end,
}
