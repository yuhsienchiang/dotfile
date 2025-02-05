return {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.g.git_worktree = {
            change_directory_command = "tcd",
        }

        local Hooks = require("git-worktree.hooks")
        local tree_api = require("nvim-tree.api")


        -- Notify worktree switch & update nvim-tree root
        Hooks.register(Hooks.type.SWITCH, function(path, prev_path)

            -- regex pattern ("([^/]+/?)$")
            local branch = "[" .. path:match("([^/]+)$") .. "]"
            local prev_branch = "[" .. prev_path:match("([^/]+)$") .. "]"

            vim.notify(
                " " .. prev_branch .. "  " .. branch,
                vim.log.levels.INFO,
                { title = "Git Worktree", render = "compact" }
            )
            tree_api.tree.change_root(path)
        end)
    end,
}
