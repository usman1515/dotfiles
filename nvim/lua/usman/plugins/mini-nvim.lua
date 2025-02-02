return {
    'echasnovski/mini.nvim',
    version = '*',      -- stable
    event = 'VeryLazy',
    -- dependencies = {
    --     "nvim-tree/nvim-web-devicons",
    -- },
    config = function()
        -- load specific modules only to enable their functionality
        -- require('mini.animate').setup({})       -- animated common neovim sections
        require('mini.bracketed').setup({       -- navigate using square brackets
            buffer     = { suffix = 'b', options = {} },
            comment    = { suffix = 'c', options = {} },
            conflict   = { suffix = 'x', options = {} },
            diagnostic = { suffix = 'd', options = {} },
            file       = { suffix = 'f', options = {} },
            indent     = { suffix = 'i', options = {} },
            jump       = { suffix = 'j', options = {} },
            location   = { suffix = 'l', options = {} },
            oldfile    = { suffix = 'o', options = {} },
            quickfix   = { suffix = 'q', options = {} },
            treesitter = { suffix = 't', options = {} },
            undo       = { suffix = 'u', options = {} },
            window     = { suffix = 'w', options = {} },
            yank       = { suffix = 'y', options = {} },
        })
        require('mini.bufremove').setup({})     -- close buffers while preserving layout
        require('mini.clue').setup({            -- show next keypress clues
            -- Array of extra clues to show
            clues = {},
            -- Array of opt-in triggers which start custom key query process.
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },
                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },
                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },
                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },
                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },
                -- Window commands
                { mode = 'n', keys = '<C-w>' },
                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },
            -- Clue window settings
            window = {
                -- Floating window config
                config = {},
                -- Delay before showing clue window
                delay = 100,
                -- Keys to scroll inside the clue window
                scroll_down = '<C-d>',
                scroll_up = '<C-u>',
            },
        })
        require('mini.comment').setup({})           -- code commenting
        require('mini.completion').setup({})        -- autocompeltion and signature help
        require('mini.cursorword').setup({})        -- automatic highlighting of word under cursor
        require('mini.icons').setup({})             -- icon set
        require('mini.indentscope').setup({})       -- animated vertical tab line
        require('mini.pairs').setup({})             -- bracket autopairing
        require('mini.surround').setup({            -- add, remove, replace delimiters
            -- Add custom surroundings to be used on top of builtin ones. For more information with
            -- examples, see `:h MiniSurround.config`.
            custom_surroundings = nil,
            -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
            highlight_duration = 500,
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                add = 'sa',             -- Add surrounding in Normal and Visual modes
                delete = 'sd',          -- Delete surrounding
                find = 'sf',            -- Find surrounding (to the right)
                find_left = 'sF',       -- Find surrounding (to the left)
                highlight = 'sh',       -- Highlight surrounding
                replace = 'sr',         -- Replace surrounding
                update_n_lines = 'sn',  -- Update `n_lines`
                suffix_last = 'l',      -- Suffix to search with "prev" method
                suffix_next = 'n',      -- Suffix to search with "next" method
            },
            -- Number of lines within which surrounding is searched
            n_lines = 20,
            -- Whether to respect selection type:
            -- - Place surroundings on separate lines in linewise mode.
            -- - Place surroundings on each line in blockwise mode.
            respect_selection_type = false,
            -- How to search for surrounding (first inside current line, then inside neighborhood). One
            -- of 'cover', 'cover_or_next', 'cover_or_prev', 'cover_or_nearest', 'next', 'prev',
            -- 'nearest'. For more details, see `:h MiniSurround.config`.
            search_method = 'cover',
            -- Whether to disable showing non-error feedback This also affects (purely informational)
            -- helper messages shown after idle time if user input is required.
            silent = false,
        })
        require('mini.tabline').setup({             -- tabline showing listed buffers
            -- Whether to show file icons (requires 'mini.icons')
            show_icons = true,
            -- Vim's settings for tabline (make it always shown and allow hidden buffers)
            set_vim_settings = true,
            -- Where to show tabpage section in case of multiple vim tabpages. Options: left, right, none.
            tabpage_section = 'left',
            -- Customize the tabline format
            format = function(buf_id, label)
                -- Get the buffer number
                local buf_num = vim.api.nvim_buf_get_number(buf_id)
                -- Get the buffer icon from mini.icons
                local icon = require('mini.icons').get('file', label)
                -- Format the string with icon, buffer number, and label
                return string.format(' %s %d %s ', icon, buf_num, label)
            end
        })
        require('mini.trailspace').setup({})        -- trim all trailing whitespaces
    end
}

