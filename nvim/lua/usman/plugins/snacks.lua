return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    },
    opts = {
        -- your plugin configuration goes here
        animate = { enabled = true },       -- efficient animation library
        bigfile = {                         -- triggers when file is larger than configured size
            enabled = true,
            -- your bigfile configuration comes here
            notify = true, -- show notification when big file detected
            size = 1.5 * 1024 * 1024,   -- 1.5MB
            -- Enable or disable features when big file detected
            --- @param ctx {buf: number, ft:string}
            setup = function(ctx)
                if vim.fn.exists(":NoMatchParen") ~= 0 then
                    vim.cmd([[NoMatchParen]])
                end
                Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
                vim.b.minianimate_disable = true
                vim.schedule(function()
                    vim.bo[ctx.buf].syntax = ctx.ft
                end)
            end,
        },
        bufdelete = { enabled = true },     -- close buffers while preserving layout
        dashboard = {                       -- dashboard at startup
            enabled = true,
            -- your dashboard configuration comes here
            preset = {
                -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                pick = 'telescope.nvim',      -- nil
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1 },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
                { section = "startup" },
            },
        },
        explorer = {                        -- file tree explorer
            enabled = true,
            replace_netrw = true, -- replace netrw with snacks explorer
        },
        git = {                             -- git utilities
            enabled = true,
            -- your git configuration comes here
            width = 0.6,
            height = 0.6,
            border = "rounded",
            title = " Git Blame ",
            title_pos = "center",
            ft = "git",
        },
        image = {                           -- view images in nvim snacks.picker
            enabled = true,
            formats = {
                "png",
                "jpg",
                "jpeg",
                "svg",
                "gif",
                "bmp",
                "webp",
                "tiff",
                "heic",
                "avif",
            },
            force = false, -- try displaying the image, even if the terminal does not support it
            img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "figures" },
            -- window options applied to windows displaying image buffers
            -- an image buffer is a buffer with `filetype=image`
            wo = {
                wrap = false,
                number = false,
                relativenumber = false,
                cursorcolumn = false,
                signcolumn = "no",
                foldcolumn = "0",
                list = false,
                spell = false,
                statuscolumn = "",
            },
            -- store processed images in cache directory
            cache = vim.fn.stdpath("cache") .. "/snacks/image",
            debug = {
                request = false,
                convert = false,
                placement = false,
            },
            env = {},
            -- icons used to show where an inline image is located that is rendered below the text.
            icons = {
                math = "󰪚 ",
                chart = "󰄧 ",
                image = " ",
            },
            convert = {
                notify = true,      -- show a notification on error
                -- convert mermaid diagrams based on nvim theme
                mermaid = function()
                    local theme = vim.o.background == "light" and "neutral" or "dark"
                    return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
                end,
                -- imagemagick configuration
                magick = {
                    default = { "{src}[0]", "-scale", "1920x1080>" }, -- default for raster images
                    vector = { "-density", 192, "{src}[0]" }, -- used by vector images like svg
                    math = { "-density", 192, "{src}[0]", "-trim" },
                    pdf = { "-density", 192, "{src}[0]", "-background", "white", "-alpha", "remove", "-trim" },
                },
            },
            math = {
                enabled = false, -- enable math expression rendering
            },
        },
        indent = {                          -- visualize indent guides and scopes
            enabled = true, -- enable indent guides
            -- your indent configuration goes here
            indent = {
                priority = 1,
                char = "│", -- "┊" "▎" "│"
                only_scope = false, -- only show indent guides of the scope
                only_current = false, -- only show indent guides in the current window
                hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
                -- can be a list of hl groups to cycle through
                hl = {
                    "SnacksIndent1",
                    "SnacksIndent2",
                    "SnacksIndent3",
                    "SnacksIndent4",
                    "SnacksIndent5",
                    "SnacksIndent6",
                    "SnacksIndent7",
                    "SnacksIndent8",
                },
            },
            animate = {
                enabled = vim.fn.has("nvim-0.10") == 1,
                style = "out",
                easing = "linear",
                duration = {
                    step = 20, -- ms per step
                    total = 500, -- maximum duration
                },
            },
            scope = {
                enabled = true, -- enable highlighting the current scope
                priority = 200,
                char = "│",
                underline = false, -- underline the start of the scope
                only_current = false, -- only show scope in the current window
                hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
            },
            chunk = {
                -- when enabled, scopes will be rendered as chunks, except for the
                -- top-level scope which will be rendered as a scope.
                enabled = true,
                -- only show chunk scopes in the current window
                only_current = false,
                priority = 200,
                hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
                char = {
                    -- corner_top = "┌",
                    -- corner_bottom = "└",
                    corner_top = "╭",
                    corner_bottom = "╰",
                    horizontal = "─",
                    vertical = "│",
                    arrow = ">",
                },
            },
        },
        notifier = {                        -- notifications UI
            enabled = true,
            -- your notifier configuration goes here
            timeout = 5000, -- default timeout in ms
            padding = true, -- add 1 cell of left/right padding to the notification window
            sort = { "level", "added" }, -- sort by level and time
            level = vim.log.levels.TRACE,
            icons = {
                error = " ",
                warn = " ",
                info = " ",
                debug = " ",
                trace = " ",
            },
            style = "compact",
            date_format = "%R", -- time format for notifications
            more_format = " ↓ %d lines ",
            refresh = 50,   -- refresh at most every 50ms
        },
        picker = {                          -- fuzzy finder
            enabled = true,
            -- your picker configuration comes here
        },
        quickfile = { enabled = true },     -- render file as quickly as possible
        scroll = { enabled = true },        -- smoother scrolling
        statuscolumn = { enabled = true },  --
        toggle = {                          -- toggle keymap clues
            enabled = true,
            -- your toggle configuration comes here
            map = vim.keymap.set, -- keymap.set function to use
            which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
            notify = true, -- show a notification when toggling
            -- icons for enabled/disabled states
            icon = {
                enabled = " ",
                disabled = " ",
            },
            -- colors for enabled/disabled states
            color = {
                enabled = "green",
                disabled = "yellow",
            },
            wk_desc = {
                enabled = "Disable ",
                disabled = "Enable ",
            },
        },
    },
    keys = {
        -- INFO: essential keymaps
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- todo comments
        { "<leader>st", function() Snacks.picker.todo_comments({ keywords = { "TODO", "HACK", "WARNING", "BUG", "NOTE", "INFO", "PERF", "ERROR" } }) end, desc = "Todo Comment Tags" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
        -- grep
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
        { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        -- { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
        { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        -- Other
        { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
        { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
        -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
        -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
}

