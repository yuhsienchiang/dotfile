local Util = require("yuhsienchiang.util.keymap")
local Util_harpoon = require("yuhsienchiang.util.harpoon_action")

-- use <ESC> to clear search highlight
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true, noremap = true })

-- Better
-- better yank/delete/replace
vim.keymap.set("n", "x", '"_x', { desc = "Delete without yanking",  silent = true, noremap = true })
vim.keymap.set("x", "p", "P",   { desc = "Replace without yanking", silent = true, noremap = true })

-- better n/N: set n to always search forward and N to always search backwards
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { desc = "Next search result", expr = true, silent = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]",      { desc = "Next search result", expr = true, silent = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]",      { desc = "Next search result", expr = true, silent = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { desc = "Prev search result", expr = true, silent = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]",      { desc = "Prev search result", expr = true, silent = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]",      { desc = "Prev search result", expr = true, silent = true })

-- better up/down
vim.keymap.set({ "n", "x" }, "j",      "v:count == 0 ? 'gj' : 'j'", { desc = "Better Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Better Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k",      "v:count == 0 ? 'gk' : 'k'", { desc = "Better Up",   expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>",   "v:count == 0 ? 'gk' : 'k'", { desc = "Better Up",   expr = true, silent = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==",        { desc = "Move Down", silent = true })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv",        { desc = "Move Down", silent = true })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==",        { desc = "Move Up",   silent = true })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up",   silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv",        { desc = "Move Up",   silent = true })

-- Don't override last yank when deleting empty line
vim.keymap.set("n", "dd", Util.smart_dd, { noremap = true, expr = true})

-- smart cursor movement
vim.keymap.set({ "n", "v", "x", "o" },      "<C-l>", "$",               { desc = "Far Right",  silent = true, noremap = true })
vim.keymap.set("i",                         "<C-l>", "<C-o>$",          { desc = "Far Right",  silent = true, noremap = true })
vim.keymap.set({ "n", "v", "i", "x", "o" }, "<C-h>", Util.smart_cursor, { desc = "Far Left",   silent = true, noremap = true })
vim.keymap.set({ "n", "v", "x", "o" },      "<C-k>", "gg",              { desc = "Far Top",    silent = true, noremap = true })
vim.keymap.set("i",                         "<C-k>", "<C-o>gg",         { desc = "Far Top",    silent = true, noremap = true })
vim.keymap.set({ "n", "v", "x", "o" },      "<C-j>", "G",               { desc = "Far Bottom", silent = true, noremap = true })
vim.keymap.set("i",                         "<C-j>", "<C-o>G",          { desc = "Far Bottom", silent = true, noremap = true })

