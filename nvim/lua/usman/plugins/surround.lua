-- INFO: can be used to add, remove and substitute single, double quotes and brackets
-- to add quotes: ys + iw + ""
-- to remove quotes: ds + ""
-- to change symbol: cs + old_symbol + new_symbol



return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
}
