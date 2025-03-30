local M = {}

M.run = function(neotest_run_opts, ui)
    local neotest = require("neotest")

    neotest_run_opts = neotest_run_opts or {}
    ui = ui or false

    neotest.run.run(neotest_run_opts)

    if ui then
        neotest.summary.open()
    end
end

M.run_dap = function(neotest_run_opts, ui)
    local neotest = require("neotest")

    neotest_run_opts = neotest_run_opts or {}
    neotest_run_opts.strategy = "dap"
    ui = ui or false

    neotest.run.run(neotest_run_opts)

    if ui then
        vim.defer_fn(neotest.summary.open, 700)
    end
end

M.output = function(win_opts)
    local neotest = require("neotest")

    win_opts = vim.tbl_deep_extend(
        "force",
        {},
        { splig = "below", height = math.floor(vim.o.lines * 0.4), style = "minimal" },
        win_opts
    )

    local win_config = {}
    if win_opts.mode == "vertical" then
        win_config = { split = "right", width = math.floor(vim.o.columns * win_opts.size), style = "minimal" }
    elseif win_opts.mode == "horizontal" then
        win_config = { split = "below", height = math.floor(vim.o.lines * win_opts.size), style = "minimal" }
    end

    local neotest_output_opts = {
        open_win = function()
            return vim.api.nvim_open_win(0, false, win_config)
        end,
        short = true,
        enter = true,
        quiet = true,
    }

    neotest.output.open(neotest_output_opts)
end

M.output_all = function(win_opts)
    local neotest = require("neotest")

    win_opts = vim.tbl_deep_extend(
        "force",
        {},
        { splig = "below", height = math.floor(vim.o.lines * 0.4), style = "minimal" },
        win_opts
    )

    local win_config = {}
    if win_opts.mode == "vertical" then
        win_config = { split = "right", width = math.floor(vim.o.columns * win_opts.size), style = "minimal" }
    elseif win_opts.mode == "horizontal" then
        win_config = { split = "below", height = math.floor(vim.o.lines * win_opts.size), style = "minimal" }
    end

    local neotest_output_opts = {
        open_win = function()
            return vim.api.nvim_open_win(0, false, win_config)
        end,
        short = false,
        enter = true,
        quiet = true,
    }

    neotest.output.open(neotest_output_opts)
end

return M
