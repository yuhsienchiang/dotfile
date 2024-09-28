return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                        ["L="] = { query = "@assignment.lhs",   desc = "Select left hand side of an assignment" },
                        ["R="] = { query = "@assignment.rhs",   desc = "Select right hand side of an assignment" },
                        ["aa"] = { query = "@parameter.outer",  desc = "Select outer part of a parameter/argument" },
                        ["ia"] = { query = "@parameter.inner",  desc = "Select inner part of a parameter/argument" },
                    },
                    include_surrounding_whitespace = false,
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["g>"] = { query = "@parameter.inner", desc = "Swap with prev argument" },
                    },
                    swap_previous = {
                        ["g<"] = { query = "@parameter.inner", desc = "Swap with next argument" },
                    },
                },
            },
        })
    end,
}
