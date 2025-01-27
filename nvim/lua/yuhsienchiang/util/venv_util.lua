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

function M.venv_selector_fzf()
    local fzf_lua = require("fzf-lua")
    local venv_selector = require("venv-selector")
    local config_venv_selector = require("venv-selector.config")

    -- command to search pyenv venv bins
    local command = config_venv_selector.user_settings.search.pyenv.command

    -- opts for fzf-lua
    local opts = {
        fzf_opts = { ["--nth"] = "2" }, -- only matching the file path, not the icon
        prompt = " 󰍉 ",
        winopts = {
            height = 0.35,
            width = 0.5,
            row = 0.5,
            col = 0.50,
            border = "single",
            backdrop = 100,
            title = " VenvSelector ",
            title_pos = "center",
            preview = { hidden = "hidden" },
        },
        actions = {
            ["default"] = function(selected)
                if vim.bo.filetype == "python" then
                    local venv_name = selected[1]:match(". +(.+)")
                    venv_selector.activate_from_path(venv_name)
                else
                    vim.notify("Not a Python file", vim.log.levels.WARN)
                end
            end,
        },
        fn_transform = function(x)
            return "  " .. x
        end,
    }

    fzf_lua.fzf_exec(command, opts)
end

return M
