return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },

    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({
            -- enable syntax highlighting
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = { enable = true },
            -- ensure these language parsers are installed
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
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}

