local M = {}

function M.gitgraph_draw()
    if vim.bo.filetype == "gitgraph" then
        return
    end
    vim.cmd("tab split")
    require("gitgraph").draw({}, { all = true, max_count = 5000 })
end

function M.gitgraph_close()
    if vim.bo.filetype == "gitgraph" then
        vim.cmd("tabclose")
    else
        return
    end
end

function M.gitgraph_toggle()
    if vim.bo.filetype == "gitgraph" then
        M.gitgraph_close()
    else
        M.gitgraph_draw()
    end
end

return M
