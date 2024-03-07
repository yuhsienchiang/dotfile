return {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    ft = "python",
    config = function()
        require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    end,
}
