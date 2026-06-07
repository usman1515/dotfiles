vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})



-- run TSUpdate after install
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "nvim-treesitter" then
            vim.cmd("TSUpdate")
        end
    end,
})

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("nvim-treesitter not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

-- import nvim-treesitter plugin and configure treesitter
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
        "bash",
        "bibtex",
        "c",
        "cpp",
        "csv",
        "firrtl",
        "html",
        "json",
        "json5",
        "latex",
        "lua",
        "make",
        "markdown",
        "python",
        "rust",
        "scala",
        "tcl",
        "typst",
        "verilog",
        "vhdl",
        "vim",
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

