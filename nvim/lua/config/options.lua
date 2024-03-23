local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 4         -- set numerb of spaces for a tab
opt.shiftwidth = 4      -- spaces for each level of indentation
opt.softtabstop = 4     -- how many spaces is a tab in insert mode
opt.expandtab = true    -- coverts tabs to spaces
opt.smartindent = true  -- insert smart indent tabs
opt.wrap = false        -- dont wrap aroung long lines

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Line numbers
-- relative line numbers in normal mode
vim.cmd("autocmd InsertEnter * set number | autocmd InsertLeave * set relativenumber")
-- absolute line numbers in insert mode
vim.cmd("autocmd BufEnter * set relativenumber | autocmd InsertEnter * set norelativenumber")

-- Appearance
-- opt.number = true           -- insert line numbers
-- opt.relativenumber = true   -- relative line numbres
opt.termguicolors = true    -- full color support
opt.colorcolumn = "100"     -- insert line at 100 column
opt.signcolumn = "yes"
opt.cursorline = true       -- highlight the current cursor line
opt.cmdheight = 2           -- command height
opt.scrolloff = 10          -- start scrolling when you hit the last 10 lines
opt.completeopt = "menuone,noinsert,noselect" -- autocompletion setting

-- Behaviour
opt.hidden = true
opt.errorbells = false      -- turn off bells
opt.swapfile = false        -- dont create swap files
opt.backup = false          -- dont create bakup files
opt.undodir = vim.fn.expand("~/.vim/undodir") -- undo file dir
opt.undofile = true         -- make an undo file available
opt.backspace = "indent,eol,start" --  bakcspace key behaviour
opt.splitright = true       -- new panes added on right
opt.splitbelow = true       -- new panes added on bottom
opt.autochdir = false       -- dont automaticaaly change dirs
opt.iskeyword:append("-")   -- words with - is a whole word
opt.mouse:append("a")
opt.clipboard:append("unnamedplus") -- allow copy pasting inside and outside vim
opt.modifiable = true
opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkoiiin250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"      -- buffer enconding
opt.showmode = true         -- show visual, edit, command mode

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99 -- unfold all by default
