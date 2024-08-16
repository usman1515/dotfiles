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
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- ========================= Normal Mode =========================
-- * Tree Directory Navigation
keymap.set("n", "<leader>ee", ":Neotree toggle<CR>", { desc = "open file tree" })
keymap.set("n", "<leader>ef", ":Neotree filesystem<CR>", { desc = "open current file in file tree" })
-- keymap("n", "<leader>g", ":Neotree git_status<CR>", opts)   -- neo tree git status

-- * Nvim Pane Navigation: Ctrl + hjkl
keymap.set("n", "<M-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<M-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<M-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<M-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- * Tmux Pane Navigation: Alt + up/down/right/left
keymap.set("n", "<C-Left>", "TmuxNavigateLeft", { desc = "Navigate Left", remap = true })
keymap.set("n", "<C-Down>", "TmuxNavigateDown", { desc = "Navigate Down", remap = true })
keymap.set("n", "<C-Up>", "TmuxNavigateUp", { desc = "Navigate Up", remap = true })
keymap.set("n", "<C-Right>", "TmuxNavigateRight", { desc = "Navigate Right", remap = true })

-- * Pane Creation
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically", remap = true})
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally", remap = true})
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split window width equal", remap = true})
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window", remap = true})

-- * Buffer Navigation
keymap.set("n", "<leader>bl", ":bnext<CR>", { desc = "Go to next buffer", remap = true})
keymap.set("n", "<leader>bh", ":bprevious<CR>", { desc = "Go to prev buffer", remap = true})
keymap.set("n", "<leader>b0", ":bfirst<CR>", { desc = "Go to first buffer", remap = true})
keymap.set("n", "<leader>b$", ":blast<CR>", { desc = "Go to last buffer", remap = true})
keymap.set("n", "<leader>bx", ":bd<CR>", { desc = "Close current buffer", remap = true})
keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>", { desc = "Pin current buffer", remap = true})

-- * Tab Navigation
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- * Search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights", remap = true })

-- * Increment/Decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number", remap = true })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number", remap = true })

-- ========================= Visual Mode =========================
-- * Indentation:
keymap.set("v", "<", "<gv", { desc = "Indent right", remap = true })
keymap.set("v", ">", ">gv", { desc = "Indent left", remap = true })
