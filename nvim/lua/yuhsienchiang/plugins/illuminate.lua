return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            delay = 200,
            large_file_cutoff = 2000,
            filetypes_denylist = {
                "NvimTree",
                "dashboard",
            },
            large_file_overrides = {
                providers = { "lsp" },
            },
        })
    end,
}
