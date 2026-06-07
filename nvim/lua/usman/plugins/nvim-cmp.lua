-- nvim-cmp is the main autocompletion engine for Neovim.
vim.pack.add({
    { src = "https://github.com/hrsh7th/nvim-cmp" },                -- main completion engine
    { src = "https://github.com/hrsh7th/cmp-buffer" },              -- source for text in buffer
    { src = "https://github.com/hrsh7th/cmp-path" },                -- source for file system paths
    { src = "https://github.com/hrsh7th/cmp-cmdline" },             -- source for vim's cmdline
    { src = "https://github.com/L3MON4D3/LuaSnip" },                -- snippet engine
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },        -- for autocompletion
    { src = "https://github.com/rafamadriz/friendly-snippets" },    -- useful snippets
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- syntax highlighting
    { src = "https://github.com/onsails/lspkind.nvim" },            -- vs-code like pictograms
})



--  LuaSnip build step — compiles jsregexp which enables regex-based snippet transformations
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "LuaSnip" then
            vim.system(
                { "make", "install_jsregexp" },
                { cwd = ev.data.path },
                function(result)
                    if result.code == 0 then
                        vim.notify("LuaSnip built successfully", vim.log.levels.INFO)
                    else
                        vim.notify("LuaSnip build failed:\n" .. result.stderr, vim.log.levels.ERROR)
                    end
                end
            )
        end
    end,
})

