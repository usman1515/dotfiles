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
-- pane creation
keymap("n", "<leader>sv", "<C-w>v", opts)       -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts)       -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts)       -- make split window width equal
keymap("n", "<leader>sx", ":close<CR>", opts)   -- close current split window

-- pane navigation: Ctrl + k/j/l/h
keymap("n", "<C-k>", "<C-w>k", opts)            -- move to pane above
keymap("n", "<C-j>", "<C-w>j", opts)            -- move to pane below
keymap("n", "<C-l>", "<C-w>l", opts)            -- move to pane left
keymap("n", "<C-h>", "<C-w>h", opts)            -- move to pane right

-- pane resizing: Ctrl + up/down/right/left
keymap("n", "<C-Up>", ":resize +1<CR>", opts)               -- resize up
keymap("n", "<C-Down>", ":resize -1<CR>", opts)             -- resize down
keymap("n", "<C-Right>", ":vertical resize -1<CR>", opts)   -- resize right
keymap("n", "<C-Left>", ":vertical resize +1<CR>", opts)    -- resize left

-- buffer navigation: Shift + l/h
keymap("n", "<S-l>", ":bnext<CR>", opts)            -- go to next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts)        -- go to previous buffer

-- tab creation
keymap("n", "<leader>to", ":tabnew<CR>", opts)      -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts)    -- close current tab

-- tab navigation
keymap("n", "<leader>tn", ":tabn<CR>", opts)        -- go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts)        -- go to previous tab
keymap("n", "<leader>t0", ":tabfirst<CR>", opts)    -- go to first tab
keymap("n", "<leader>t$", ":tablast<CR>", opts)     -- go to last tab

-- tree view toggle (Lexplorer)
-- keymap("n", "<leader>e", ":Lex 20<cr>", opts)       -- replace with nvim-tree

-- ========================= Insert =========================
-- Press jk fast to enter
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
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)           -- tree toggle

-- ========================= Telescope fzf =========================
-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)    -- find files within pwd, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)     -- find string in pwd as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts)   -- find string under cursor in pwd
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)       -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)     -- list available help tags

-- telescope git commands
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)   -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", opts) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)  -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)    -- list current changes per file with diff preview ["gs" for git status]
