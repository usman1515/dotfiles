return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore = false, -- don't auto-restore on startup
            auto_save = true,     -- automatically save session on exit
            -- dont restore session in these dirs
            suppressed_dirs = {
                vim.fn.expand("~"),
                vim.fn.expand("~/Dev"),
                vim.fn.expand("~/Downloads"),
                vim.fn.expand("~/Documents"),
                vim.fn.expand("~/Desktop"),
            },
        })

        -- filetype and highlighting work correctly after a session is restored
        vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"

        -- INFO: keymaps for session management
        local keymap = vim.keymap
        keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
        keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for cwd" })
    end,
}
