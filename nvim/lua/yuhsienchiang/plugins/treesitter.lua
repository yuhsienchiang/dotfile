return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufNewFile", "BufReadPost" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- enable syntax highlighting
            highlight = { enable = true },
            -- enable indentation
            indent = { enable = true },
            -- ensure these language parsers are installed
            ensure_installed = {
                "c",
                "cpp",
                "diff",
                "vim",
                "vimdoc",
                "lua",
                "luadoc",
                "python",
                "java",
                "markdown",
                "markdown_inline",
                "html",
                "css",
                "javascript",
                "typescript",
                "json",
                "regex",
                "tmux",
                "toml",
                "bash",
                "dockerfile",
                "gitignore",
                "yaml",
                "git_config",
                "git_rebase",
                "gitcommit",
            },
            -- auto install above language parsers
            auto_install = true,

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>aa", -- set to `false` to disable one of the mappings
                    node_incremental = "<leader>aa",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}
