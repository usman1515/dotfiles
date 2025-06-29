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
        image = {                           --  view images in nvim snacks.picker
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
                "mp4",
                "mov",
                "avi",
                "mkv",
                "webm",
                "pdf",
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
                enabled = true, -- enable math expression rendering
                -- in the templates below, `${header}` comes from any section in your document,
                -- between a start/end header comment. Comment syntax is language-specific.
                -- * start comment: `// snacks: header start`
                -- * end comment:   `// snacks: header end`
                typst = {
                    tpl = [[
                    #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
                    #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
                    #set text(size: 12pt, fill: rgb("${color}"))
                    ${header}
                    ${content}]],
                },
                latex = {
                    font_size = "Large", -- see https://www.sascha-frank.com/latex-font-size.html
                    -- for latex documents, the doc packages are included automatically,
                    -- but you can add more packages here. Useful for markdown documents.
                    packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
                    tpl = [[
                    \documentclass[preview,border=0pt,varwidth,12pt]{standalone}
                    \usepackage{${packages}}
                    \begin{document}
                    ${header}
                    { \${font_size} \selectfont
                    \color[HTML]{${color}}
                    ${content}}
                    \end{document}]],
                },
            },
        },
        notifier = {                        -- notifications UI
            enabled = true,
            -- your notifier configuration goes here
            timeout = 3000, -- default timeout in ms
            sort = { "level", "added" }, -- sort by level and time
            level = vim.log.levels.TRACE,
            icons = {
                error = " ",
                warn = " ",
                info = " ",
                debug = " ",
                trace = " ",
            },
            date_format = "%R", -- time format for notifications
            more_format = " ↓ %d lines ",
            refresh = 50,   -- refresh at most every 50ms
        },
        picker = {                          -- fuzzy finder
            enabled = true,
            -- your picker configuration comes here
            layout = {
                -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
                preset = "telescope",   -- defaults to this layout unless overidden
                cycle = false,
            },
        },
        quickfile = {                       -- render the file as quickly as possible
            enabled = true,
            exclude = { "latex" },
        },
        scope = { enabled = true },         -- scope detection based on treesitter
        statuscolumn = { enabled = true },
        toggle = {                          -- toggle kepmaps
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
        },
    },
    -- optional = true,
    keys = {
        -- INFO: essential keymaps
        { "<leader>space>", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>e", function() Snacks.picker.explorer() end, desc = "Toggle File Tree Explorer" },
        -- find
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- todo comments
        { "<leader>st", function () Snacks.picker.todo_comments({ keywords = { "TODO", "HACK", "WARNING", "BUG", "NOTE", "INFO", "PERF", "ERROR" } }) end, desc = "Todo Comment Tags" },
        { "<leader>sT", function() Snacks.picker.todo_comments() end, desc = "Todo" },
        -- git
        { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        -- grep
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        -- { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        { "<leader>qp", function() Snacks.picker.projects() end, desc = "Projects" },
        -- LSP
        -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        -- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    },
}

