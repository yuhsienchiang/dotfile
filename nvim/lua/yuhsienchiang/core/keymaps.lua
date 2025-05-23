local Util_keymap = require("yuhsienchiang.util.keymap_util")
local Util_harpoon = require("yuhsienchiang.util.harpoon_util")
local Util_venv = require("yuhsienchiang.util.venv_util")
local Util_todo = require("yuhsienchiang.util.todo_util")

-- use <ESC> to clear search highlight
vim.keymap.set({ "i", "n" }, "<esc>", Util_keymap.esc_cmd, { desc = "Escape, clear hlsearch, and clear notification", silent = true, noremap = true })

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

-- smart cursor movement
vim.keymap.set({ "n", "v", "x", "o" },      "<C-l>", "$",                      { desc = "Far Right", silent = true, noremap = true })
vim.keymap.set("i",                         "<C-l>", "<C-o>$",                 { desc = "Far Right", silent = true, noremap = true })
vim.keymap.set({ "n", "v", "i", "x", "o" }, "<C-h>", Util_keymap.smart_cursor, { desc = "Smart Left",  silent = true, noremap = true })

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
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>",   { desc = "Prev buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bl", ":bnext<CR>",       { desc = "Next buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bq", ":bp<bar>bd #<CR>", { desc = "Quit buffer", silent = true, noremap = true })

