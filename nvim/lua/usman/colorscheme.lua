-- set background color
vim.opt.background = "dark"
-- vim.opt.background = "light"

-- ==================================== my favourites
-- local colorscheme = "carbonfox"
-- local colorscheme = "catppuccin-mocha"
-- local colorscheme = "monokai-pro-spectrum"
-- local colorscheme = "nightfly"
-- local colorscheme = "tokyonight-night"
local colorscheme = "vscode" -- for light/dark change backgroud above

-- ==================================== light themes
-- local colorscheme = "catppuccin-latte"
-- local colorscheme = "dawnfox"
-- local colorscheme = "dayfox"
-- local colorscheme = "tokyonight-day"

-- ==================================== dark themes
-- local colorscheme = "catppuccin-frappe"
-- local colorscheme = "catppuccin-macchiato"
-- local colorscheme = "duskfox"
-- local colorscheme = "monokai"
-- local colorscheme = "monokai-pro"
-- local colorscheme = "monokai-pro-classic"
-- local colorscheme = "monokai-pro-default"
-- local colorscheme = "monokai-pro-machine"
-- local colorscheme = "monokai-pro-octagon"
-- local colorscheme = "monokai-pro-ristretto"
-- local colorscheme = "nightfox"
-- local colorscheme = "nordfox"
-- local colorscheme = "terafox"
-- local colorscheme = "tokyonight-moon"
-- local colorscheme = "tokyonight-storm"


-- protected func call

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
