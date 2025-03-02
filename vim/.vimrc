colorscheme slate

" ---------------- Tab / Indentation ---------------- "
set tabstop=4               " Set number of spaces for a tab
set shiftwidth=4            " Spaces for each level of indentation
set softtabstop=4           " How many spaces a tab represents in insert mode
set expandtab               " Converts tabs to spaces
set autoindent              " Use indent from previous line
set smartindent             " Insert smart indent tabs
set smarttab                " Enable smart tabs
set cindent                 " Configurable to different indent styles
set wrap                    " Enable line wrapping
set textwidth=100           " Wrap lines after 100 characters
set wrapmargin=2            " Move to the next line 2 chars before margin

" ---------------- Appearance ---------------- "
" enable relative line numbers in normal mode. absolute line numbers in insert mode.
set number                  " Show absolute line numbers
" set relativenumber          " Show relative line numbers
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set termguicolors           " Enable full color support
set background=dark         " Prefer dark background
set colorcolumn=100         " Highlight column at 100 characters
set signcolumn=yes          " Keep sign column always visible
set cursorline              " Highlight the current cursor line
" set cursorcolumn            " Highlight curretn cursor column
set cmdheight=2             " Increase command-line height
set scrolloff=10            " Keep at least 10 lines visible above/below
set showtabline=2           " Always show tabline
set laststatus=2            " Always show status line
set completeopt=menuone,noinsert,noselect  " Better completion experience

" ---------------- Behaviour ---------------- "
set hidden                  " Allow hidden buffers
set noerrorbells            " Disable error bells
set noswapfile              " Disable swap files
set nobackup                " Disable backup files
set undofile                " Enable persistent undo
set splitright              " Open new vertical splits to the right
set splitbelow              " Open new horizontal splits below
set noautochdir             " Do not auto-change directory
set iskeyword+=-            " Treat words with '-' as a single word
syntax enable               " Enable syntax highlighting
set nocompatible            " Disable Vi compatibility mode
set mouse=a                 " Enable mouse support
set modifiable              " Allow modifying buffers
set fileencoding=UTF-8      " Default file encoding for saved files
set encoding=UTF-8          " Internal Vim buffer encoding
set showmode                " Display current mode (Insert, Normal, etc.)
set showcmd                 " Show partial command in the bottom bar
set showmatch               " Highlight matching braces
filetype on                 " Enable file type detection
filetype plugin on          " Enable and load plugins for any file type
filetype indent on          " Load an indented file for any file type

" ---------------- Search ---------------- "
set incsearch               " Incremental search
set ignorecase              " Ignore case when searching
set smartcase               " Enable smart case-sensitive search
set nohlsearch              " Disable search highlight
set path+=**                " Recursively search in current directory
set wildmenu                " Completion options displayed horizontally
set wildmode=list:longest   " Make wildmenu behave like similar to Bash completion.

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" ---------------- netrw ---------------- "
let g:netrw_banner = 0          " Remove annoying banner for netrw
let g:netrw_browse_split = 4    " Open in prior window
let g:netrw_altv = 0            " Open vertical splits to the left
let g:netrw_liststyle = 3       " Tree style view in netrw
let g:netrw_fastbrowse = 0      " autoclose netrw when opening a file
let g:netrw_winsize = 25        " set custom width for netrw
autocmd VimEnter * :Vex         " make netrw look like a sidebar

" let g:netrw_list_hide=netrw_gitignore#Hide()    " hide files listed in .gitignore
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'  " hide dotfiles

" ---------------- Undo and Clipboard ---------------- "
set undodir=~/.vim/undodir      " Directory for undo history
set backspace=indent,eol,start  " Enable proper backspace behavior
set clipboard+=unnamedplus      " Enable system clipboard integration

" ---------------- Vim Plug Plugins ---------------- "

