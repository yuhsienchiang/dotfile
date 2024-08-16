return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function()
        require("diffview").setup({
            enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
            view = {
                merge_tool = {
                    layout = "diff3_mixed",
                    disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
                    winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
                },
            },
        })
    end,
}
