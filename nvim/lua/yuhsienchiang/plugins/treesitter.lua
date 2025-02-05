return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufNewFile", "BufReadPost" },
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- enable syntax highlighting
            highlight = { enable = true },
            -- enable indentation
            indent = { enable = true },
            -- ensure these language parsers are installed
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                -- "css",
                "csv",
                "diff",
                "dockerfile",
                "gitcommit",
                "gitignore",
                "git_config",
                "git_rebase",
                "haskell",
                "html",
                "java",
                -- "javascript",
                "json",
                "json5",
                "lua",
                "luadoc",
                "latex",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "ssh_config",
                "tmux",
                "toml",
                -- "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            -- auto install above language parsers
            auto_install = true,
            vim.treesitter.language.register("bash", "zsh"),

            -- text objects
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                        ["L="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                        ["R="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
                    },
                    include_surrounding_whitespace = false,
                },
                swap = {
                    enable = true,
                    swap_next = { ["g>"] = { query = "@parameter.inner", desc = "Swap with prev argument" } },
                    swap_previous = { ["g<"] = { query = "@parameter.inner", desc = "Swap with next argument" } },
                },
            },
        })
    end,
}
