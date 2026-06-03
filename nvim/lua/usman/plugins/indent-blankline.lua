vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })



local ok, ibl = pcall(require, "ibl")
if not ok then
    vim.notify("indent-blankline.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

vim.opt.list = true
vim.opt.termguicolors = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- Custom highlight for indent lines
local function set_ibl_colors()
    vim.cmd [[highlight RainbowRed    guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight RainbowYellow guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight RainbowGreen  guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight RainbowCyan   guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight RainbowBlue   guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight RainbowViolet guifg=#C678DD gui=nocombine]]
    vim.cmd [[highlight RainbowOrange guifg=#D19A66 gui=nocombine]]
end
set_ibl_colors()
-- Reapply highlights after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_ibl_colors,
})

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowGreen",
    "RainbowCyan",
    "RainbowBlue",
    "RainbowViolet",
    "RainbowOrange",
}

-- config
ibl.setup({
    indent = {
        char = "┊", --"▎"
        highlight = highlight,
    },
    scope = {
        -- replaces show_current_context and show_current_context_start
        enabled = true,
        highlight = highlight,
        show_start = true,
        show_end = true,
    },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
})
