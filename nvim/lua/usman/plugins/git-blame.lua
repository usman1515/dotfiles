vim.pack.add({ "https://github.com/f-person/git-blame.nvim" })



local ok, gitblame = pcall(require, "gitblame")
if not ok then
    vim.notify("git-blame.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

-- Because of the keys part, you will be lazy loading this plugin.
-- The plugin wil only load once one of the keys is used.
-- If you want to load the plugin at startup, add something like event = "VeryLazy",
-- or lazy = false. One of both options will work.

gitblame.setup({
    enabled = true,  -- if you want to enable the plugin
    message_template = " <author> • <date> • <summary> ", -- template for the blame message
    date_format = "%a, %d-%b-%Y %H:%M:%S", -- template for the date, check Date format section for more options
    virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
})
