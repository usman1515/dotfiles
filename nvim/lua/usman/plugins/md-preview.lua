-- install without yarn or npm
vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })



-- run the build step after install
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "markdown-preview.nvim" then
            vim.fn["mkdp#util#install"]()
        end
    end,
})

