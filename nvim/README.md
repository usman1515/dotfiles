# NeoVim

## Installation
-   The following tools need to be installed before using this config.
-   Install pre requisite tools
    ```bash
    # install in MacOS
    brew install pbcopy ripgrep fzf fd

    # install in Linux
    sudo dnf install -y xsel ripgrep fzf fd-find
    ```
-	Install tmux
    ```bash
    # install in Linux
    sudo dnf install -y tmux

    # install in MacOS
    brew install tmux
    ```
    -   Configure tmux using the following [config](https://github.com/usman1515/dotfiles/tree/main/tmux).
-   Install Neovim
    ```bash
    # install in Linux
    sudo dnf install -y neovim

    # install in MacOS
    brew install neovim

    # remove previous cache and config
    rm -rf ~/.local/share/nvim
    rm -rf ~/.config/nvim
    ```
-	Install pip package
    ```bash
    python3 -m pip install pynvim
    ```

<!-- -   Install LSPs
    ```bash
    # install go compiler and LSP
    sudo dnf install go golang golang-go
    # install nodejs compiler and LSP
    sudo dnf install nodejs
    # install python compiler and LSP
    sudo dnf install python3
    # install lua compiler and LSP
    sudo dnf install lua luarocks
    ```
-   Install Linters and Formatters
    -   Open nvim and run the following command to install a linter/formatter: `MasonInstall <linter>`
    -   Or open mason and install step by step.
    ```bash
    shellcheck
    clangd-format
    cpplint
    cmakelang
    cmakelint
    gitlint
    jsonlint
    texlab
    luacheck
    stylua
    markdown-toc
    marksman
    markuplint
    pylint
    xmlformetter
    yamllint
    ``` -->

-	Browse your choice of colorscheme from [vim color schemes](https://vimcolorschemes.com).
-   To see all of the available options for `nvim/lua/config/options.lua` run `:set all`


## Plugins
1.  [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
2.  [whichkey](https://github.com/folke/which-key.nvim) - shortcut hints
3.  [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - file tree explorer
4.  [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - basic lua functionality
5.  [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - used for proper rendering and multiple views
6.  [nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) - prompts user to pick a window and return the window id
7.  [telescope](https://github.com/nvim-telescope/telescope.nvim) - fuzzy finder
8.  [comment.nvim](https://github.com/numToStr/Comment.nvim) - commenting
9.  [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - indentation UI
10. [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - syntax highlighting
11. [nvim-ts-autotags](https://github.com/windwp/nvim-ts-autotag) - HTML autopair completion
12. [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - autopairs for neovim
13. [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - file icons
14. [vim-illuminate](https://github.com/RRethy/vim-illuminate) - illuminates instances of word under cursor
15. [noice](https://github.com/folke/noice.nvim) - vim commandline UI
16. [nvim-notify](https://github.com/rcarriga/nvim-notify) - fancy, configurable, notification manager
17. [lualine](https://github.com/nvim-lualine/lualine.nvim) - Statusline
18. [transparent](https://github.com/xiyaowong/transparent.nvim) - Transparency
19. [dressing.nvim](https://github.com/stevearc/dressing.nvim) - improve the default vim.ui interfaces
20. [tmux-navigator](https;//github.com/christoomey/vim-tmux-navigator) - tmux window navigation
21. [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git status signs
22. [tailwindcss-colorizer-cmp](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim) - add vscode-style TailwindCSS completion
23. [trouble](https://github.com/folke/trouble.nvim) - diagnostics



<!-- 16. [mason](https://github.com/williamboman/mason.nvim) - LSP, DAP, linter, formatter installation manager -->
<!-- 17. [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - Better mason and lsp-config integration -->
<!-- 18. [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Language Server Protocol support -->
<!-- 19. [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs for neovim written in lua -->
<!-- 20. [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim) - Collection of linters and formatters configured for EFM LS -->
<!-- 21. [neoconf](https://github.com/folke/neoconf.nvim) - Manage global and project-local settings -->
<!-- 22. [efm-langserver](https://github.com/mattn/efm-langserver) - General purpose language server -->
<!-- 23. [lspsaga](https://github.com/nvimdev/lspsaga.nvim) - Enhanced LSP support -->




### Colorschemes
1.  [tokyonight](https://github.com/folke/tokyonight.nvim)
2.  [nightfox](https://github.com/EdenEast/nightfox.nvim)
3.  [vim-nightfly-colors](https://github.com/bluz71/vim-nightfly-colors?tab=readme-ov-file)
4.  [sonokai](https://github.com/sainnhe/sonokai)


<!-- ## References -->
<!-- -   [config 1](https://github.com/radleylewis/nvim) -->