vim.pack.add({
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    -- { src = "https://github.com/saghen/blink.cmp" },
})



-- import mason and mason_lspconfig
local ok, mason = pcall(require, "mason")
if not ok then
    vim.notify("mason.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

-- enable mason and configure icons
mason.setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "➜",
            package_uninstalled = "",
        },
    },
})

-- LSP servers for mason to install
mason_lspconfig.setup({
    automatic_enable = false,
    ensure_installed = {
        -- "arduino_language_server",
        "autotools_ls",     -- Makefile, configure.ac (covers Make)
        "bashls",           -- Bash and Zsh
        "clangd",           -- C and C++
        "cmake",
        "dockerls",         -- Dockerfile LSP
        "docker_compose_language_service", -- docker-compose.yml LSP
        "jsonls",
        "ltex",             -- LaTeX grammar checking
        "lua_ls",
        "marksman",         -- Markdown LSP (completions, link checking, go-to-def)
        "pyright",          -- Python
        "rust_analyzer",    -- Rust
        "svlangserver",     -- SystemVerilog/Verilog/UVM full LSP (completions, go-to-def)
        "texlab",           -- full LaTeX LSP (completions, formatting, go-to-def)
        "tinymist",         -- Typst LSP (replaces deprecated typst_lsp)
        "vhdl_ls",          -- VHDL
        "yamlls",
    },
})

-- Linters and Formatters for mason to install
mason_tool_installer.setup({
    ensure_installed = {
        -- Python
        "pylint",           -- Python linter
        "ruff",             -- Python fast linter + formatter (replaces flake8 + black combined)
        "black",            -- Python opinionated formatter
        "isort",            -- Python import sorter
        -- C / C++
        "clang-format",     -- C/C++ formatter (industry standard, pairs with clangd)
        -- Bash / Zsh
        "shellcheck",       -- Bash/Zsh linter (catches bugs and bad practices)
        "shfmt",            -- Bash/Zsh formatter
        -- Markdown
        "markdownlint",     -- Markdown linter (style issues and broken syntax)
        "prettier",         -- general formatter (also handles Markdown, JSON, YAML)
        -- LaTeX
        "latexindent",      -- LaTeX formatter/indenter
        -- Docker
        "hadolint",         -- Dockerfile linter (catches bad practices)
        -- Git
        "gitlint",          -- git commit message linter
        -- Make
        "checkmake",        -- Makefile linter
        -- Lua
        "stylua",           -- Lua formatter
        -- Verilog / SystemVerilog (linter + formatter, LSP is svlangserver above)
        "verible",
        -- rustfmt is NOT installed via mason
        -- Install it via rustup instead: rustup component add rustfmt
        -- Typst formatting is handled by tinymist LSP above, no separate tool needed
        -- VHDL and Tcl have no formatters/linters available in mason registry
    },
})
