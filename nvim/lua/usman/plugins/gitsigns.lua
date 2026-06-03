vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })



local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    vim.notify("gitsigns.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

gitsigns.setup({
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '' },
        topdelete    = { text = '' },  -- '‾'
        changedelete = { text = '' },  -- '~'
        untracked    = { text = '┃' },  -- '┆'
    },
    signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '' },
        topdelete    = { text = '' },  -- '‾'
        changedelete = { text = '' },  -- '~'
        untracked    = { text = '┃' },  -- '┆'
    },
    signs_staged_enable = true,
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true,  -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%d-%m-%Y> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,     -- Use default
    max_file_length = 40000,    -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- keymapping function
        local function keymap(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- navigating between hunks
        keymap("n", "]h", gs.next_hunk, "Next Hunk")
        keymap("n", "[h", gs.prev_hunk, "Prev Hunk")

        -- staging and unstaging hunks
        keymap("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        keymap("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        keymap("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")
        keymap("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset hunk")

        -- staging and resetting buffer
        keymap("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        keymap("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
        keymap("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        keymap("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

        -- git blame
        keymap("n", "<leader>hb", function()
            gs.blame_line({ full = true })
        end, "Blame line")
        keymap("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

        -- git diff
        keymap("n", "<leader>hd", gs.diffthis, "Diff this")
        keymap("n", "<leader>hD", function()
            gs.diffthis("~")
        end, "Diff this ~")

        -- Text object
        keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
})

-- Set custom colors for git signs
local function set_gitsigns_colors()
    vim.api.nvim_set_hl(0, "GitSignsAdd",          { fg = "#90ee90", bg = "NONE" })    -- Light green
    vim.api.nvim_set_hl(0, "GitSignsChange",        { fg = "#87cefa", bg = "NONE" })   -- Light blue
    vim.api.nvim_set_hl(0, "GitSignsDelete",        { fg = "#ff0000", bg = "NONE" })   -- Red
    vim.api.nvim_set_hl(0, "GitSignsTopDelete",     { fg = "#ff0000", bg = "NONE" })   -- Red
    vim.api.nvim_set_hl(0, "GitSignsChangeDelete",  { fg = "#ff0000", bg = "NONE" })   -- Red
    vim.api.nvim_set_hl(0, "GitSignsUntracked",     { fg = "#006400", bg = "NONE" })   -- Dark green
end
set_gitsigns_colors()

-- Ensure colors persist after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_gitsigns_colors,
})
