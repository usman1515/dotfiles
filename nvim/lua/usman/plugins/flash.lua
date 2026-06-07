vim.pack.add({ "https://github.com/folke/flash.nvim" })



local ok, flash = pcall(require, "flash")
if not ok then
    vim.notify("flash.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

flash.setup({
    modes = {
        search = {
            enabled = true,
        },
        -- char = {
        --   jump_labels = true,
        -- },
    },
})

-- stylua: ignore
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
