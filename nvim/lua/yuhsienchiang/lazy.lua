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
    install = { colorscheme = { "catppuccin", "nordic", "tokyonight" } },
    ui = {
        size = { width = 0.8, height = 0.8 },
        border = "single",
        title = "Lazy",
        icons = {
            cmd = " ",
            loaded = "",
            not_loaded = "",
        },
    },
    performance = {
        cache = { enabled = true, },
        reset_packpath = true,
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}

vim.g.mapleader = " "

require("lazy").setup({
    { import = "yuhsienchiang.plugins" },
    { import = "yuhsienchiang.plugins.lsp" },
    { import = "yuhsienchiang.plugins.dap" },
}, opts)
