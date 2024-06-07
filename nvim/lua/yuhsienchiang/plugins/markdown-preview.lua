return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
}
