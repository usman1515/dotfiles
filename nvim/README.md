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
1.  [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
2.  [neoconf.nvim](https://github.com/folke/neoconf.nvim) - plugin to manage global and project-local settings
3.  [neodev.nvim](https://github.com/folke/neodev.nvim) - setup for init.lua and plugin development
4.  [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - basic lua functionality
5.  [vim-tmux-navigator](https;//github.com/christoomey/vim-tmux-navigator) - tmux window navigation
6.  [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - file tree explorer
7.  [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - used for proper rendering and multiple views
8.  [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - file icons
9.  [whichkey](https://github.com/folke/which-key.nvim) - shortcut hints
10. [telescope](https://github.com/nvim-telescope/telescope.nvim) - fuzzy finder
11. [alpha-nvim](https://github.com/goolord/alpha-nvim) - fancy startup screen
12. [auto-session](https://github.com/rmagatti/auto-session) - session management
13. [bufferline](https://github.com/akinsho/bufferline.nvim) - better looking buffers
14. [lualine](https://github.com/nvim-lualine/lualine.nvim) - prettier status line
15. [dressing.nvim](https://github.com/stevearc/dressing.nvim) - improve the default vim.ui interfaces
16. [vim-maximizer](https://github.com/szw/vim-maximizer) - maximize a split
17. [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - syntax highlighting
18. [nvim-ts-autotags](https://github.com/windwp/nvim-ts-autotag) - HTML autopair completion
19. [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - indentation UI
20. [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - autocompletion
21. [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words
22. [cmp-buffer](https://github.com/hrsh7th/cmp-paths) - nvim-cmp source for paths
23. [cmp-buffer](https://github.com/hrsh7th/cmp-cmdline) - nvim-cmp source for cmdline
24. [luasnip](https://github.com/L3MON4D3/LuaSnip) - snippet engine
25. [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion
26. [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - preconfigured snippets
27. [lspkind.nvim](https://github.com/onsails/lspkind.nvim) - vscode like pictograms
28. [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - autopairs for neovim
29. [comment.nvim](https://github.com/numToStr/Comment.nvim) - commenting
30. [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - treesitter plugin for setting the comment string
31. [todo-comments](https://github.com/folke/todo-comments.nvim) - TODO commenting
32. [nvim-surround](https://github.com/kylechui/nvim-surround) - add, remove, replace delimiters
33. [substitute](https://github.com/gbprod/substitute.nvim) - operators motions to replace text
34. [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) - rainbow parantheses
35. [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - git integration for buffers
36. [lazygit](https://github.com/jesseduffield/lazygit) - lazygit integration in nvim


## 4. Colorschemes
1.  [vim-nightfly-colors](https://github.com/bluz71/vim-nightfly-colors)
2.  [material.nvim](https://github.com/marko-cerovac/material.nvim)
3.  [tokyonight](https://github.com/folke/tokyonight.nvim)
4.  [nightfox](https://github.com/EdenEast/nightfox.nvim)
5.  [sonokai](https://github.com/sainnhe/sonokai)

