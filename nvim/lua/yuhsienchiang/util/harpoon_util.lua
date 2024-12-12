local M = {}

function M.harpoon_add()
    local harpoon = require("harpoon")
    harpoon:list():add()

    -- get the index at where the buffer was added to the list
    local harpoon_entries = harpoon:list()
    local length = harpoon_entries:length()
    local idx = length
    local current_file_path = vim.fn.expand("%")

    for i = 1, length do
        local harpoon_entry = harpoon_entries:get(i)
        if harpoon_entry ~= nil and harpoon_entry.value == current_file_path then
            idx = i
        end
    end
    local message = " " .. vim.fn.expand("%:t") .. "  " .. idx

    require("snacks").notifier.notify(message, vim.log.levels.INFO, { title = "Harpoon", style = "minimal" })
end

local function filter_empty_string(list)
    local next = {}
    for idx = 1, #list do
        if list[idx] ~= nil and list[idx].value ~= "" then
            table.insert(next, list[idx])
        end
    end

    return next
end

function M.harpoon_clear()
    local harpoon = require("harpoon")
    harpoon:list():clear()
    require("snacks").notifier.notify("List cleared", vim.log.levels.INFO, { title = "Harpoon", style = "minimal" })
end

local harpoon_get_index = function(entry)
    local harpoon = require("harpoon")
    local harpoon_entries = harpoon:list()
    local length = harpoon_entries:length()

    for i = 1, length do
        local harpoon_entry = harpoon_entries:get(i)
        if harpoon_entry ~= nil and entry.value == harpoon_entry.value then
            return i
        end
    end
    -- If we can't find the entry, return -1
    return -1
end

local generate_new_finder = function()
    local entry_display = require("telescope.pickers.entry_display")
    local finders = require("telescope.finders")
    local harpoon = require("harpoon")

    return finders.new_table({
        results = filter_empty_string(harpoon:list().items),
        entry_maker = function(entry)
            local line = entry.value .. " " .. entry.context.row .. ":" .. entry.context.col
            local displayer = entry_display.create({
                separator = " - ",
                items = {
                    { width = 1 },
                    { width = 50 },
                    { remaining = true },
                },
            })
            local make_display = function()
                return displayer({
                    tostring(harpoon_get_index(entry)),
                    line,
                })
            end
            return {
                value = entry,
                ordinal = line,
                display = make_display,
                lnum = entry.context.row,
                col = entry.context.col,
                filename = entry.value,
            }
        end,
    })
end

local delete_harpoon_mark = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local harpoon = require("harpoon")

    local selection = action_state.get_selected_entry()
    if not selection then
        return
    end
    harpoon:list():remove(selection.value)

    local current_picker = action_state.get_current_picker(prompt_bufnr)
    current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

local move_mark_up = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local harpoon = require("harpoon")
    local selection = action_state.get_selected_entry()
    if not selection then
        return
    end

    local length = harpoon:list():length()
    if selection.index == length then
        return
    end

    local mark_list = harpoon:list().items

    table.remove(mark_list, selection.index)
    table.insert(mark_list, selection.index + 1, selection.value)

    local current_picker = action_state.get_current_picker(prompt_bufnr)
    current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

local move_mark_down = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local harpoon = require("harpoon")

    local selection = action_state.get_selected_entry()
    if not selection then
        return
    end
    if selection.index == 1 then
        return
    end
    local mark_list = harpoon:list().items
    table.remove(mark_list, selection.index)
    table.insert(mark_list, selection.index - 1, selection.value)
    local current_picker = action_state.get_current_picker(prompt_bufnr)
    current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

function M.harpoon_telescope()
    local pickers = require("telescope.pickers")
    local conf = require("telescope.config").values

    pickers
        .new({}, {
            prompt_title = "Harpoon",
            finder = generate_new_finder(),
            sorter = conf.generic_sorter({}),
            sorting_strategy = "ascending",
            previewer = false,
            layout_config = { center = { width = 0.4, height = 0.4 } },
            layout_strategy = "center",
            results_title = false,
            borderchars = {
                prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
                results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            },
            attach_mappings = function(_, map)
                map({ "i", "n" }, "<c-d>", delete_harpoon_mark)
                map({ "i", "n" }, "<c-n>", move_mark_up)
                map({ "i", "n" }, "<c-p>", move_mark_down)
                return true
            end,
        })
        :find()
end

function M.harpoon_lualine()
    local harpoon = require("harpoon")

    local harpoon_entries = harpoon:list()
    local root_dir = harpoon_entries.config:get_root_dir()
    local indicators = { "1", "2", "3", "4" }
    local active_indicators = { "[1]", "[2]", "[3]", "[4]" }
    local separator = " "

    local current_file_path = vim.api.nvim_buf_get_name(0)

    local length = math.min(harpoon_entries:length(), #indicators)
    local status = {}

    for i = 1, length do
        local entry = harpoon_entries:get(i)

        local indicator = ""
        if entry ~= nil then
            local entry_path = root_dir .. "/" .. entry.value
            if entry_path == current_file_path then
                indicator = active_indicators[i]
            else
                indicator = indicators[i]
            end
        end
        table.insert(status, indicator)
    end
    return table.concat(status, separator)
end

return M
