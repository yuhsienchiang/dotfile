return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
        enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
        view = {
            merge_tool = {
                layout = "diff3_mixed",
                disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
                winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
            },
        },
        file_panel = {
            listing_style = "list",
            win_config = {
                position = "right",
                width = 30,
            },
        },
        file_history_panel = {
            win_config = {
                position = "bottom",
                height = 10,
            },
        },
    },
}
