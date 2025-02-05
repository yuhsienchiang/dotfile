return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    opts = {
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
    },
}
