-- Shorten function name
local keymap = vim.keymap

local config = function()
	local telescope = require("telescope")
	local builtin = require('telescope.builtin')
	telescope.setup({
		defaults = {
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
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		keymap.set("n", "<leader>fk", ": Telescope keymaps<CR>"),		-- list telescope keymaps
		keymap.set("n", "<leader>fh", ": Telescope help_tags<CR>"),		-- list available help tags
		keymap.set("n", "<leader>ff", ": Telescope find_files<CR>"),	-- find files within current working directory, respects .gitignore
		keymap.set("n", "<leader>fa", ": Telescope <CR>"),				-- telescope keymaps
		keymap.set("n", "<leader>fg", ": Telescope live_grep<CR>"),		-- find string in current working directory as you type
		keymap.set("n", "<leader>fb", ": Telescope buffers<CR>"),		-- list open buffers in current neovim instance
		keymap.set("n", "<leader>fc", ": Telescope grep_string<CR>"),	-- find string under cursor in current working directory
	},
}

