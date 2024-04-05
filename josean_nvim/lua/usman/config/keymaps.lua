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
local keymap = vim.api.nvim_set_keymap
-- ! local mapkey = require("util.keymapper").mapkey

-- ========================= Insert Mode =========================
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- ========================= Normal Mode =========================
-- * Tree Directory Navigation
keymap("n", "<leader>ee", ":Neotree toggle<CR>", opts)      -- open file tree
keymap("n", "<leader>ef", ":Neotree filesystem<CR>", opts)  -- open current file in file tree
-- keymap("n", "<leader>g", ":Neotree git_status<CR>", opts)   -- neo tree git status

-- * Nvim Pane Navigation: Ctrl + up/down/right/left
keymap("n", "<C-Left>", "<C-w>h", opts)     -- h - Navigate Right
keymap("n", "<C-Down>", "<C-w>j", opts)     -- j - Navigate Down
keymap("n", "<C-Up>", "<C-w>k", opts)       -- k - Navigate Up
keymap("n", "<C-Right>", "<C-w>l", opts)    -- l - Navigate Left

-- * Tmux Pane Navigation: Alt + up/down/right/left
keymap("n", "<M-Left>", "TmuxNavigateLeft", opts)   -- Navigate Left
keymap("n", "<M-Down>", "TmuxNavigateDown", opts)   -- Navigate Down
keymap("n", "<M-Up>", "TmuxNavigateUp", opts)       -- Navigate Up
keymap("n", "<M-Right>", "TmuxNavigateRight", opts) -- Navigate Right

-- * Pane Creation
keymap("n", "<leader>sv", "<C-w>v", opts)       -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts)       -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts)       -- make split window width equal
keymap("n", "<leader>sx", ":close<CR>", opts)   -- close current split window

-- * Pane Resizing: Ctrl + k/j/l/h
keymap("n", "<C-k>", ":resize +1<CR>", opts)            -- resize up
keymap("n", "<C-j>", ":resize -1<CR>", opts)            -- resize down
keymap("n", "<C-l>", ":vertical resize -1<CR>", opts)   -- resize right
keymap("n", "<C-h>", ":vertical resize +1<CR>", opts)   -- resize left

-- * Buffer Navigation
keymap("n", "<leader>bn", ":bnext<CR>", opts)       -- go to next buffer
keymap("n", "<leader>bp", ":bprevious<CR>", opts)   -- go to previous buffer
keymap("n", "<leader>b0", ":bfirst<CR>", opts)      -- go to first buffer
keymap("n", "<leader>b$", ":blast<CR>", opts)       -- go to last buffer
keymap("n", "<leader>bx", ":bd<CR>", opts)          -- close current buffer

-- * Tab Navigation
keymap("n", "<leader>tn", ":tabn<CR>", opts)        -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts)        -- go to previous tab
keymap("n", "<leader>t0", ":tabfirst<CR>", opts)    -- go to first tab
keymap("n", "<leader>t$", ":tablast<CR>", opts)     -- go to last tab
keymap("n", "<leader>to", ":tabnew<CR>", opts)      -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts)    -- close current tab

-- * Search
keymap("n", "<leader>nh", ":nohl<CR>", opts)        -- clear search highlights

-- * Numbers
keymap("n", "<leader>+", "<C-a>", opts)             -- increment number
keymap("n", "<leader>-", "<C-x>", opts)             -- decrement number

-- ========================= Visual Mode =========================
-- * Indentation:
keymap("v", "<", "<gv", opts)   -- indent right
keymap("v", ">", ">gv", opts)   -- indent left
