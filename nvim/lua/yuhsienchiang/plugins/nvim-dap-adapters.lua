return {
    -- add adapters for each language here
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap, dap_python = require("dap"), require("dap-python")
            dap_python.setup("~/.pyenv/versions/debugpy_venv/bin/python")

            -- Set tester to pytest
            dap_python.test_runner = "pytest"

            -- Set custom python adapter
            table.insert(dap.configurations.python, {
                type = "python",
                request = "launch",
                name = "Pytest: file",
                module = "pytest",
                console = "integratedTerminal",
                justMyCode = false,
                args = function()
                    return { vim.fn.expand("%:p"), "-vv", "--lf", "--no-header", "-ra", "--tb=long" }
                end,
            })
        end,
    },
}
