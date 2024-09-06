return {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { 
        'nvim-treesitter/nvim-treesitter', 
        'nvim-tree/nvim-web-devicons' 
    }, -- if you prefer nvim-web-devicons
    config = function()
        require('render-markdown').setup({
            heading = {},
            code = {},
            dash = {},
            bullet = {},
            checkbox = {},
            quote = {},
            pipe_table = {},
            callout = {},
            link = {},
            sign = {},
            indent = {},
        })
    end
}
