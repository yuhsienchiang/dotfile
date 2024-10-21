return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = { enabled = false },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = true,
                keymap = {
                    accept = "<C-y>",
                    accept_word = false,
                    accept_line = false,
                    next = false,
                    prev = false,
                    dismiss = "<C-x>",
                },
            },
            copilot_node_command = "node",
        })
    end,
}
