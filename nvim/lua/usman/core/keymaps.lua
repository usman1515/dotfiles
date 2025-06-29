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

-- ========================= Insert Mode =========================
-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- ========================= Normal Mode =========================
-- open netrw in split in tree view
-- vim.keymap.set("n", "<leader>e", ":25Lex<CR>", {desc = "Toggle NetRW tree view"})

-- tmux/vim Pane Navigation: Ctrl + hjkl (cross navigation)
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "Go to Left Window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "Go to Lower Window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "Go to Upper Window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "Go to Right Window"})

-- tmux/vim Pane Navigation: Ctrl + arrow keys (cross-navigation)
vim.keymap.set("n", "<C-Left>", "<cmd>TmuxNavigateLeft<cr>", {desc = "Navigate Left"})
vim.keymap.set("n", "<C-Down>", "<cmd>TmuxNavigateDown<cr>", {desc = "Navigate Down"})
vim.keymap.set("n", "<C-Up>", "<cmd>TmuxNavigateUp<cr>", {desc = "Navigate Up"})
vim.keymap.set("n", "<C-Right>", "<cmd>TmuxNavigateRight<cr>", {desc = "Navigate Right"})

-- Pane Creation
vim.keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split window vertically"})
vim.keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split window horizontally"})
vim.keymap.set("n", "<leader>se", "<C-w>=", {desc = "Make split window width equal"})
vim.keymap.set("n", "<leader>sx", ":close<CR>", {desc = "Close current split window"})

-- Buffer Navigation
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", {desc = "Go to next buffer"})
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>", {desc = "Go to prev buffer"})
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {desc = "Go to next buffer"})
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", {desc = "Go to prev buffer"})
-- vim.keymap.set("n", "<leader>bx", ":bd<CR>", {desc = "Close current buffer"})
vim.keymap.set("n", "<leader>bx", ":lua Snacks.bufdelete()<CR>", {desc = "Close current buffer"})

-- Tab Navigation
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab"})
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab"})
vim.keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", {desc = "Go to next tab"})
vim.keymap.set("n", "<leader>th", "<cmd>tabp<CR>", {desc = "Go to previous tab"})
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "Open current buffer in new tab"})

-- Page Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Move down half a page and centre it"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Move up half a page and centre it"})

-- Search
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear search highlights"})

vim.keymap.set("n", "n", "nzzzv", {desc = "Search next item and centre page view"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Search prev item and centre page view"})

-- Increment/Decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", {desc = "Increment number"})
vim.keymap.set("n", "<leader>-", "<C-x>", {desc = "Decrement number"})

-- remove trailing spaces (needs plugin mini.trailspace)
vim.keymap.set("n", "<leader>tt", ":lua MiniTrailspace.trim()<CR>", {desc = "Trim trailing spaces"})
vim.keymap.set("n", "<leader>TT", ":lua MiniTrailspace.trim_last_lines()<CR>", {desc = "Trim last lines"})

-- ========================= Visual Mode =========================
-- Indentation:
vim.keymap.set("v", "<", "<gv", {desc = "Indent right"})
vim.keymap.set("v", ">", ">gv", {desc = "Indent left"})
