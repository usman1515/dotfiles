-- diagnostic signs
local signs = {
	{ name = "Error", text = "" },
	{ name = "Warn", text = "" },
	{ name = "Hint", text = "" },
	{ name = "Info", text = "" },
}

local config = function()
	local lspconfig = require("lspconfig")

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	-- for type, icon in pairs(diagnostic_signs) do
	-- 	local hl = "DiagnosticSign" .. type
	-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	-- end

	-- * setup language servers
	-- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
		-- on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})



	-- * install Linters and Formatters
	-- lua
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")



	-- * configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}