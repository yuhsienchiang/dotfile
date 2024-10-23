local M = {}

function M.setup()
    local neofusion = require("neofusion")
    neofusion.setup({})

    vim.cmd([[ colorscheme neofusion ]])
end

return M
