vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/folke/todo-comments.nvim" },
})



local ok, snacks = pcall(require, "snacks")
if not ok then
    vim.notify("snacks.nvim not ready yet — restart Neovim after install", vim.log.levels.WARN)
    return
end

-- INFO: todo-comments - dependency of snacks.nvim
require("todo-comments").setup({})

-- INFO: snacks.nvim
snacks.setup({
    -- INFO: snacks.animate - efficient animation library
    animate = { enabled = true },

    -- INFO: snacks.bigfile - triggers when file is larger than configured size
    bigfile = {
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

    -- INFO: snacks.bufdelete - close buffers while preserving layout
    bufdelete = { enabled = true },

    -- INFO: snacks.dashboard - dashboard at startup
    dashboard = {
        enabled = false,
        -- your dashboard configuration comes here
        preset = {
            -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
            pick = 'telescope.nvim',      -- nil
        },
        sections = {
            { section = "header" },
            { section = "keys", gap = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
            -- { section = "startup" },  -- removed: requires lazy.nvim stats
        },
    },

    -- INFO: snacks.explorer - file tree explorer
    explorer = {
        enabled = true,
        replace_netrw = true, -- replace netrw with snacks explorer
    },

    -- INFO: snacks.image - view images in nvim snacks.picker
    image = {
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
            image = " ",
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

    -- INFO: snacks.notifier - notifications UI
    notifier = {
        enabled = true,
        -- your notifier configuration goes here
        timeout = 3000, -- default timeout in ms
        sort = { "level", "added" }, -- sort by level and time
        level = vim.log.levels.TRACE,
        icons = {
            error = " ",
            warn = " ",
            info = " ",
            debug = " ",
            trace = " ",
        },
        date_format = "%R", -- time format for notifications
        more_format = " ↓ %d lines ",
        refresh = 50,   -- refresh at most every 50ms
    },

    -- INFO: snacks.picker - fuzzy finder
    picker = {
        enabled = true,
        -- your picker configuration comes here
        layout = {
            -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
            preset = "telescope",   -- defaults to this layout unless overidden
            cycle = false,
        },
    },

    -- INFO: snacks.quickfile - render the file as quickly as possible
    quickfile = {
        enabled = true,
        exclude = { "latex" },
    },

    -- INFO: snacks.scope - scope detection based on treesitter
    scope = { enabled = true },
})

-- INFO: essential keymaps
-- vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end, { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
-- vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>e", function() Snacks.picker.explorer() end, { desc = "Toggle File Tree Explorer" })

-- find
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })

-- todo comments
vim.keymap.set("n", "<leader>st", function() Snacks.picker.todo_comments({ keywords = { "TODO", "HACK", "WARNING", "BUG", "NOTE", "INFO", "PERF", "ERROR" } }) end, { desc = "Todo Comment Tags" })
vim.keymap.set("n", "<leader>sT", function() Snacks.picker.todo_comments() end, { desc = "Todo" })

-- git
-- vim.keymap.set("n", "<leader>gc", function() Snacks.picker.git_log() end, { desc = "Git Log" })
-- vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })

-- grep
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

-- search
vim.keymap.set("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
-- vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
vim.keymap.set("n", "<leader>qp", function() Snacks.picker.projects() end, { desc = "Projects" })

-- LSP
-- vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
-- vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
-- vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
-- vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
-- vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })

