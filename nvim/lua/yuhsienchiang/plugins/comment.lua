return {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        local comment = require("Comment")
        local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

        -- set keybindings that works in and outside tmux
        -- https://stackoverflow.com/questions/76883693/when-i-use-nvim-c-keymapping-does-not-working-in-tmux
        comment.setup({
            toggler = {
                line = "<C-\\>",
                block = "<C-S-\\>"
            },
            opleader = {
                line = "<C-\\>",
                block = "<C-S-\\>"
            },
            mappings = {
                basic = true,
                extra = false,
            },
            pre_hood = ts_context_commentstring.create_pre_hook(),
        })
    end,
}
