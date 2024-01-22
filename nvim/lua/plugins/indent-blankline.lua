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
}
