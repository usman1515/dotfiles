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
    -- autocompletion
    use "hrsh7th/nvim-cmp"                  -- completion engine plugin
    use "hrsh7th/cmp-buffer"                -- nvim-cmp source for buffer completions
    use "hrsh7th/cmp-path"                  -- nvim-cmp source for paths completions
    use "hrsh7th/cmp-cmdline"               -- nvim-cmp source for vim command line completions
    use "hrsh7th/cmp-nvim-lsp"              -- nvim-cmp source for nvim built-in language server client
    use "neovim/nvim-lspconfig"             -- configs for the nvim LSP client
    -- code snippets
    use "L3MON4D3/LuaSnip"                  -- snippet engine
    use "saadparwaiz1/cmp_luasnip"          -- luasnip completion source for nvim-cmp
    use "rafamadriz/friendly-snippets"      -- preconfigured snippets for different languages



    -- colorschemes
    use "bluz71/vim-nightfly-colors" --keep
    use "EdenEast/nightfox.nvim" --keep
    use {"catppuccin/nvim", as="catppuccin"} -- keep
    use "Mofiqul/vscode.nvim" -- keep
    use "folke/tokyonight.nvim" -- keep
    use "crusoexia/vim-monokai" --keep
    use "loctvl842/monokai-pro.nvim" -- keep must - best monokai

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
