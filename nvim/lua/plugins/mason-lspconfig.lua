-- list of servers: https://github.com/williamboman/mason-lspconfig.nvim

local opts = {
	ensure_installed = {
		-- arduino
		"arduino_language_server", -- arduino-language-server
		-- bash
		"bashls", -- bash-language-server
        "shellcheck",
		-- c, c++
		"clangd",
        "clangd-format",
        "cpplint",
		-- cmake
		"cmake", -- cmake-language-server
        "cmakelang",
        "cmakelint",
		-- docker
		"docker_compose_language_service", -- docker-compose-language-service
        -- git
        "gitlint",
		-- grammarly
		"grammarly", -- grammarly-languageserver
		-- html
		"html", -- html-lsp
		-- json
		"jsonls", -- json-lsp
        "jsonlint",
		-- latex
		"ltex", -- ltex-ls
		"texlab",
		-- lua
		"lua_ls", -- lua-language-server
        "luacheck",
        "stylua",
		-- make
		"autotools_ls", -- autotools-language-server
		-- markdown
        "markdown-toc",
		"marksman",
        "markuplint",
		-- matlab
		"matlab_ls", -- matlab-language-server
		-- python
		"pyright",
        "pylint",
		-- rust
		"rust_analyzer",
		-- toml
		"taplo",
		-- verilog, system verilog
		"verible",
        -- vimscript
        "vimls", -- vim-language-server
		-- xml
		"lemminx", -- lemminx
        "xmlformetter",
		-- yaml
		"hydra_lsp", -- hydra-lsp
		-- "yaml-language-server",
		"yamllint",
        -- general purpose LSP
        "efm",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}

