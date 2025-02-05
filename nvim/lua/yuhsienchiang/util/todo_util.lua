local M = {}

function M.todo_fzf_all()
    require("todo-comments.fzf").todo({
        no_header = true,
        winopts = { title = " ToDo: all " },
    })
end

function M.todo_fzf_select()
    local fzf_lua = require("fzf-lua")
    local todo_keywords = require("todo-comments.config").keywords

    local opts = {
        prompt = " 󰍉 ",
        fzf_opts = { ["--multi"] = true },
        winopts = {
            height = 0.3,
            width = 0.3,
            row = 0.5,
            col = 0.50,
            border = "single",
            backdrop = 100,
            title = " ToDo: Keywords ",
            title_pos = "center",
            preview = { hidden = "hidden" },
        },
        actions = {
            ["default"] = function(selected)
                require("todo-comments.fzf").todo({
                    keywords = selected,
                    no_header = true,
                    winopts = { title = " ToDo: [" .. table.concat(selected, ", ") .. "] " },
                })
            end,
        },
    }

    local keywords = {}
    for key, _ in pairs(todo_keywords) do
        table.insert(keywords, key)
    end

    fzf_lua.fzf_exec(keywords, opts)
end

return M
