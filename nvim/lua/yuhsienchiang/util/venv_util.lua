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
    if vim.bo.filetype ~= "python" then
        vim.notify("Not a Python file", vim.log.levels.WARN, { title = "VenvSelector", style = "compact" })
        return
    end

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
            height = 0.25,
            width = 1,
            row = 1,
            col = 0,
            border = { "─", "─", "─", " ", " ", " ", " ", " " },
            backdrop = 100,
            title = " VenvSelector ",
            title_pos = "center",
            preview = { hidden = "hidden" },
        },
        actions = {
            ["default"] = function(selected)
                local venv_name = selected[1]:match(". +(.+)")
                venv_selector.activate_from_path(venv_name)
            end,
        },
        fn_transform = function(x)
            -- colorised python symbol
            return "[0;33m[0m " .. x
        end,
    }

    fzf_lua.fzf_exec(command, opts)
end

return M
