local M = {}

M.set_condition_breakpoint = function()
    vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
        require("dap").set_breakpoint(input)
    end)
end

M.pytest_file = function(file)
    local test_file = file or vim.fn.expand("%:p")

    -- Configure the Python adapter
    require("dap").run({
        type = "python",
        request = "launch",
        name = "Pytest: file",
        module = "pytest",
        console = "integratedTerminal",
        justMyCode = false,
        args = { test_file, "-vv", "--lf", "--no-header", "-ra", "--tb=long" },
    })
end

return M
