-- INFO: can be used to add, remove and substitute single, double quotes and brackets
-- to add quotes (you surround):        ys + iw + ""
-- to change symbol (change surround):  cs + old_symbol + new_symbol
-- to remove quotes (delete surround):  ds + ""


return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
}
