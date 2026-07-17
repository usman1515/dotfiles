-- native 0.12 vimpack plugin manager: lua/usman/vimpack.lua

-- INFO: call all plugins here

-- core
require("usman.plugins.colorschemes")
require("usman.plugins.init")
require("usman.plugins.vim-tmux-navigator")

-- QoL
require("usman.plugins.auto-session")
require("usman.plugins.mini-nvim")
require("usman.plugins.snacks")
require("usman.plugins.flash")
require("usman.plugins.git-blame")
require("usman.plugins.gitsigns")
require("usman.plugins.indent-blankline")
require("usman.plugins.lualine")
require("usman.plugins.md-preview")
require("usman.plugins.rainbow-delimiters")
require("usman.plugins.substitute")
require("usman.plugins.vimtex")
require("usman.plugins.pack-ui")

-- autocompletion, LSPs, linters, formatters
require("usman.plugins.nvim-treesitter")
require("usman.plugins.nvim-cmp")
require("usman.plugins.lsp.mason")
require("usman.plugins.lsp.nvim-lspconfig")





-- custom packer commands
-- INFO: pack add
vim.api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (PackAdd user/repo)", })

-- INFO: pack update
vim.api.nvim_create_user_command("PackUpdate", function(opts)
    if opts.args ~= "" then
        -- update specific plugins
        local plugins = vim.split(opts.args, "%s+", { trimempty = true })
        vim.pack.update(plugins)
    else
        -- update all
        vim.pack.update()
    end
end, { desc = "Update all plugins or specific ones", nargs = "*", }
)

-- INFO: pack del
vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (space separated)" })

-- INFO: pack nonactive - show all non active plugins on disk but removed from pack.lua
vim.api.nvim_create_user_command("PackCheck", function()
    local non_active = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    if #non_active == 0 then
        vim.notify("🆗 No non-active plugins found!", vim.log.levels.INFO)
        return
    end

    vim.print("😴 Non-active plugins :")
    print(" ")
    -- vim.print(non_active)
    for _, name in ipairs(non_active) do
        print(name)
    end

    print(" ")

    local choice = vim.fn.confirm(
        "Delete ALL non-active plugins from disk?",
        "&Yes\n&No",
        2  -- default = No
    )

    if choice == 1 then
        vim.pack.del(non_active)
        vim.notify("🗑️  Deleted " .. #non_active .. " non-active plugin(s)", vim.log.levels.INFO)
        print("Non-active plugins deleted!")
        vim.api.nvim_exec_autocmds("User", { pattern = "PackChanged" })
    else
        vim.notify("Cancelled. No plugins were deleted!", vim.log.levels.INFO)
    end
end, { desc = "List non active plugins and select to delete"})

