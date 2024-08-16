local opt = vim.opt

opt.timeout = true
opt.timeoutlen = 500

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- text format
opt.breakindent = true
opt.breakindentopt = "list:-1"
opt.wrap = false
opt.formatoptions = "jcrqt"
opt.iskeyword:append("-")

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

-- fold
opt.foldlevel = 99
opt.foldmethod = "indent"

-- cursor
opt.cursorline = true
opt.virtualedit = "block"

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.showmode = false
opt.pumblend = 10
opt.pumheight = 10
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.splitkeep = "screen"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

-- undo settings
opt.undofile = true
opt.undolevels = 10000

opt.hidden = true
opt.wildmode = "longest:full,full"

-- session options for persistence.nvim
opt.sessionoptions = { "buffers", "tabpages", "winsize", "help" }

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space: ")
