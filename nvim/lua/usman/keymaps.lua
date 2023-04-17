local opts = { noremap = true, silent = false }

local term_opts = { silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- ========================= Normal =========================

-- pane creation: Leader + sv/sh/se/sx
keymap("n", "<leader>sv", "<C-w>v", opts)       -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts)       -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts)       -- make split window width equal
keymap("n", "<leader>sx", ":close<CR>", opts)   -- close current split window

-- pane navigation: Ctrl + up/down/right/left
keymap("n", "<C-Up>", "<C-w>k", opts)           -- move to pane above
keymap("n", "<C-Down>", "<C-w>j", opts)         -- move to pane below
keymap("n", "<C-Right>", "<C-w>l", opts)        -- move to pane left
keymap("n", "<C-Left>", "<C-w>h", opts)         -- move to pane right

-- pane resizing: Ctrl + k/j/l/h
keymap("n", "<C-k>", ":resize +1<CR>", opts)            -- resize up
keymap("n", "<C-j>", ":resize -1<CR>", opts)            -- resize down
keymap("n", "<C-l>", ":vertical resize -1<CR>", opts)   -- resize right
keymap("n", "<C-h>", ":vertical resize +1<CR>", opts)   -- resize left

-- buffer navigation: Shift + left/right
keymap("n", "<S-Right>", ":bnext<CR>", opts)        -- go to next buffer
keymap("n", "<S-Left>", ":bprevious<CR>", opts)     -- go to previous buffer

-- tab creation: Leader + to/tx
keymap("n", "<leader>to", ":tabnew<CR>", opts)      -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts)    -- close current tab

-- tab navigation: Leader + tn/tp/t0/t$
keymap("n", "<leader>tn", ":tabn<CR>", opts)        -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts)        -- go to previous tab
keymap("n", "<leader>t0", ":tabfirst<CR>", opts)    -- go to first tab
keymap("n", "<leader>t$", ":tablast<CR>", opts)     -- go to last tab

-- ========================= Insert =========================
-- Press jk fast to enter normal mode
keymap("i", "jk", "<ESC>", opts)

-- ========================= Visual =========================
-- Stay in indent mode: </>
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down: Alt + j/k
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- ========================= Visual Block =========================
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ========================= Terminal =========================
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- ========================= Tree File Explorer =========================
-- tree toggle
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)