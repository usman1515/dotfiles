vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
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
})

-- highlighting + indent are now enabled per-buffer, not via setup()
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*", -- or list specific filetypes
    callback = function()
        pcall(vim.treesitter.start)
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
