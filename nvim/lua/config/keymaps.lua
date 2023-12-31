-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

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
keymap("n", "<leader>m", ":NvimTreeFocus<CR>", opts)   -- Focus Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)  -- Toggle Nvim Tree

-- * Pane Navigation: Ctrl up/down/right/left
keymap("n", "<C-Left>", "<C-w>h", opts)     -- h - Navigate Right
keymap("n", "<C-Down>", "<C-w>j", opts)     -- j - Navigate Down
keymap("n", "<C-Up>", "<C-w>k", opts)       -- k - Navigate Up
keymap("n", "<C-Right>", "<C-w>l", opts)    -- l - Navigate Left

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

-- * Buffer Navigation:
keymap("n", "<leader>bn", ":bnext<CR>", opts)       -- go to next buffer
keymap("n", "<leader>bp", ":bprevious<CR>", opts)   -- go to previous buffer

-- * Tab Creation
keymap("n", "<leader>to", ":tabnew<CR>", opts)      -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts)    -- close current tab

-- * Tab Navigation
keymap("n", "<leader>tn", ":tabn<CR>", opts)        -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts)        -- go to previous tab
keymap("n", "<leader>t0", ":tabfirst<CR>", opts)    -- go to first tab
keymap("n", "<leader>t$", ":tablast<CR>", opts)     -- go to last tab
