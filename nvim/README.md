# NeoVim

## 1. Delete previous cache and config
```bash
rm -rfv ~/.local/share/nvim
rm -rfv ~/.config/nvim
```

## 2. Install the following pre requisite packages

**Install pip package**
```bash
python3 -m pip install pynvim
```

**Fedora**
```bash
# copy paste
sudo dnf install -y xsel
# telescope
sudo dnf install -y ripgrep fzf fd-find
# LSPs
sudo dnf install -y nodejs
# lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit
# tmux
sudo dnf install -y tmux
```

**MacOS**
```bash
# copy paste
brew install pbcopy
# telescope
brew install ripgrep fzf fd
# LSPs
brew install nodejs
# lazygit
brew install jesseduffield/lazygit/lazygit
brew install lazygit
# tmux
brew install tmux
```

-	Browse your choice of colorscheme from [vim color schemes](https://vimcolorschemes.com).
-   To see all of the available options for `nvim/lua/config/options.lua` run `:set all`

## 3. Plugins Installed

| Plugin                                                                             | Info                                                        |
| :--------------------------------------------------------------------------------- | :---------------------------------------------------------- |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                    | Plugin manager                                              |
| [neoconf.nvim](https://github.com/folke/neoconf.nvim)                              | plugin to manage global and project-local settings          |
| [neodev.nvim](https://github.com/folke/neodev.nvim)                                | setup for init.lua and plugin development                   |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                           | basic lua functionality                                     |
| [auto-session](https://github.com/rmagatti/auto-session)                           | session management                                          |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                                | nvim-cmp source for buffer words                            |
| [cmp-paths](https://github.com/hrsh7th/cmp-paths)                                  | nvim-cmp source for paths                                   |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)                              | nvim-cmp source for cmdline                                 |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                         | luasnip completion                                          |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)               | preconfigured snippets                                      |
| [git-blame](https://github.com/f-person/git-blame.nvim)                            | git blame                                                   |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                             | git integration for buffers                                 |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)         | indentation UI                                              |
| [lazygit](https://github.com/jesseduffield/lazygit)                                | lazygit integration in nvim                                 |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim)                            | vscode like pictograms                                      |
| [lualine](https://github.com/nvim-lualine/lualine.nvim)                            | prettier status line                                        |
| [luasnip](https://github.com/L3MON4D3/LuaSnip)                                     | snippet engine                                              |
| [md-preview](https://github.com/iamcco/markdown-preview.nvim)                      | markdown preview plugin                                     |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)       | extension for mason.nvim                                    |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                           | install and manage LSP and DAP servers, linters, formatters |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                              | library of multiple independent modules.                    |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                    | autocompletion                                              |
| [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) | support for file operations using built-in LSP              |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                         | quickstart configs for nvim LSP                             |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)              | syntax highlighting                                         |
| [nvim-ts-autotags](https://github.com/windwp/nvim-ts-autotag)                      | HTML autopair completion                                    |
| [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)      | rainbow parantheses                                         |
| [snacks.nvim](https://github.com/folke/snacks.nvim)                                | collection of plugins.                                      |
| [todo-comments](https://github.com/folke/todo-comments.nvim)                       | TODO commenting                                             |
| [vim-maximizer](https://github.com/szw/vim-maximizer)                              | maximize a split                                            |
| [vim-tmux-navigator](https;//github.com/christoomey/vim-tmux-navigator)            | tmux nvim cross window navigation                           |
| [vimtex](https://github.com/lervag/vimtex)                                         | filetype and syntax plugin for LaTeX                        |

## 4. Colorschemes
1.  [vim-nightfly-colors](https://github.com/bluz71/vim-nightfly-colors)
2.  [material.nvim](https://github.com/marko-cerovac/material.nvim)
3.  [tokyonight](https://github.com/folke/tokyonight.nvim)
4.  [nightfox](https://github.com/EdenEast/nightfox.nvim)
5.  [sonokai](https://github.com/sainnhe/sonokai)
6.  [vim-moonfly-colors](https://github.com/bluz71/vim-moonfly-colors)
7.  [night-owl](https://github.com/oxfist/night-owl.nvim)