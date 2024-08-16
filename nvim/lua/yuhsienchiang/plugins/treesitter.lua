return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufNewFile", "BufReadPost" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- enable syntax highlighting
            highlight = { enable = true  },
            -- enable indentation
            indent = { enable = true },
            -- ensure these language parsers are installed
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "css",
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
                "javascript",
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
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            -- auto install above language parsers
            auto_install = true,

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ej", -- set to `false` to disable one of the mappings
                    node_incremental = "<leader>ej",
                    scope_incremental = false,
                    node_decremental = "<leader>ek",
                },
            },
            vim.treesitter.language.register("bash", "zsh"),
        })
    end,
}
