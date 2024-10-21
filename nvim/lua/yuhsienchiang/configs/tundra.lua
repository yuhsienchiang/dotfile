local M = {}

function M.setup()
    local colors = require("nvim-tundra.palette.jungle")

    require("nvim-tundra").setup({
        transparent_background = false,
        dim_inactive_windows = { enabled = false },
        sidebars = {
            enabled = true,
            color = nil,
        },
        editor = {
            search = {},
            substitute = {},
        },
        syntax = {
            booleans = { bold = true, italic = true },
            comments = { bold = true, italic = true },
            conditionals = {},
            constants = { bold = true },
            fields = {},
            functions = {},
            keywords = {},
            loops = {},
            numbers = { bold = true },
            operators = { bold = true },
            punctuation = {},
            strings = {},
            types = { italic = true },
        },
        diagnostics = {
            errors = {},
            warnings = {},
            information = {},
            hints = {},
        },
        plugins = {
            lsp = true,
            semantic_tokens = true,
            treesitter = true,
            telescope = true,
            nvimtree = true,
            cmp = true,
            context = true,
            dbui = false,
            gitsigns = true,
            neogit = false,
            textfsm = false,
        },
        overwrite = {},
    })

    vim.g.tundra_biome = "jungle" -- 'arctic' or 'jungle'
    vim.opt.background = "dark"
    vim.cmd("colorscheme tundra")
end

return M
