return {
    "nvim-tree/nvim-tree.lua", --source plugin
    lazy = false, -- load every time
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,
            },
            view = {
                adaptive_size = true,
            },
        })
    end,
}

