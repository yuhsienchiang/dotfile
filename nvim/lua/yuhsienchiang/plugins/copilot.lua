return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = { enabled = false },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<C-y>",
                    next = "<C-]>",
                    prev = "<C-[>",
                    dismiss = "<C-n>",
                },
            },
            copilot_node_command = "node",
        })
    end,
}
