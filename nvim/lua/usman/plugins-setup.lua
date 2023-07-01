-- installs packer plugin manager if its not installed when we open nvim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system {
            "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path,
        }
        print "Installing packer close and reopen Neovim..."
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads nvim and installs/upgrades/removes plugins
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

-- tries to import packer and if it fails wont do anything else
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return require('packer').startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim"    -- Have packer manage itself
    use "nvim-lua/popup.nvim"       -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"     -- Useful lua functions used in lots of plugins




    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