local ok, cmp = pcall(require, "cmp")
if not ok then
    vim.notify("nvim-cmp not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

-- luasnip is the snippet engine that nvim-cmp uses to expand snippets.
local has_luasnip, luasnip = pcall(require, 'luasnip')
-- lspkind adds VS Code-style icons to the completion dropdown to visually identify what type each
-- suggestion is.
local lspkind = require("lspkind")

-- nvim_replace_termcodes converts key sequences like '<Tab>' or '<BS>'
-- into the actual byte sequences Neovim understands internally.
local rhs = function(keys)
    return vim.api.nvim_replace_termcodes(keys, true, true, true)
end

-- custom icons for LSP suggestions
lsp_kinds = {}
-- lsp_kinds = {
--     Text = "󰉿",
--     Method = "󰆧",
--     Function = "󰊕",
--     Constructor = "",
--     Field = "󰜢",
--     Variable = "󰀫",
--     Class = "󰠱",
--     Interface = "",
--     Module = "",
--     Property = "󰜢",
--     Unit = "󰑭",
--     Value = "󰎠",
--     Enum = "",
--     Keyword = "󰌋",
--     Snippet = "",
--     Color = "󰏘",
--     File = "󰈙",
--     Reference = "󰈇",
--     Folder = "󰉋",
--     EnumMember = "",
--     Constant = "󰏿",
--     Struct = "󰙅",
--     Event = "",
--     Operator = "󰆕",
--     TypeParameter = "",
-- }

-- Used by the smart tab/backspace functions below to figure out where the cursor is on the current line.
local column = function()
    local _line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col
end

-- checks whether the cursor is currently inside an active LuaSnip snippet.
-- Used to decide whether Tab/Shift-Tab should jump between snippet placeholders instead of
-- navigating the completion menu.
local in_snippet = function()
    local session = require('luasnip.session')
    local node = session.current_nodes[vim.api.nvim_get_current_buf()]
    if not node then
        return false
    end
    local snippet = node.parent.snippet
    local snip_begin_pos, snip_end_pos = snippet.mark:pos_begin_end()
    local pos = vim.api.nvim_win_get_cursor(0)
    if pos[1] - 1 >= snip_begin_pos[1] and pos[1] - 1 <= snip_end_pos[1] then
        return true
    end
end

-- returns true if the cursor is at column 0 (start of line) or sitting on a whitespace character.
-- Used to decide whether Tab should insert whitespace or trigger completion. returns true if the
-- cursor is in leftmost column or at a whitespace char
local in_whitespace = function()
    local col = column()
    return col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')
end

-- returns true if everything to the left of the cursor on the current line is only whitespace (i.e.
-- the cursor is inside the leading indentation).
-- Used to decide whether Shift-Tab should dedent instead of going to prev item.
local in_leading_indent = function()
    local col = column()
    local line = vim.api.nvim_get_current_line()
    local prefix = line:sub(1, col)
    return prefix:find('^%s*$')
end

-- returns the effective tab width.
-- Prefers softtabstop if set, otherwise falls back to shiftwidth. Used by smart_tab to calculate
-- how many spaces to insert to reach the next tab stop. custom shift width
local shift_width = function()
    if vim.o.softtabstop <= 0 then
        return vim.fn.shiftwidth()
    else
        return vim.o.softtabstop
    end
end

-- smart_bs handles the Backspace key intelligently.
local smart_bs = function(dedent)
    local keys = nil
    if vim.o.expandtab then
        if dedent then
            keys = rhs('<C-D>')
        else
            keys = rhs('<BS>')
        end
    else
        local col = column()
        local line = vim.api.nvim_get_current_line()
        local prefix = line:sub(1, col)
        if in_leading_indent() then
            keys = rhs('<BS>')
        else
            local previous_char = prefix:sub(#prefix, #prefix)
            if previous_char ~= ' ' then
                keys = rhs('<BS>')
            else
                keys = rhs('<C-\\><C-o>:set expandtab<CR><BS><C-\\><C-o>:set noexpandtab<CR>')
            end
        end
    end
    vim.api.nvim_feedkeys(keys, 'nt', true)
end

-- smart_tab handles the Tab key intelligently.
local smart_tab = function(opts)
    local keys = nil
    if vim.o.expandtab then
        keys = '<Tab>' -- Neovim will insert spaces.
    else
        local col = column()
        local line = vim.api.nvim_get_current_line()
        local prefix = line:sub(1, col)
        local in_leading_indent = prefix:find('^%s*$')
        if in_leading_indent then
            -- inserts a hard tab.
            keys = '<Tab>'
        else
            local sw = shift_width()
            local previous_char = prefix:sub(#prefix, #prefix)
            local previous_column = #prefix - #previous_char + 1
            local current_column = vim.fn.virtcol({ vim.fn.line('.'), previous_column }) + 1
            local remainder = (current_column - 1) % sw
            local move = remainder == 0 and sw or sw - remainder
            keys = (' '):rep(move)
        end
    end

    vim.api.nvim_feedkeys(rhs(keys), 'nt', true)
end

-- these two functions move up/down in the completion menu if it is visible, or fall back to the
-- default key behaviour if it is not.
local select_next_item = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    else
        fallback()
    end
end

local select_prev_item = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

-- NOTE: Until https://github.com/hrsh7th/nvim-cmp/issues/1716
-- (cmp.ConfirmBehavior.MatchSuffix) gets implemented, use this local wrapper
-- to choose between `cmp.ConfirmBehavior.Insert` and `cmp.ConfirmBehavior.Replace`:
-- By default nvim-cmp has two behaviours when you accept a suggestion:
-- - Replace: replaces the whole word under the cursor with the suggestion.
-- - Insert:  inserts the suggestion at the cursor without deleting what's after it.
-- This function inspects the suggestion text and what's currently after the cursor.
-- If they match (i.e. the suffix of the new text matches what comes after the cursor),
-- it uses Replace. Otherwise it falls back to Insert to avoid deleting existing text.
local confirm = function(entry)
    local behavior = cmp.ConfirmBehavior.Replace
    if entry then
        local completion_item = entry.completion_item
        local newText = ''
        if completion_item.textEdit then
            newText = completion_item.textEdit.newText
        elseif type(completion_item.insertText) == 'string' and completion_item.insertText ~= '' then
            newText = completion_item.insertText
        else
            newText = completion_item.word or completion_item.label or ''
        end

        -- checks how many characters will be different after the cursor position if we replace?
        local diff_after = math.max(0, entry.replace_range['end'].character + 1) - entry.context.cursor.col

        -- does the text that will be replaced after the cursor match the suffix of the
        -- `newText` to be inserted ? if not, then `Insert` instead.
        if entry.context.cursor_after_line:sub(1, diff_after) ~= newText:sub(-diff_after) then
            behavior = cmp.ConfirmBehavior.Insert
        end
    end
    cmp.confirm({ select = true, behavior = behavior })
end

-- loads all VS Code-style snippets from installed plugins.
require("luasnip.loaders.from_vscode").lazy_load()

-- configure nvim cmp
cmp.setup({
    experimental = {
        -- HACK: experimenting with ghost text. look at `toggle_ghost_text()` function below.
        ghost_text = false,
    },
    completion = {
        -- completeopt controls how the completion menu behaves.
        -- menu: show a popup menu.
        -- menuone: show menu even with one result.
        -- noinsert: don't auto-insert until you explicitly confirm.
        completeopt = "menu,menuone,noinsert",
        -- completeopt = "menu,menuone,preview,noselect",
    },
    -- sets the border style for the completion and documentation popup windows.
    window = {
        documentation = {
            border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
        },
        completion = {
            border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
        }
    },
    -- tells nvim-cmp how to expand a snippet when one is selected.
    -- It hands the snippet body off to LuaSnip which then expands it and sets up the tab-jumpable
    -- placeholders.
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    -- autocompletion sources
    -- sources defines where completion suggestions come from, in priority order.
    -- nvim_lsp: suggestions from the language server (functions, variables, types).
    -- luasnip: snippet suggestions.
    -- buffer: words already present in the current buffer.
    -- path: file system paths (useful when typing require() or file names).
    -- lazydev: Lua API completions for Neovim plugin development.
    -- tailwindcss-colorizer-cmp: color previews for Tailwind CSS classes.
    sources = cmp.config.sources({
        { name = "nvim_lsp"},   -- built in LSP
        { name = "luasnip" },   -- snippets
        { name = "buffer" },    -- text within current buffer
        { name = "path" },      -- file system paths
        { name = "lazydev" },
        { name = "tailwindcss-colorizer-cmp" },
    }),

    -- experimenting with Customized Mappings
    mapping = cmp.mapping.preset.insert({
        -- ['<BS>'] = cmp.mapping(function(_fallback)
        --     smart_bs()
        -- end, { 'i', 's' }),

        -- Ctrl-e closes the completion menu without confirming anything.
        ["<C-e>"] = cmp.mapping.abort(),
        -- Ctrl-d closes the documentation popup
        -- (the side window showing docs for the currently highlighted completion item).
        ['<C-d>'] = cmp.mapping(function()
            cmp.close_docs()
        end, { 'i', 's' }),

        -- Ctrl-f / Ctrl-b scroll the documentation popup up and down
        -- so you can read longer docs without leaving insert mode.
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        --  Ctrl-j/k and arrow keys move up and down through the menu items.
        ['<C-j>'] = cmp.mapping(select_next_item),
        ['<C-k>'] = cmp.mapping(select_prev_item),
        ['<Down>'] = cmp.mapping(select_next_item),
        ['<Up>'] = cmp.mapping(select_prev_item),

        -- Ctrl-y confirms the currently highlighted suggestion using
        -- the smart confirm() function defined above.
        ['<C-y>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                confirm(entry)
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- Enter confirms the suggestion the same way Ctrl-y does.
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                confirm(entry)
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- Shift-Tab behaviour (in priority order):
        -- 1. If menu is open: move to previous item.
        -- 2. If inside a snippet: jump to previous placeholder.
        -- 3. If in leading indent: dedent the line.
        -- 4. If on whitespace: smart backspace.
        -- 5. Otherwise: default behaviour.
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif has_luasnip and in_snippet() and luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif in_leading_indent() then
                smart_bs(true) -- true means to dedent
            elseif in_whitespace() then
                smart_bs()
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- Tab behaviour (in priority order):
        -- 1. If menu is open and only one item: confirm it immediately.
        -- 2. If menu is open with multiple items: move to next item.
        -- 3. If a snippet can be expanded or jumped: do that.
        -- 4. If on whitespace: insert smart tab/spaces.
        -- 5. Otherwise: open the completion menu.
        ['<Tab>'] = cmp.mapping(function(_fallback)
            if cmp.visible() then
                -- if there is only one completion candidate then use it.
                local entries = cmp.get_entries()
                if #entries == 1 then
                    confirm(entries[1])
                else
                    cmp.select_next_item()
                end
            elseif has_luasnip and luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif in_whitespace() then
                smart_tab()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),
    }),

    -- formatting controls how each item looks in the completion dropdown.
    -- It combines your custom lsp_kinds icons, menu source tags like [LSP] or
    -- [Buffer], and lspkind's VS Code icons. For LSP items it also calls
    -- colorizer to show color swatches for CSS/Tailwind color values.
    -- setup lspkind for vscode pictograms in autocompletion dropdown menu
    formatting = {
        format = function(entry, vim_item)
            -- Add custom lsp_kinds icons
            vim_item.kind = string.format('%s %s', lsp_kinds[vim_item.kind] or '', vim_item.kind)
            -- vim_item.kind = string.format('%s', lsp_kinds[vim_item.kind] or '', vim_item.kind)

            -- add menu tags (e.g., [Buffer], [LSP])
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]

            -- use lspkind and tailwindcss-colorizer-cmp for additional formatting
            vim_item = lspkind.cmp_format({
                maxwidth = 25,
                ellipsis_char = "...",
            })(entry, vim_item)

            if entry.source.name == "nvim_lsp" then
                vim_item = colorizer(entry, vim_item)
            end

            return vim_item
        end,
    },
})

-- toggle_ghost_text dynamically enables or disables inline ghost text based on what character is
-- immediately after the cursor.
-- Ghost text is only shown when the cursor is at the end of a word or at a non-keyword character
-- (space, punctuation, end of line). This prevents ghost text from appearing in the middle of a
-- word, which would look confusing and overlap with existing text.
-- Only show ghost text at word boundaries, not inside keywords. Based on idea
-- from: https://github.com/hrsh7th/nvim-cmp/issues/2035#issuecomment-2347186210

local config = require('cmp.config')
local toggle_ghost_text = function()
    if vim.api.nvim_get_mode().mode ~= 'i' then
        return
    end

    local cursor_column = vim.fn.col('.')
    local current_line_contents = vim.fn.getline('.')
    local character_after_cursor = current_line_contents:sub(cursor_column, cursor_column)

    local should_enable_ghost_text = character_after_cursor == '' or vim.fn.match(character_after_cursor, [[\k]]) == -1

    local current = config.get().experimental.ghost_text
    if current ~= should_enable_ghost_text then
        config.set_global({
            experimental = {
                ghost_text = should_enable_ghost_text,
            },
        })
    end
end

-- this autocmd fires every time you enter insert mode or move the cursor in insert mode, calling
-- toggle_ghost_text each time to keep ghost text in sync with the cursor position.
vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMovedI' }, {
    callback = toggle_ghost_text,
})
-- ! Ghost text stuff ! --

