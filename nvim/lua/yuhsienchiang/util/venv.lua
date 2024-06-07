local M = {}

function M.activated_venv()
    local venv_name = require("venv-selector").venv()
    if vim.bo.filetype ~= "python" then
        return ""
    end
    if venv_name ~= nil then
        return string.gsub(venv_name, "/Users/yuhsienchiang/.pyenv/versions/", "(pyenv) ")
    else
        return "venv"
    end
end

return M
