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

-- source all plugins from plugins dir. invoke lazy package manager
require("lazy").setup("usman.plugins")

