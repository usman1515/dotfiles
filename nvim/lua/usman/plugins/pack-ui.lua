vim.pack.add({ "https://github.com/jtprogru/pack-ui.nvim" })



local ok, pack_ui = pcall(require, "pack_ui")
if not ok then
    vim.notify("pack-ui not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

require("pack_ui").setup({
    border = "rounded",     -- any nvim_open_win border
    title = " vim.pack ",
    max_width = 100,
    width_ratio = 0.9,
    height_ratio = 0.85,
    auto_check = true,      -- on setup, check remotes and notify if updates exist
    auto_update = false,    -- on setup, apply every available update automatically
    keymaps = {
        prefix = "<leader>p",
        status = "s",        -- <leader>ps -> :PackStatus
        update_all = "U",    -- <leader>pU -> :PackUpdateAll
    },
})




-- pack_ui.setup({
--     border = "rounded",     -- any nvim_open_win border
--     title = " vim.pack ",
--     max_width = 100,
--     width_ratio = 0.9,
--     height_ratio = 0.85,
--     auto_check = true,      -- on setup, check remotes and notify if updates exist
--     auto_update = false,    -- on setup, apply every available update automatically
--     keymaps = {
--         prefix = "<leader>p",
--         status = "s",        -- <leader>ps -> :PackStatus
--         update_all = "U",    -- <leader>pU -> :PackUpdateAll
--     },
-- })
