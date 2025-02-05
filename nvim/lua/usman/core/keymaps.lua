-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Make sure to set `mapleader` before lazy so your mappings are correct
-- map leader key as a global config
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
local opts = { noremap = true, silent = false }
-- terminal options
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.keymap

-- ========================= Insert Mode =========================
-- Press jk fast to enter
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- ========================= Normal Mode =========================
-- tmux/vim Pane Navigation: Ctrl + hjkl (cross navigation)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- tmux/vim Pane Navigation: Ctrl + arrow keys (cross-navigation)
keymap.set("n", "<C-Left>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate Left", remap = true })
keymap.set("n", "<C-Down>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate Down", remap = true })
keymap.set("n", "<C-Up>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate Up", remap = true })
keymap.set("n", "<C-Right>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate Right", remap = true })

-- Nvim Pane Navigation: Alt + up/down/right/left
-- keymap.set("n", "<-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- keymap.set("n", "<-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- keymap.set("n", "<-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- keymap.set("n", "<-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Pane Creation
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically", remap = true})
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally", remap = true})
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split window width equal", remap = true})
-- keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window", remap = true})

-- Buffer Navigation

-- Tab Navigation
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights", noremap = true , silent = false })

-- Increment/Decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number", remap = true })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number", remap = true })

-- remove trailing spaces (needs plugin mini.trailspace)
keymap.set("n", "<leader>tt", ":lua MiniTrailspace.trim()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>TT", ":lua MiniTrailspace.trim_last_lines()<CR>", { noremap = true, silent = true })

-- ========================= Visual Mode =========================
-- Indentation:
keymap.set("v", "<", "<gv", { desc = "Indent right", remap = true })
keymap.set("v", ">", ">gv", { desc = "Indent left", remap = true })
