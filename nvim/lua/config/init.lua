-- checks if lazy package manager is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- install the latest stable branch of lazy
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- source all files in nvim/lua/config dir
require("config.globals")
require("config.options")
require("config.keymaps")


local plugins = "plugins"

-- whichkey plugin configs
local opts = {
    defaults = {
        lazy = true,
    },
    install = {
        colorscheme = { "catppuccin" },
    },
    rtp = {
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrw",		-- for nvim tree
            "netrwPlugin",	-- for nvim tree
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },
    change_detection = {
        notify = false,
    },
}

-- source all plugins from plugins dir. invoke lazy package manager
require("lazy").setup(plugins, opts)
