local M = { action = {}, fzf = {} }

local function extract_file_path(input)
    if type(input) == "string" then
        return input:match("%d+ %- (.+)")
    elseif type(input) == "table" then
        return vim.tbl_map(function (item)
            return item:match("%d+ %- (.+)")
        end, input)
    end
    return input
end

local function find_harpoon_entry(path)
    local harpoon = require("harpoon")
    local entries = harpoon:list().items

    for idx, entry in pairs(entries) do
        if entry.value == path then
            return { entry = entry, index = idx }
        end
    end
    return nil
end


local function notify(message, level)
    require("snacks").notifier.notify(
        message,
        level or vim.log.levels.INFO,
        { title = "Harpoon", style = "compact" }
    )
end

function M.action.harpoon_add()
    local harpoon = require("harpoon")
    local current_file_path = vim.fn.expand("%")

    harpoon:list():add()

    local entries = harpoon:list()
    local idx = entries:length()

    for i = 1, idx do
        local entry = entries:get(i)
        if entry and entry.value == current_file_path then
            idx = i
            break
        end
    end

    notify(" " .. vim.fn.expand("%:t") .. "  " .. idx, vim.log.levels.INFO)
end

function M.action.harpoon_clear()
    local harpoon = require("harpoon")
    harpoon:list():clear()
    notify("List cleared", vim.log.levels.INFO)
end

-- fzf actions
local function edit_harpoon_mark(selected, opts)
    if not selected then return end

    local actions = require("fzf-lua").actions
    local paths = extract_file_path(selected)

    actions.file_edit(paths, opts)
end

local function split_harpoon_mark(selected, opts)
    if not selected then return end

    local actions = require("fzf-lua").actions
    local paths = extract_file_path(selected)

    actions.file_split(paths, opts)
end

local function vsplit_harpoon_mark(selected, opts)
    if not selected then return end

    local actions = require("fzf-lua").actions
    local paths = extract_file_path(selected)

    actions.file_vsplit(paths, opts)
end

local function tab_harpoon_mark(selected, opts)
    if not selected then return end

    local actions = require("fzf-lua").actions
    local paths = extract_file_path(selected)

    actions.file_tabedit(paths, opts)
end

local delete_harpoon_mark = function(selected)
    if not selected then return end

    local harpoon = require("harpoon")
    local paths = extract_file_path(selected)

    for _, path in ipairs(paths) do
        local entry = find_harpoon_entry(path)
        if entry and entry.entry then
            harpoon:list():remove(entry.entry)
        end
    end
end

local function move_mark(selected, direction)
    if not selected then return end

    local harpoon = require("harpoon")
    local path = extract_file_path(selected[1])
    local entry = find_harpoon_entry(path)
    local list = harpoon:list()

    if not entry then return end

    if (direction == "up" and entry.index == list:length()) or
        (direction == "down" and entry.index == 1) then
        return
    end

    local mark_list = list.items
    local new_index = direction == "up" and entry.index + 1 or entry.index - 1

    table.remove(mark_list, entry.index)
    table.insert(mark_list, new_index, entry.entry)
end

function M.harpoon_lualine()
    local harpoon = require("harpoon")
    local entries = harpoon:list()
    local root_dir = entries.config:get_root_dir()
    local current_file = vim.api.nvim_buf_get_name(0)
    local status = {}

    local length = math.min(entries:length(), 4)

    for i = 1, length do
        local entry = entries:get(i)
        if entry then
            local entry_path = root_dir .. "/" .. entry.value
            local label = i .. " " .. vim.fn.fnamemodify(entry.value, ":t")

            if entry_path == current_file then
                label = "[" .. "󰐃" .. label .. "]"
            else
                label = "" .. label
            end
            table.insert(status, label)
        end
    end
    return table.concat(status, "  ")
end

function M.fzf.harpoon_fzf()
    local fzf_lua = require("fzf-lua")
    local harpoon = require("harpoon")

    local opts = {
        prompt = " 󰍉 ",
        winopts = {
            height = 0.35,
            width = 0.5,
            row = 0.5,
            col = 0.50,
            border = "single",
            backdrop = 100,
            title = " Harpoon ",
            title_pos = "center",
            preview = { hidden = "hidden" },
        },
        actions = {
            ["default"] = edit_harpoon_mark,
            ["ctrl-v"] = vsplit_harpoon_mark,
            ["ctrl-s"] = split_harpoon_mark,
            ["ctrl-t"] = tab_harpoon_mark,
            ["ctrl-d"] = { delete_harpoon_mark, fzf_lua.actions.resume },
            ["ctrl-n"] = { function (selected) move_mark(selected, "up") end, fzf_lua.actions.resume },
            ["ctrl-p"] = { function (selected) move_mark(selected, "down") end, fzf_lua.actions.resume },
        },
    }

    fzf_lua.fzf_exec(function(fzf_cb)
        local entries = harpoon:list().items
        for idx, entry in pairs(entries) do

            if entry and entry.value ~= "" then
                fzf_cb(idx .. " - " .. entry.value)
            end
        end
        fzf_cb()
    end, opts)
end

return M
