-- Shorten function name
local keymap = vim.api.nvim_set_keymap

return {
    "numToStr/Comment.nvim",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = {
        -- Use Ctrl + / for commenting in normal and visual mode
		keymap("n", "<C-_>", "gcc", {noremap = false, silent = false}),
        keymap("v", "<C-_>", "gcc", {noremap = false, silent = false}),
	},
    opts = {
        -- Add a space b/w comment and the line
        padding = true,
        -- Whether the cursor should stay at its position
        sticky = true,
        -- Lines to be ignored while (un)comment
        ignore = nil,
        -- LHS of toggle mappings in NORMAL mode
        toggler = {
            -- Line-comment toggle keymap
            line = 'gcc',
            -- Block-comment toggle keymap
            block = 'gbc',
        },
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            -- Line-comment keymap
            line = 'gc',
            -- Block-comment keymap
            block = 'gb',
        },
        -- LHS of extra mappings
        extra = {
            -- Add comment on the line above
            above = 'gcO',
            -- Add comment on the line below
            below = 'gco',
            -- Add comment at the end of line
            eol = 'gcA',
        },
        -- Enable keybindings
        -- NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            -- Extra mapping; `gco`, `gcO`, `gcA`
            extra = true,
        },
        -- Function to call before (un)comment
        pre_hook = nil,
        -- Function to call after (un)comment
        post_hook = nil,
    },
    config = function()
        -- import comment plugin safely
        local comment = require("Comment")

        local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

        -- enable comment
        comment.setup({
            -- for commenting tsx, jsx, svelte, html files
            pre_hook = ts_context_commentstring.create_pre_hook(),
        })
    end,
}