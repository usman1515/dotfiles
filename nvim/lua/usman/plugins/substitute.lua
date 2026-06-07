-- INFO: to replace words: viw + y + riw
-- set keymaps

vim.pack.add({ "https://github.com/gbprod/substitute.nvim" })



local keymap = vim.keymap -- for conciseness

local ok, substitute = pcall(require, "substitute")
if not ok then
    vim.notify("substitute.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

substitute.setup()

keymap.set("n", "r", substitute.operator, { desc = "Substitute with motion" })
keymap.set("n", "rr", substitute.line, { desc = "Substitute line" })
keymap.set("n", "R", substitute.eol, { desc = "Substitute to end of line" })
keymap.set("x", "r", substitute.visual, { desc = "Substitute in visual mode" })
