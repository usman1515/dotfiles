return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
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
	},
	config = function()
        require("gitsigns").setup({
            signs = {
				add          = { text = '┃' },
				change       = { text = '┃' },
                delete       = { text = '' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
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
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm = {
                enable = false
            },
        })
    end
}