-- Tab Navigation
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { desc = "Prev tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>",     { desc = "Next tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>",    { desc = "Quit tab", silent = true, noremap = true })

-- Add redo break points
vim.keymap.set("i", ",", ",<C-g>u", { desc = "undo break points", silent = true, noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { desc = "undo break points", silent = true, noremap = true })
vim.keymap.set("i", ";", ";<C-g>u", { desc = "undo break points", silent = true, noremap = true })

-- Quit shortcuts
vim.keymap.set("n", "<leader>qq", "<cmd>xa<CR>", { desc = "Write all & Quit", silent = true, noremap = true })
vim.keymap.set("n", "<leader>qf", "<cmd>q!<CR>", { desc = "Force Quit",       silent = true, noremap = true })
vim.keymap.set("n", "<leader>qw", "<cmd>x<CR>",  { desc = "Write & Quit",     silent = true, noremap = true })

-- Plugins
-- Fzf
vim.keymap.set("n", "<leader>ff", function ()require("fzf-lua").files() end,                                                 { desc = "Find files",          silent = true, noremap = true })
vim.keymap.set("n", "<leader>fr", function ()require("fzf-lua").oldfiles({ cwd_only = true }) end,                           { desc = "Recent files (CWD)",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>fR", function ()require("fzf-lua").oldfiles() end,                                              { desc = "Recent files",        silent = true, noremap = true })
vim.keymap.set("n", "<leader>fs", function () require("fzf-lua").live_grep_glob({ winopts = { title = " Live Grep " }}) end, { desc = "Live Grep",           silent = true, noremap = true })
vim.keymap.set("n", "<leader>fc", ":FzfLua grep_cword<CR>",                                                                  { desc = "Find current string", silent = true, noremap = true })
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>",                                                                     { desc = "Find opened buffers", silent = true, noremap = true })
vim.keymap.set("n", "<leader>fm", ":FzfLua manpages<CR>",                                                                    { desc = "Search man pages",    silent = true, noremap = true })
vim.keymap.set("n", "<leader>fh", ":FzfLua helptags<CR>",                                                                    { desc = "Search help tags",    silent = true, noremap = true })

-- Markdown Preview
vim.keymap.set("n", "<leader>mm", ":Markview Toggle<CR>",      { desc = "Toggle Markdown",        silent = true, noremap = true })
vim.keymap.set("n", "<leader>ms", ":Markview splitToggle<CR>", { desc = "Toggle Markdown Split",  silent = true, noremap = true })

-- nvim-tree
vim.keymap.set("n", "<leader>ss", ":NvimTreeToggle<CR>",   { desc = "Toggle NvimTree",         silent = true, noremap = true })
vim.keymap.set("n", "<leader>sf", ":NvimTreeFocus<CR>",    { desc = "Focus on NvimTree",       silent = true, noremap = true })
vim.keymap.set("n", "<leader>sl", ":NvimTreeFindFile<CR>", { desc = "Locate File on NvimTree", silent = true, noremap = true })

-- oil
vim.keymap.set("n", "-", function () require("oil").toggle_float() end, { desc = "Oil", silent = true, noremap = true })

-- venv selector
vim.keymap.set("n", "<leader>vv", Util_venv.venv_selector_fzf, { desc = "Select Venv", silent = true, noremap = true })

-- Git
-- Diffview
vim.keymap.set("n", "<leader>gdd", ":DiffviewOpen <CR>",         { desc = "Open Diffview",             silent = true, noremap = true })
vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory <CR>",  { desc = "All diff history",          silent = true, noremap = true })
vim.keymap.set("n", "<leader>gdH", ":DiffviewFileHistory %<CR>", { desc = "Current file diff history", silent = true, noremap = true })
vim.keymap.set("n", "<leader>gdq", ":DiffviewClose<CR>",         { desc = "Quit Diffview",             silent = true, noremap = true })
-- Gitsigns
vim.keymap.set("n", "<leader>gh]", function () require("gitsigns").nav_hunk("next") end,                                 { desc = "Next Hunk",         silent = true, noremap = true })
vim.keymap.set("n", "<leader>gh[", function () require("gitsigns").nav_hunk("prev") end,                                 { desc = "Prev Hunk",         silent = true, noremap = true })
vim.keymap.set("n", "<leader>ghs", function () require("gitsigns").stage_hunk() end,                                     { desc = "Toggle Stage Hunk", silent = true, noremap = true })
vim.keymap.set("v", "<leader>ghs", function () require("gitsigns").stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, { desc = "Toggle Stage Hunk", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ghr", function () require("gitsigns").reset_hunk() end,                                     { desc = "Reset Hunk",        silent = true, noremap = true })
vim.keymap.set("v", "<leader>ghr", function () require("gitsigns").reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, { desc = "Reset Hunk",        silent = true, noremap = true })
vim.keymap.set("n", "<leader>ghS", function () require("gitsigns").stage_buffer() end,                                   { desc = "Stage Buffer",      silent = true, noremap = true })
vim.keymap.set("n", "<leader>ghR", function () require("gitsigns").reset_buffer() end,                                   { desc = "Reset Buffer",      silent = true, noremap = true })
vim.keymap.set("n", "<leader>ghd", function () require("gitsigns").diffthis("~") end,                                    { desc = "Diff against last commit",         silent = true, noremap = true })
vim.keymap.set("n", "<leader>ghD", function () require("gitsigns").diffthis() end,                                       { desc = "Diff against the index",         silent = true, noremap = true })
vim.keymap.set("n", "<leader>ght", function () require("gitsigns").preview_hunk_inline() end,                            { desc = "Toggle Deleted",    silent = true, noremap = true })
-- lazygit
vim.keymap.set("n", "<leader>gll", function () require("snacks").lazygit() end, { desc = "Open lazygit", silent = true, noremap = true })

-- Harpoon
vim.keymap.set("n", "<leader>Hh", Util_harpoon.fzf.harpoon_fzf,                       { desc = "Harpoon Menu",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>Ha", Util_harpoon.action.harpoon_add,                    { desc = "Harpoon Add",   silent = true, noremap = true })
vim.keymap.set("n", "<leader>Hc", Util_harpoon.action.harpoon_clear,                  { desc = "Harpoon Clear", silent = true, noremap = true })
vim.keymap.set("n", "<leader>Hk", function() require("harpoon"):list():prev() end,    { desc = "Harpoon Prev",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>Hj", function() require("harpoon"):list():next() end,    { desc = "Harpoon Next",  silent = true, noremap = true })
vim.keymap.set("n", "<leader>H1", function() require("harpoon"):list():select(1) end, { desc = "File 1", silent = true, noremap = true })
vim.keymap.set("n", "<leader>H2", function() require("harpoon"):list():select(2) end, { desc = "File 2", silent = true, noremap = true })
vim.keymap.set("n", "<leader>H3", function() require("harpoon"):list():select(3) end, { desc = "File 3", silent = true, noremap = true })
vim.keymap.set("n", "<leader>H4", function() require("harpoon"):list():select(4) end, { desc = "File 4", silent = true, noremap = true })

-- Todo
vim.keymap.set("n", "<leader>nn", Util_todo.todo_fzf_all,         { desc = "Toggle Todo (All)",    silent = true, noremap = true })
vim.keymap.set("n", "<leader>nN", Util_todo.todo_fzf_select,      { desc = "Toggle Todo (Select)", silent = true, noremap = true })
vim.keymap.set("n", "<leader>nq", ":Trouble quickfix toggle<CR>", { desc = "Toggle Quickfix (Trouble)", silent = true, noremap = true })

-- Conform
vim.keymap.set({"n", "v"}, "<leader>ef", function() require("conform").format({ timeout_ms = 3000 }) end, { desc = "Format", silent = true, noremap = true })

-- Copilot
vim.keymap.set("n", "<leader>cc", ":Copilot enable<CR>",  { desc = "Copilot enable", silent = true, noremap = true })
vim.keymap.set("n", "<leader>cC", ":Copilot disable<CR>", { desc = "Copilot disable", silent = true, noremap = true })

-- Flash
vim.keymap.set({ "n", "o", "x" }, "s", function() require("flash").jump() end,       { desc = "Flash",            silent = true, noremap = true })
vim.keymap.set({ "n", "o", "x" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter", silent = true, noremap = true })

-- treewalker
vim.keymap.set({ "n", "v" }, "<leader>k", function () require("treewalker").move_up() end,   { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>j", function () require("treewalker").move_down() end, { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>h", function () require("treewalker").move_out() end,  { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>l", function () require("treewalker").move_in() end,   { silent = true, noremap = true })
