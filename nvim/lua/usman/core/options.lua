-- Tab / Indentation
vim.opt.tabstop = 4             -- set number of spaces for a tab
vim.opt.shiftwidth = 4          -- spaces for each level of indentation
vim.opt.softtabstop = 4         -- how many spaces is a tab in insert mode
vim.opt.expandtab = true        -- coverts tabs to spaces
vim.opt.autoindent = true       -- use indent from previosu line
vim.opt.smartindent = true      -- insert smart indent tabs
vim.opt.cindent = true          -- configurable to different indent styles
vim.opt.wrap = true             -- set line wrapping around long lines
vim.opt.textwidth = 100         -- enable line wrapping after N char
vim.opt.wrapmargin = 2          -- move to the next line N char before margin.

-- netrw
vim.g.netrw_banner = 0          -- remove annoying banner for netrw
vim.g.netrw_browse_split=4      -- open in prior window
vim.g.netrw_altv = 1            -- change from left splitting to right splitting
vim.g.netrw_liststyle=3         -- tree style view in netrw

-- Search
vim.opt.incsearch = true        -- show word matches live
vim.opt.inccommand = "split"    -- show live preview of substitutions
vim.opt.ignorecase = true       -- ignore case when searching
vim.opt.smartcase = true        -- assumes you want case sensitive
vim.opt.hlsearch = false
vim.opt.path:append("**")       -- recursively search $PWD

-- Appearance
vim.opt.relativenumber = true   -- relative line numbres
vim.opt.number = true           -- insert line numbers
vim.opt.termguicolors = true    -- full color support
vim.opt.background = "dark"     -- dark background will have preference if available
vim.opt.colorcolumn = "100"     -- insert line at 100 column
vim.opt.signcolumn = "yes"      -- show sign colum so that text doesnt shift
vim.opt.cursorline = true       -- highlight the current cursor line
vim.opt.cmdheight = 2           -- command height
vim.opt.scrolloff = 10          -- start scrolling when you hit the last 10 lines
vim.opt.showtabline = 2         -- always show the tab line
vim.opt.laststatus = 2          -- always show statusline
vim.opt.completeopt = "menuone,noinsert,noselect" -- autocompletion setting

-- Behaviour
vim.opt.hidden = true
vim.opt.errorbells = false      -- turn off bells
vim.opt.swapfile = false        -- dont create swap files
vim.opt.backup = false          -- dont create bakup files
vim.opt.undofile = true         -- make an undo file available
vim.opt.splitright = true       -- new panes added on right
vim.opt.splitbelow = true       -- new panes added on bottom
vim.opt.autochdir = false       -- dont automatically change dirs
vim.opt.iskeyword:append("-")   -- words with - is a whole word
vim.opt.title = true            -- show title
vim.opt.titlestring = "%t (%{expand(\"%:p:h\")}) - NVIM" -- show title = NVIM
vim.opt.syntax = "ON"           -- enable syntax highlighting
vim.opt.compatible = false      -- turn OFF vi compatiblity mode
vim.opt.mouse = 'a'             -- enable the mouse in all modes
vim.opt.modifiable = true       -- buffers can be edited
vim.opt.fileencoding = "UTF-8"  -- encoding for saved files
vim.opt.encoding = "UTF-8"      -- internal buffer encoding
vim.opt.showmode = true         -- show visual, edit, command mode
vim.opt.showcmd = true          -- show commands


vim.opt.undodir = vim.fn.expand("~/.vim/undodir")   -- undo file dir
vim.opt.backspace = "indent,eol,start"              --  backspace key behaviour
vim.opt.clipboard:append("unnamedplus")             -- allow copy pasting inside and outside vim

vim.opt.isfname:append("@-@")   -- treat '@' and '-' as part of a filename
vim.opt.updatetime = 50         -- reduce delay before triggering CursorHold and diagnostic updates
vim.g.editorconfig = true       -- enable built-in EditorConfig support in Neovim

-- nvim-treesitter folding setup
vim.opt.foldmethod = "expr"                     -- use expression-based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- use nvim-treesitter to determine folds
vim.opt.foldlevel = 99                          -- start with all folds open

