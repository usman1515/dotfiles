-- Shorten function name
local keymap = vim.keymap

local config = function()
    local telescope = require("telescope")
    local builtin = require('telescope.builtin')
    telescope.setup({
        defaults = {
            -- path_display = { "smart" }, -- smart path display
            mappings = {
                i = {
                    -- move between results using Ctrl + up/down
                    ["<C-Up>"] = "move_selection_next",
                    ["<C-Down>"] = "move_selection_previous",
                },
            },
        },
        pickers = {
            find_files = {
                -- theme = "dropdown", -- uncomment to use dropdown else default
                previewer = true,
                hidden = true,
            },
            live_grep = {
                -- theme = "dropdown", -- uncomment to use dropdown else default
                previewer = true,
            },
            buffers = {
                -- theme = "dropdown", -- uncomment to use dropdown else default
                previewer = true,
            },
        },
    })
    telescope.load_extension("fzf")
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        },
    config = config,
    keys = {
        keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", {desc = "list telescope keymaps"}),
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {desc = "list available help tags"}),
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {desc = "find files within current working directory, respects .gitignore"}),
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" }),
        keymap.set("n", "<leader>fa", "<cmd>Telescope <CR>", {desc = "telescope keymaps"}),
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", {desc = "find string in cwd as you type" }),
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {desc = "list open buffers in current neovim instance" }),
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", {desc = "find string under cursor in cwd" }),
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" }),
    },
}

