-- :help options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

-- appearence
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.showmode = true                         -- we don't need to see things like -- INSERT -- anymore
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.signcolumn = "yes"                      --

-- line numbers
vim.opt.number = true                           -- set numbered lines
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.cursorcolumn = false                    -- highlight current cursor column.

-- tabs and spacing
vim.opt.autoindent = true                       -- auto-indent new lines
vim.opt.showtabline = 4                         -- always show tabs
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.softtabstop = 4                         -- number of spaces per tab
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab

vim.opt.updatetime = 100                        -- controls delay before vim writes to swap.
vim.opt.scrolloff = 10                          -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.wrap = false                            -- display lines as one long line

-- search settings
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore capital letters during search
vim.opt.smartcase = true                        -- override the ignorecase option if searching for capital letters
vim.opt.incsearch = true                        -- incrementally highlight matching characters while searching.

-- split windows
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window

-- mouse support
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim

-- wildmenu
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)

-- markdown
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files

-- pop up menus
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp

vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
