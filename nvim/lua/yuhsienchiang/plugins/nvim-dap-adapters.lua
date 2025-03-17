return {
    -- add adapters for each language here
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("dap-python").setup("~/.pyenv/versions/debugpy_venv/bin/python")
        end,
    },
}
