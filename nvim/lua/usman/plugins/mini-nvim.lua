vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })



local ok, _ = pcall(require, "mini.bracketed")
if not ok then
    vim.notify("mini.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

-- load specific modules only to enable their functionality
-- INFO: mini.animate - animated common neovim sections
-- require('mini.animate').setup({})

-- INFO: mini.bracketed - navigate using square brackets
require('mini.bracketed').setup({
    buffer     = { suffix = 'b', options = {} },
    -- comment    = { suffix = 'c', options = {} },
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

-- require('mini.bufremove').setup({})     -- close buffers while preserving layout
-- use mini.clue or snacks.which-key

-- INFO: mini.clue - show next keypress clues
require('mini.clue').setup({
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

-- INFO: mini.cursorword - automatic highlighting of word under cursor
require('mini.cursorword').setup({})

-- INFO: mini.diff - git integration for buffers and hunks
-- require('mini.diff').setup({
--     -- Options for how hunks are visualized
--     view = {
--         -- Visualization style. Possible values are 'sign' and 'number'.
--         -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
--         style = vim.go.number and 'number' and 'sign',
--         -- Signs shown in the sign column
--         -- signs = { add = '▒', change = '▒', delete = '' },      -- mini.diff symbols
--         signs = { add = '┃', change = '┃', delete = '' },   -- gitsigns symbols
--         -- Priority of used visualization extmarks
--         priority = 199,
--     },
--     -- Source(s) for how reference text is computed/updated/etc
--     -- Uses content from Git index by default
--     source = nil,
--     -- Delays (in ms) defining asynchronous processes
--     delay = {
--         -- How much to wait before update following every text change
--         text_change = 200,
--     },
--     -- Module mappings. Use `''` (empty string) to disable one.
--     -- Replaced default mini.diff keymaps with gitsigns.nvim keymaps.
--     mappings = {
--         -- Apply hunks inside a visual/operator region
--         apply       = '<leader>hs',
--         -- Reset hunks inside a visual/operator region
--         reset       = '<leader>hr',
--         -- Hunk range textobject to be used inside operator
--         textobject  = 'ih',
--         -- Go to hunk range in corresponding direction
--         goto_first  = '[C',
--         goto_prev   = '[c',
--         goto_next   = ']c',
--         goto_last   = ']C',
--     },
--     -- Various options
--     options = {
--         -- Diff algorithm. See `:h vim.diff()`.
--         algorithm = 'histogram',
--         -- Whether to use "indent heuristic". See `:h vim.diff()`.
--         indent_heuristic = true,
--         -- The amount of second-stage diff to align lines
--         linematch = 60,
--         -- Whether to wrap around edges during hunk navigation
--         wrap_goto = false,
--     },
-- })
--
-- -- mini.diff - custom colors for MiniDiff signs (similar to Gitsigns)
-- local function set_minidiff_colors()
--     vim.api.nvim_set_hl(0, "MiniDiffSignAdd",    { fg = "#90ee90", bg = "NONE" })    -- Light green
--     vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#87cefa", bg = "NONE" })    -- Light blue
--     vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#ff0000", bg = "NONE" })    -- Red
-- end
-- set_minidiff_colors()
-- -- mini.diff - ensure colors persist for MiniDiff after color scheme changes
-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "*",
--     callback = set_minidiff_colors,
-- })

-- INFO: mini.icons - icon set
require('mini.icons').setup({})

-- require('mini.indentscope').setup({})       -- animated vertical tab line

-- INFO: mini.pairs - bracket autopairing
require('mini.pairs').setup({})

-- require('mini.sessions').setup({            -- session management
--     directory = vim.fn.stdpath('data') .. '/sessions/',
--     autoload_mode = 'disabled',  -- We'll manually save/load sessions via keymaps
--     autoread = true,
-- })
-- -- Save the current session
-- vim.keymap.set('n', '<leader>ws', function()
--     local session_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
--     require('mini.sessions').write(session_name)
-- end, { desc = 'Save session for current project' })
-- -- Load the last session
-- vim.keymap.set('n', '<leader>wr', function()
--     local session_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
--     require('mini.sessions').read(session_name)
-- end, { desc = 'Load session for current project' })

-- INFO: mini.starter - fast and flexible start screen
local ok_starter, starter = pcall(require, 'mini.starter')
if not ok_starter then
    vim.notify("mini.starter not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

starter.setup({
    -- No need to copy this inside `setup()`. Will be used automatically. Whether to open starter
    -- buffer on VimEnter. Not opened if Neovim was started with intent to show something else.
    autoopen = true,
    -- Whether to evaluate action of single active item
    evaluate_single = true,
    -- Items to be displayed. Should be an array with the following elements:
    items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(10, false),   -- recent files (global)
        starter.sections.recent_files(10, true),    -- recent files (current dir)
        -- Use this if you set up 'mini.sessions'
        -- starter.sections.sessions(5, true)
    },
    -- Header to be displayed before items. Converted to single string via `tostring` (use `\n` to
    -- display several lines).
    header = table.concat({
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        -- "▗▖  ▗▖▗▄▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▖  ▗▖",
        -- "▐▛▚▖▐▌▐▌   ▐▌ ▐▌▐▌  ▐▌  █  ▐▛▚▞▜▌",
        -- "▐▌ ▝▜▌▐▛▀▀▘▐▌ ▐▌▐▌  ▐▌  █  ▐▌  ▐▌",
        -- "▐▌  ▐▌▐▙▄▄▖▝▚▄▞▘ ▝▚▞▘ ▗▄█▄▖▐▌  ▐▌",
    }, "\n"),
    -- Footer to be displayed after items. Converted to single string via `tostring` (use `\n` to
    -- display several lines).
    footer = nil,
    -- Array of functions to be applied consecutively to initial content. Each function should take
    -- and return content for 'Starter' buffer (see |mini.starter| and |MiniStarter.content| for
    -- more details).
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.aligning('center', 'center'),  -- ADD: center horizontally and vertically
        starter.gen_hook.padding(3, 2),
    },
    -- Characters to update query. Each character will have special buffer mapping overriding your
    -- global ones. Be careful to not add `:` as it allows you to go into command mode.
    query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
    -- Whether to disable showing non-error feedback
    silent = false,
})

-- INFO: mini.surround - add, remove, replace delimiters
require('mini.surround').setup({
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

-- INFO: mini.tabline - tabline showing listed buffers
require('mini.tabline').setup({
    -- Whether to show file icons (requires 'mini.icons')
    show_icons = true,
    -- Vim's settings for tabline (make it always shown and allow hidden buffers)
    set_vim_settings = true,
    -- Where to show tabpage section in case of multiple vim tabpages. Options: left, right, none.
    tabpage_section = 'left',
    -- Customize the tabline format
    format = function(buf_id, label)
        -- guard against nil or empty label during plugin install prompts
        if not label or label == '' then return '' end
        -- Get the buffer number
        local buf_num = vim.api.nvim_buf_get_number(buf_id)
        -- Get the buffer icon from mini.icons, safely
        local ok, icon = pcall(require('mini.icons').get, 'file', label)
        if not ok then icon = '' end
        -- Format the string with icon, buffer number, and label
        return string.format(' %s %d %s ', icon, buf_num, label)
    end
})

-- INFO: mini.trailspace - trim all trailing whitespaces
require('mini.trailspace').setup({})
