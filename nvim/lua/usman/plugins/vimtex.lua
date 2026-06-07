-- INFO: VimtexCompile - start continuous compilation
-- VimtexStop - stop continuous compilation

vim.pack.add({ "https://github.com/lervag/vimtex" })



-- === PDF Viewer ===
vim.g.vimtex_view_method = "sioyek"     -- macos PDF viewer
-- vim.g.vimtex_view_method = "zathura"    -- linux PDF viewer

-- === Main LaTeX file ===
vim.g.vimtex_mainfile = "main.tex"

-- === Choose compilation engine ===
-- Options: "xelatex" or "lualatex"
local engine = "lualatex"       -- change to "lualatex" if you want LuaLaTeX
local engine_flag = "-pdfxe"    -- default XeLaTeX
if engine == "lualatex" then
    engine_flag = "-pdflua"
end
-- === latexmk compiler options ===
vim.g.vimtex_compiler_latexmk = {
    executable = "latexmk",
    options = {
        engine_flag,            -- set the engine
        "-shell-escape",        -- required for TikZ, minted, etc.
        "-interaction=nonstopmode",
        "-file-line-error",
        "-synctex=1",
        "-outdir=build"         -- compile output directory
    },
    continuous = 1,             -- auto-recompile on file save
    callback = 1,
    log_file = "build/latexmk_compile.log"
}
