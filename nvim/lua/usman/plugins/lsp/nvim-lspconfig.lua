-- INFO: basic LSP keymaps
-- Shift+K - hover over a word for definition
-- grn - rename all instances of a word

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },   -- default configs for LSP servers
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },    -- feeds LSP completions into nvim-cmp dropdown
    { src = "https://github.com/folke/lazydev.nvim" },      -- Lua API completions for Neovim plugin development
})

local ok, _ = pcall(require, "lspconfig")
if not ok then
    vim.notify("nvim-lspconfig not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

-- integrate autocompletion with the LSP
-- UPDATED: set capabilities globally using vim.lsp.config('*', ...)
-- this applies to ALL LSP servers without needing to pass it to each one
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities,
})

--  setup lazydev.nvim instead of neodev.nvim
-- provides Lua API completions and type hints for Neovim plugin development
require("lazydev").setup({
    library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
    },
})

-- Define sign icons for each severity
local signs = {
    [vim.diagnostic.severity.ERROR] = "",  -- "",
    [vim.diagnostic.severity.WARN] = " ",  -- " ",
    [vim.diagnostic.severity.HINT] = " ",  -- "󰠠 ",
    [vim.diagnostic.severity.INFO] = " ",  -- " ",
}

-- Set the diagnostic config with all icons
vim.diagnostic.config({
    signs = {
        text = signs -- Enable signs in the gutter
    },
    virtual_text = true,        -- Enable virtual text for diagnostics
    underline = true,           -- Underline diagnostics
    -- false means diagnostics are NOT updated in insert mode. this is intentional to avoid noise
    -- while typing
    update_in_insert = false,
})



-- lsp server configs ─────────────────────────────────────────────────────
-- "lua_ls"
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            completion = {
                callSnippet = "Replace",
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

-- "autotools_ls" - Makefile, Makefile.am, configure.ac
vim.lsp.config('autotools_ls', {})

-- "bashls" - Bash and Zsh
vim.lsp.config('bashls', {
    filetypes = { "sh", "bash", "zsh" },
})

-- "clangd" - C and C++
vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",       -- index project in background
        "--clang-tidy",             -- enable clang-tidy diagnostics
        "--header-insertion=iwyu",  -- include-what-you-use header insertion
        "--completion-style=detailed",
        "--function-arg-placeholders",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
})

-- "cmake"
vim.lsp.config('cmake', {})

-- "jsonls"
vim.lsp.config('jsonls', {
    capabilities = capabilities,
})

-- "ltex" - LaTeX and Markdown grammar checking
vim.lsp.config('ltex', {
    settings = {
        ltex = {
            language = "en-US",
            filetypes = { "bib", "gitcommit", "markdown", "plaintex", "rst", "tex", "pandoc", "html", "xhtml", "mail", "text" },
        },
    },
})

-- "marksman" - Markdown LSP
vim.lsp.config('marksman', {})

-- "pyright" - Python
vim.lsp.config('pyright', {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true
            },
        },
    },
})

-- "rust_analyzer" - Rust
vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false,
            },
        },
    },
})

-- "svlangserver" - SystemVerilog / Verilog / UVM
vim.lsp.config('svlangserver', {
    filetypes = { "systemverilog", "verilog" },
    settings = {
        systemverilog = {
            includeIndexing = { "**/*.{sv,svh,v,vh}" },
            excludeIndexing = { "test/**/*.sv*" },
        },
    },
})

-- "texlab" - full LaTeX LSP (completions, go-to-def, formatting)
vim.lsp.config('texlab', {
    settings = {
        texlab = {
            build = {
                onSave = true, -- set to true to auto-build on save
            },
            chktex = {
                onOpenAndSave = true, -- run chktex linter on open/save
            },
        },
    },
})

-- "tinymist" - Typst LSP
vim.lsp.config('tinymist', {
    settings = {
        exportPdf = "onSave",   -- export PDF on save
        outputPath = "$dir/$name",
    },
})

-- "vhdl_ls" - VHDL
vim.lsp.config('vhdl_ls', {
    cmd = { "vhdl_ls" },
    filetypes = { "vhd", "vhdl" },
})

-- "dockerls" - Dockerfile LSP
vim.lsp.config('dockerls', {})

-- "docker_compose_language_service" - docker-compose.yml LSP
vim.lsp.config('docker_compose_language_service', {})

-- "yamlls"
vim.lsp.config('yamlls', {
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                ["/path/from/root/of/project"] = "/.github/workflows/*",
            },
        },
    },
})

-- ─── ENABLE ALL LSP SERVERS ─────────────────────────────────────────────────
-- UPDATED: use vim.lsp.enable() instead of individual .setup{} calls
-- this replaces the old require('lspconfig').server.setup{} pattern
-- NOTE: automatic_enable = false in mason.lua means we enable servers here manually
vim.lsp.enable({
    -- "autotools_ls",
    -- "bashls",
    -- "clangd",
    -- "cmake",
    -- "dockerls",
    -- "docker_compose_language_service",
    -- "jsonls",
    "ltex",
    "lua_ls",
    "marksman",
    -- "pyright",
    -- "rust_analyzer",
    "svlangserver",
    "texlab",
    "tinymist",
    "vhdl_ls",
    -- "yamlls",
})


