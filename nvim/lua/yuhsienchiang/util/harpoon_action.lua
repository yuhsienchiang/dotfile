local M = {}

-- harpoon
local harpoon = require("harpoon")

-- telescope
local action_state = require("telescope.actions.state")
local action_utils = require("telescope.actions.utils")
local entry_display = require("telescope.pickers.entry_display")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

function M.harpoon_add()
	harpoon:list():add()

	-- get the index at where the buffer was added to the list
	local harpoon_entries = harpoon:list()
	local length = harpoon_entries:length()
	local idx = length

	for i = 1, length do
		local harpoon_entry = harpoon_entries:get(i)
		if harpoon_entry ~= nil and harpoon_entry.value == vim.fn.expand("%") then
			idx = i
		end
	end
	local message = " " .. vim.fn.expand("%:t") .. "  " .. idx

	vim.notify(message, vim.log.levels.INFO, { title = "Harpoon", render = "compact" })
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

local harpoon_get_index = function(entry)
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
	local selection = action_state.get_selected_entry()
	harpoon:list():remove(selection.value)

	local function get_selections()
		local results = {}
		action_utils.map_selections(prompt_bufnr, function(entry)
			table.insert(results, entry)
		end)
		return results
	end

	local selections = get_selections()
	for _, current_selection in ipairs(selections) do
		harpoon:list():remove(current_selection.value)
	end

	local current_picker = action_state.get_current_picker(prompt_bufnr)
	current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

local move_mark_up = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
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
	local selection = action_state.get_selected_entry()
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
				prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
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
	local harpoon_entries = harpoon:list()
    local root_dir = harpoon_entries.config:get_root_dir()
	local indicators = { "1", "2", "3", "4", "5" }
	local active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" }
	local separator = " "

	local current_file_path = vim.api.nvim_buf_get_name(0)

	local length = math.min(harpoon_entries:length(), #indicators)
	local status = {}

	for i = 1, length do
		local entry = harpoon_entries:get(i)

		local indicator = "-"
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
