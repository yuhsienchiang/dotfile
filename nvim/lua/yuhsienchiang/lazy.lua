local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    defaults = { lazy = true },
    pkg = { sources = { "lazy" } },
    rocks = { enabled = false },
    install = {
        missing = true,
        colorscheme = { "catppuccin" },
    },
    performance = {
        cache = { enabled = true },
        reset_packpath = true,
        rtp = {
            disabled_plugins = {
                "editorconfig",
                "rplugin",
                "gzip",
                "matchit",
                "matchparen",
                "netrw",
                "netrwSettings",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "spellfile",
            },
        },
    },
    readme = { enabled = false },
}

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    { import = "yuhsienchiang.plugins" },
    { import = "yuhsienchiang.plugins.lsp" },
}, opts)
