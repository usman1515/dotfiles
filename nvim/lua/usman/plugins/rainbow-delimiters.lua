vim.pack.add({ "https://github.com/HiPhish/rainbow-delimiters.nvim" })



local ok, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not ok then
    vim.notify("rainbow-delimiters.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

-- This module contains a number of default definitions
---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
