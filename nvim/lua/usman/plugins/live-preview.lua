vim.pack.add({
    { src = "https://github.com/brianhuster/live-preview.nvim" },
})

require("livepreview.config").set({
    port = 5500,
    browser = "firefox",
    dynamic_root = false,
    sync_scroll = true,
    picker = "telescope",
    address = "127.0.0.1",
})
