-- use <ESC> to clear search highlight
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true, noremap = true })

-- cursor movement
vim.keymap.set("n", "<C-Right>", "$",       { desc = "Far Right",  silent = true, noremap = true })
vim.keymap.set("i", "<C-Right>", "<C-o>$",  { desc = "Far Right",  silent = true, noremap = true })
vim.keymap.set("n", "<C-Left>",  "^",       { desc = "Far Left",   silent = true, noremap = true })
vim.keymap.set("i", "<C-Left>",  "<C-o>^",  { desc = "Far Left",   silent = true, noremap = true })
vim.keymap.set("n", "<C-Up>",    "gg",      { desc = "Far Top",    silent = true, noremap = true })
vim.keymap.set("i", "<C-Up>",    "<C-o>gg", { desc = "Far Top",    silent = true, noremap = true })
vim.keymap.set("n", "<C-Down>",  "G",       { desc = "Far Bottom", silent = true, noremap = true })
vim.keymap.set("i", "<C-Down>",  "<C-o>G",  { desc = "Far Bottom", silent = true, noremap = true })

-- window manipulation
vim.keymap.set("n", "<leader><Down>",   ":wincmd j<CR>",               { desc = "Move Down",              silent = true, noremap = true })
vim.keymap.set("n", "<leader><Up>",     ":wincmd k<CR>",               { desc = "Move Up",                silent = true, noremap = true })
vim.keymap.set("n", "<leader><Right>",  ":wincmd l<CR>",               { desc = "Move Right",             silent = true, noremap = true })
vim.keymap.set("n", "<leader><Left>",   ":wincmd h<CR>",               { desc = "Move Left",              silent = true, noremap = true })
vim.keymap.set("n", "<leader>wh",       ":wincmd h<CR>",               { desc = "Move Left",              silent = true, noremap = true })
vim.keymap.set("n", "<leader>wj",       ":wincmd j<CR>",               { desc = "Move Down",              silent = true, noremap = true })
vim.keymap.set("n", "<leader>wk",       ":wincmd k<CR>",               { desc = "Move Up",                silent = true, noremap = true })
vim.keymap.set("n", "<leader>wl",       ":wincmd l<CR>",               { desc = "Move Right",             silent = true, noremap = true })
vim.keymap.set("n", "<leader>w<Up>",    "<cmd>resize +4<cr>",          { desc = "Increase window height", silent = true, noremap = true })
vim.keymap.set("n", "<leader>w<Down>",  "<cmd>resize -4<cr>",          { desc = "Decrease window height", silent = true, noremap = true })
vim.keymap.set("n", "<leader>w<Left>",  "<cmd>vertical resize -4<cr>", { desc = "Decrease window width",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>w<Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width",  silent = true, noremap = true })

-- better up/down
vim.keymap.set({ "n", "x" }, "j",      "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k",      "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>",   "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>",  { desc = "Find files",          silent = true, noremap = true })
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>",    { desc = "Recent files",        silent = true, noremap = true })
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>",   { desc = "Find strings",        silent = true, noremap = true })
vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find current string", silent = true, noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",     { desc = "Find opened buffers", silent = true, noremap = true })
vim.keymap.set("n", "<leader>fm", ":Telescope man_pages<CR>",   { desc = "Search man pages",    silent = true, noremap = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>",   { desc = "Search help tags",    silent = true, noremap = true })

-- Markdown Preview
vim.keymap.set("n", "<leader>mm", ":MarkdownPreviewToggle<CR>", { desc = "Toggle MarkdownPreview", silent = true, noremap = true })

-- nvim-tree
vim.keymap.set("n", "<leader>ss", ":NvimTreeToggle<CR>",   { desc = "Toggle NvimTree",         silent = true, noremap = true })
vim.keymap.set("n", "<leader>sf", ":NvimTreeFocus<CR>",    { desc = "Focus on NvimTree",       silent = true, noremap = true })
vim.keymap.set("n", "<leader>sl", ":NvimTreeFindFile<CR>", { desc = "Locate File on NvimTree", silent = true, noremap = true })

-- venv selector
vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>",       { desc = "Select Venv",           silent = true, noremap = true })
vim.keymap.set("n", "<leader>vc", ":VenvSelectCached<CR>", { desc = "Select Venv fom Cache", silent = true, noremap = true })

-- Git
-- LazyGit
vim.keymap.set("n", "<leader>gll", ":LazyGit<CR>",            { desc = "Open Lazygit",              silent = true, noremap = true })
vim.keymap.set("n", "<leader>glL", ":LazyGitCurrentFile<CR>", { desc = "Open Lazygit project root", silent = true, noremap = true })
-- Diffview
vim.keymap.set("n", "<leader>gdd", ":DiffviewOpen <CR>",         { desc = "Open Diffview",             silent = true, noremap = true })
vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory <CR>",  { desc = "All diff history",          silent = true, noremap = true })
vim.keymap.set("n", "<leader>gdH", ":DiffviewFileHistory %<CR>", { desc = "Current file diff history", silent = true, noremap = true })
-- Gitsigns
vim.keymap.set("n",          "<leader>gh]", ":Gitsigns next_hunk<CR>",         { desc = "Next Hunk",       silent = true, noremap = true })
vim.keymap.set("n",          "<leader>gh[", ":Gitsigns prev_hunk<CR>",         { desc = "Prev Hunk",       silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>",        { desc = "Stage Hunk",      silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghS", ":Gitsigns stage_buffer<CR>",      { desc = "Stage Buffer",    silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>",        { desc = "Reset Hunk",      silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghR", ":Gitsigns reset_buffer<CR>",      { desc = "Reset Buffer",    silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghu", ":Gitsigns undo_stage_buffer<CR>", { desc = "Undo Stage Hunk", silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghd", ":Gitsigns diffthis ~<CR>",        { desc = "Diff This",       silent = true, noremap = true })

-- Buffer Navigation
vim.keymap.set("n", "<leader>b<Left>",  ":bprevious<CR>",   { desc = "Prev buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>b<Right>", ":bnext<CR>",       { desc = "Next buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bq",       ":bp<bar>bd #<CR>", { desc = "Quit buffer", silent = true, noremap = true })

-- Tab Navigation
vim.keymap.set("n", "<leader>t<Left>",  ":tabprevious<CR>", { desc = "Prev tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>t<Right>", ":tabnext<CR>",     { desc = "Next tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tq",       ":tabclose<CR>",    { desc = "Quit tab", silent = true, noremap = true })

-- Add redo break points
vim.keymap.set("i", ",", ",<C-g>u", { desc = "undo break points", silent = true, noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { desc = "undo break points", silent = true, noremap = true })
vim.keymap.set("i", ";", ";<C-g>u", { desc = "undo break points", silent = true, noremap = true })

-- Noice
vim.keymap.set("n", "<leader>nd", ":NoiceDismiss<CR>", { desc = "Close Noice Notification", silent = true, noremap = true })

-- Quit shortcuts
vim.keymap.set("n", "<leader>qq", "<cmd>wqa<CR>", { desc = "Quit all"    , silent = true, noremap = true })
vim.keymap.set("n", "<leader>qf", "<cmd>q!<CR>",  { desc = "Force quit"  , silent = true, noremap = true })
vim.keymap.set("n", "<leader>qw", "<cmd>wq<CR>",  { desc = "Write & Quit", silent = true, noremap = true })
