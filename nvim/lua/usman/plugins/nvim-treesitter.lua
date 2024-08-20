local config = function()
	require("nvim-treesitter.configs").setup({
		build = ":TSUpdate",
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		ensure_installed = {
            "arduino",
            "bash",
            "bibtex",
            "c",
            "cmake",
            "comment",
            "cpp",
            "dockerfile",
            "firrtl",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "html",
            "json",
            "json5",
            "latex",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "regex",
            "rust",
            "scala",
            "ssh_config",
            "toml",
            "v",
            "verilog",
            "vhdl",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = false,
				node_decremental = "<BS>",
			},
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
	config = config,
}
