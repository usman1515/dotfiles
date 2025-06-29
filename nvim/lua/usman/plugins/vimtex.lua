-- INFO: VimtexCompile - start continuous compilation
-- VimtexStop - stop continuous compilation

return {
    "lervag/vimtex",
    lazy = false,     -- Load VimTeX immediately
    init = function()
        vim.g.vimtex_view_method = "zathura"
        -- Configure VimTeX to use latexmk
        vim.g.vimtex_compiler_latexmk = {
            executable = "latexmk",
            options = {
                "-pdf",                 -- Generate PDF (let latexmk decide the engine)
                "-shell-escape",        -- Required for TikZ, minted, etc.
                "-verbose",
                "-file-line-error",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-outdir=build"         -- Store compiled files in 'build/' directory
            },
            continuous = 1,             -- Enable automatic recompile
            callback = 1,
            log_file = "build/latexmk_compile.log"  -- Save compile logs
        }
    end
}