-- Window
-- Window Navigation
vim.keymap.set("n", "<leader>wh", ":wincmd h<CR>", { desc = "Move Left",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>wj", ":wincmd j<CR>", { desc = "Move Down",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>wk", ":wincmd k<CR>", { desc = "Move Up",    silent = true, noremap = true })
vim.keymap.set("n", "<leader>wl", ":wincmd l<CR>", { desc = "Move Right", silent = true, noremap = true })
-- Window Split
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>",    { desc = "Split Window Vertical",   silent = true, noremap = true })
vim.keymap.set("n", "<leader>ws", ":split<CR>",     { desc = "Split Window Horizontal", silent = true, noremap = true })
vim.keymap.set("n", "<leader>wt", ":tab split<CR>", { desc = "Open Window Tab",         silent = true, noremap = true })
-- Window Resize
vim.keymap.set("n", "<leader>wK", "<cmd>resize +4<cr>",          { desc = "Increase window height", silent = true, noremap = true })
vim.keymap.set("n", "<leader>wJ", "<cmd>resize -4<cr>",          { desc = "Decrease window height", silent = true, noremap = true })
vim.keymap.set("n", "<leader>wH", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>wL", "<cmd>vertical resize +4<cr>", { desc = "Increase window width",  silent = true, noremap = true })

-- Buffer Navigation
vim.keymap.set("n", "<leader>b<Left>",  ":bprevious<CR>",   { desc = "Prev buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bh",       ":bprevious<CR>",   { desc = "Prev buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>b<Right>", ":bnext<CR>",       { desc = "Next buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bl",       ":bnext<CR>",       { desc = "Next buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bq",       ":bp<bar>bd #<CR>", { desc = "Quit buffer", silent = true, noremap = true })

-- Tab Navigation
vim.keymap.set("n", "<leader>t<Left>",  ":tabprevious<CR>", { desc = "Prev tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>th",       ":tabprevious<CR>", { desc = "Prev tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>t<Right>", ":tabnext<CR>",     { desc = "Next tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tl",       ":tabnext<CR>",     { desc = "Next tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tq",       ":tabclose<CR>",    { desc = "Quit tab", silent = true, noremap = true })

-- Add redo break points
vim.keymap.set("i", ",", ",<C-g>u", { desc = "undo break points", silent = true, noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { desc = "undo break points", silent = true, noremap = true })
vim.keymap.set("i", ";", ";<C-g>u", { desc = "undo break points", silent = true, noremap = true })

-- Quit shortcuts
vim.keymap.set("n", "<leader>qq", "<cmd>wqa<CR>", { desc = "Write all & Quit", silent = true, noremap = true })
vim.keymap.set("n", "<leader>qf", "<cmd>q!<CR>",  { desc = "Force Quit",       silent = true, noremap = true })
vim.keymap.set("n", "<leader>qw", "<cmd>wq<CR>",  { desc = "Write & Quit",     silent = true, noremap = true })
-- Plugins
-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>",                                        { desc = "Find files",          silent = true, noremap = true })
vim.keymap.set("n", "<leader>fr", ":lua require('telescope.builtin').oldfiles({only_cwd=true})<CR>",  { desc = "Recent files (CWD)",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>fR", ":lua require('telescope.builtin').oldfiles({only_cwd=false})<CR>", { desc = "Recent files",        silent = true, noremap = true })
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>",                                         { desc = "Find strings",        silent = true, noremap = true })
vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>",                                       { desc = "Find current string", silent = true, noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",                                           { desc = "Find opened buffers", silent = true, noremap = true })
vim.keymap.set("n", "<leader>fm", ":Telescope man_pages<CR>",                                         { desc = "Search man pages",    silent = true, noremap = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>",                                         { desc = "Search help tags",    silent = true, noremap = true })

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
vim.keymap.set("n", "<leader>gdq", ":tabclose<CR>",              { desc = "Quit Diffview",             silent = true, noremap = true })
-- Gitsigns
vim.keymap.set("n",          "<leader>gh]", ":Gitsigns next_hunk<CR>",         { desc = "Next Hunk",         silent = true, noremap = true })
vim.keymap.set("n",          "<leader>gh[", ":Gitsigns prev_hunk<CR>",         { desc = "Prev Hunk",         silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>",        { desc = "Stage Hunk",        silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>",   { desc = "Undo Stage Hunk",   silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghS", ":Gitsigns stage_buffer<CR>",      { desc = "Stage Buffer",      silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghU", ":Gitsigns undo_stage_buffer<CR>", { desc = "Undo Stage Buffer", silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>",        { desc = "Reset Hunk",        silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghR", ":Gitsigns reset_buffer<CR>",      { desc = "Reset Buffer",      silent = true, noremap = true })
vim.keymap.set("n",          "<leader>ghd", ":Gitsigns diffthis ~<CR>",        { desc = "Diff This",         silent = true, noremap = true })

-- Noice
vim.keymap.set("n", "<leader>nd", ":NoiceDismiss<CR>", { desc = "Close Noice Notification",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>nh", ":NoiceHistory<CR>", { desc = "Show Notification History", silent = true, noremap = true })
vim.keymap.set("n", "<leader>nl", ":NoiceLast<CR>",    { desc = "Show Last Notification",    silent = true, noremap = true })

-- Harpoon
vim.keymap.set("n", "<leader>hh", Util_harpoon.harpoon_telescope,                     { desc = "Harpoon Menu", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ha", Util_harpoon.harpoon_add,                           { desc = "Harpoon Add", silent = true, noremap = true })
vim.keymap.set("n", "<leader>hk", function() require("harpoon"):list():prev() end,    { desc = "Harpoon Prev", silent = true, noremap = true })
vim.keymap.set("n", "<leader>hj", function() require("harpoon"):list():next() end,    { desc = "Harpoon Next", silent = true, noremap = true })
vim.keymap.set("n", "<leader>h1", function() require("harpoon"):list():select(1) end, { desc = "File 1", silent = true, noremap = true })
vim.keymap.set("n", "<leader>h1", function() require("harpoon"):list():select(2) end, { desc = "File 1", silent = true, noremap = true })
vim.keymap.set("n", "<leader>h1", function() require("harpoon"):list():select(3) end, { desc = "File 1", silent = true, noremap = true })
vim.keymap.set("n", "<leader>h1", function() require("harpoon"):list():select(4) end, { desc = "File 1", silent = true, noremap = true })

-- Dap
vim.keymap.set("n",  "<leader>ub", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint",       silent = true, noremap = true })
vim.keymap.set("n",  "<leader>uc", function() require("dap").continue() end,          { desc = "Continue",                silent = true, noremap = true })
vim.keymap.set("n",  "<leader>uC", function() require("dap").run_to_cursor() end,     { desc = "Run to Cursor",           silent = true, noremap = true })
vim.keymap.set("n",  "<leader>ug", function() require("dap").goto_() end,             { desc = "Go to line (no execute)", silent = true, noremap = true })
vim.keymap.set("n",  "<leader>ui", function() require("dap").step_into() end,         { desc = "Step Into",               silent = true, noremap = true })
vim.keymap.set("n",  "<leader>uj", function() require("dap").down() end,              { desc = "Down",                    silent = true, noremap = true })
vim.keymap.set("n",  "<leader>uk", function() require("dap").up() end,                { desc = "Up",                      silent = true, noremap = true })
vim.keymap.set("n",  "<leader>ul", function() require("dap").run_last() end,          { desc = "Run Last",                silent = true, noremap = true })
vim.keymap.set("n",  "<leader>uo", function() require("dap").step_out() end,          { desc = "Step Out",                silent = true, noremap = true })
vim.keymap.set("n",  "<leader>uO", function() require("dap").step_over() end,         { desc = "Step Over",               silent = true, noremap = true })
vim.keymap.set("n",  "<leader>up", function() require("dap").pause() end,             { desc = "Pause",                   silent = true, noremap = true })
vim.keymap.set("n",  "<leader>us", function() require("dap").session() end,           { desc = "Session",                 silent = true, noremap = true })
vim.keymap.set("n",  "<leader>ut", function() require("dap").terminate() end,         { desc = "Terminate",               silent = true, noremap = true })

-- Conform
vim.keymap.set({"n", "v"}, "<leader>ef", function() require("conform").format({ lsp_fallback = true, timeout_ms = 3000 }) end, { desc = "Format", silent = true, noremap = true })

-- Flash
vim.keymap.set({ "n", "o", "x" }, "s", function() require("flash").jump() end,       { desc = "Flash",            silent = true, noremap = true })
vim.keymap.set({ "n", "o", "x" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter", silent = true, noremap = true })
