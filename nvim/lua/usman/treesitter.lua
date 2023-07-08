-- protected func call
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    -- A list of parser names, or "all" (listed parsers should always be installed)
    ensure_installed = { "arduino",
        "bash",
        "c", "cpp",
        "comment",
        "cmake",
        "dockerfile",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "json",
        "latex",
        "make",
        "markdown",
        "python",
        "rst",
        "rust",
        "verilog",
        "vim",
        "yaml"
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    -- List of parsers to ignore installing
    ignore_install = { "" },

    highlight = {
        -- false will disable the whole extension
        enable = true,
        -- NOTE: these are the names of the parsers and not the filetype.
        -- list of language that will be disabled
        disable = { "" },
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "" },
    },
}
