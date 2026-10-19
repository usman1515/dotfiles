vim.pack.add({
    { src = "https://github.com/akinsho/git-conflict.nvim", version = vim.version.range("*") },
})



local ok, git_conflict = pcall(require, "git-conflict")
if not ok then
    vim.notify("git-conflict not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

git_conflict.setup({
    default_mappings = true, -- buffer-local mappings (co/ct/cb/c0/]x/[x) while a conflict is present
    default_commands = true, -- creates the GitConflict* commands
    disable_diagnostics = false, -- set true to disable diagnostics in a buffer while it is conflicted
    list_opener = "copen", -- command or function to open the conflicts list
    highlights = { -- must have a background color, otherwise the default is used
        current = "DiffAdd", -- green, like VSCodium's current change
        incoming = "DiffText", -- blue, like VSCodium's incoming change
    },
})
