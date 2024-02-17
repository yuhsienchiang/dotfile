local function smart_cursor_home()
	local api = vim.api
	local cursor_position = api.nvim_win_get_cursor(0)
	local current_line_string = api.nvim_get_current_line():sub(0, cursor_position[2])
	local start_idx, _ = string.find(current_line_string, "%S")
	if start_idx == nil then
		api.nvim_win_set_cursor(0, { cursor_position[1], 0 })
	else
		api.nvim_win_set_cursor(0, { cursor_position[1], start_idx - 1 })
	end
end

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

-- cursor movement
vim.keymap.set("n", "<C-Right>", "$", { desc = "Far Right", silent = true })
vim.keymap.set("i", "<C-Right>", "<C-o>$", { desc = "Far Right", silent = true })
vim.keymap.set({"n", "i"}, "<C-Left>", smart_cursor_home, { desc = "Far Left", silent = true })
vim.keymap.set("n", "<C-Up>", "gg", { desc = "Far Top", silent = true })
vim.keymap.set("i", "<C-Up>", "<C-o>gg", { desc = "Far Top", silent = true })
vim.keymap.set("n", "<C-Down>", "G", { desc = "Far Bottom", silent = true })
vim.keymap.set("i", "<C-Down>", "<C-o>G", { desc = "Far Bottom", silent = true })

-- window manipulation
vim.keymap.set("n", "<leader><Down>", ":wincmd j<CR>", { desc = "Move Down", silent = true })
vim.keymap.set("n", "<leader><Up>", ":wincmd k<CR>", { desc = "Move Up", silent = true })
vim.keymap.set("n", "<leader><Right>", ":wincmd l<CR>", { desc = "Move Right", silent = true })
vim.keymap.set("n", "<leader><Left>", ":wincmd h<CR>", { desc = "Move Left", silent = true })
vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>", { desc = "Move Left", silent = true })
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>", { desc = "Move Down", silent = true })
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>", { desc = "Move Up", silent = true })
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>", { desc = "Move Right", silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move Left", silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move Down", silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move Up", silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move Right", silent = true })
vim.keymap.set("n", "<leader>w<Up>", "<cmd>resize +4<cr>", { desc = "Increase window height", silent = true })
vim.keymap.set("n", "<leader>w<Down>", "<cmd>resize -4<cr>", { desc = "Decrease window height", silent = true })
vim.keymap.set("n", "<leader>w<Left>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width", silent = true })
vim.keymap.set("n", "<leader>w<Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width", silent = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files", silent = true })
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files", silent = true })
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find strings", silent = true })
vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find current string", silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find opened buffers", silent = true })
vim.keymap.set("n", "<leader>fm", ":Telescope man_pages<CR>", { desc = "Search man pages", silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Search help tags", silent = true })


-- nvim-tree
vim.keymap.set("n", "<leader>ss", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", silent = true })
vim.keymap.set("n", "<leader>sf", ":NvimTreeFocus<CR>", { desc = "Focus on NvimTree", silent = true })
vim.keymap.set("n", "<leader>sl", ":NvimTreeFindFile<CR>", { desc = "Locate File on NvimTree", silent = true })

-- venv selector
vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>", { desc = "Select Venv", silent = true })
vim.keymap.set("n", "<leader>vc", ":VenvSelectCached<CR>", { desc = "Select Venv fom Cache", silent = true })

-- Git
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open Lazygit", silent = true })
vim.keymap.set("n", "<leader>gc", ":LazyGitCurrentFile<CR>", { desc = "Open Lazygit in the project root of the current file.", silent = true })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen <CR>", { desc = "Open Diffview", silent = true })
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory <CR>", { desc = "All diff history", silent = true })
vim.keymap.set("n", "<leader>gH", ":DiffviewFileHistory %<CR>", { desc = "Current file diff history", silent = true })

-- Buffer Navigation
vim.keymap.set("n", "<leader>b<Left>", ":bprevious<CR>", { desc = "Prev buffer", silent = true })
vim.keymap.set("n", "<leader>b<Right>", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<leader>bq", ":bp<bar>bd #<CR>", { desc = "Quit buffer", silent = true })

-- Tab Navigation
vim.keymap.set("n", "<leader>t<Left>", ":tabprevious<CR>", { desc = "Prev buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>t<Right>", ":tabnext<CR>", { desc = "Next buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>", { desc = "Quit buffer", silent = true, noremap = true })

-- Add redo break points
vim.keymap.set("i", ",", ",<C-g>u", { silent = true, desc = "undo break points", noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { silent = true, desc = "undo break points", noremap = true })
vim.keymap.set("i", ";", ";<C-g>u", { silent = true, desc = "undo break points", noremap = true })

-- Quit options
vim.keymap.set("n", "<leader>qq", "<cmd>wqa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>qf", "<cmd>q!<CR>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>qw", "<cmd>wq<CR>", { desc = "Write and Quit" })
