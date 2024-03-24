" =============================================================================
" =================================================================== Settings
" =============================================================================

set encoding=UTF-8
set termguicolors   " enable true colors support
set nocompatible    " disable compatibility with vi

colorscheme elflord " current theme

filetype on         " enable type file detection.
filetype plugin on  " enable and load plugins for any file type.
filetype indent on  " load an indented file for any file type.
syntax on           " turn syntax highlighting on.
set showmatch       " highlight matching brace.


" enable relative line numbers in normal mode.
" absolute line numbers in insert mode.
set number          " add absolute line numbers.
" set relativenumber  " add relative line numbers
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END


set cursorline      " highlight current line.
" set cursorcolumn    " highlight current cursor column.

set autoindent      " auto-indent new lines
set expandtab       " use spaces instead of tabs
set smartindent	    " enable smart-indent
set smarttab	    " enable smart-tabs
set softtabstop=4	" number of space per tab.
set shiftwidth=4    " set shift width to N spaces.
set tabstop=4       " set tab width to N columns.

set nobackup        " dont save backup files.
set updatetime=100  " controls delay before vim writes to swap.
set scrolloff=10    " scroll line limit.
set nowrap          " disable wrapping lines.

set incsearch       " incrementally highlight matching characters while searching.
set ignorecase      " ignore capital letters during search.
set smartcase       " override the ignorecase option if searching for capital letters.
set showmatch       " show matching words during a search.
set hlsearch        " use highlighting when doing a search.

set showcmd         " show partial command you type in the last line of the screen.
set showmode        " show curent mode on the last line.
set history=10000   " set commands to save in history (default=20).

set wildmenu        " enable auto completion menu after pressing TAB.
set wildmode=list:longest   " Make wildmenu behave like similar to Bash completion.

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" =============================================================================
" =================================================================== Keymaps
" =============================================================================

" mapping syntax: map_mode <what_you_type> <what_is_executed>
" nnoremap - map keys in normal mode
" inoremap - map keys in insert mode
" vnoremap - map keys in visual mode

let mapleader = " "     " map leader key to spacebar

inoremap jk <esc>       " map Esc key to jk

" Pane navigation: Ctrl up/down/right/left
nnoremap <C-up> <C-w>k      " navigate up
nnoremap <C-down> <C-w>j    " navigate down
nnoremap <C-left> <C-w>h    " navigate left
nnoremap <C-right> <C-w>l   " navigate right

" Pane creation
nnoremap <leader>sv <C-w>v      " split window vertically
nnoremap <leader>sh <C-w>s      " split window horizontally
nnoremap <leader>se <C-w>=      " make split window width equal
nnoremap <leader>sx :close<CR>  " close current split window

" Pane resizing: Ctrl h/j/k/l
noremap <C-j> <c-w>-
noremap <C-k> <c-w>+
noremap <C-h> <c-w><
noremap <C-l> <c-w>>

" Buffer navgation:
nnoremap <leader>bn :bnext<CR>      " go to next buffer
nnoremap <leader>bp :bprevious<CR>  " go to previous buffer
nnoremap <leader>b0 :bfirst<CR>     " go to first buffer
nnoremap <leader>b$ :blast<CR>      " go to last buffer
nnoremap <leader>bx :bd<CR>         " close current buffer

" Tab creation
noremap <leader>to :tabnew<CR>      " open new tab
noremap <leader>tx :tabclose<CR>    " close current tab

" Tab navigation
noremap <leader>tn :tabn<CR>        " go to next tab
noremap <leader>tp :tabp<CR>        " go to previous tab
noremap <leader>t0 :tabfirst<CR>    " go to first tab
noremap <leader>t$ :tablast<CR>     " go to last tab

" Toggle nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

" Jumping between git hunks
nmap ]h <Plug>(GitGutterNextHunk)   " jump to next hunk
nmap [h <Plug>(GitGutterPrevHunk)   " jump to previous hunk
