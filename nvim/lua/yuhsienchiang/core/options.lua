local opt = vim.opt
local g = vim.g

opt.timeout = true
opt.timeoutlen = 500

-- line numbers
opt.relativenumber = true
opt.number = true
opt.ruler = false

-- tabs & indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.shiftround = true
opt.autoindent = true

-- text format
opt.breakindent = true
opt.breakindentopt = "list:-1"
opt.wrap = false
opt.formatoptions = "jcrqt"
opt.iskeyword:append("-")
opt.whichwrap:append("<>[]hl") -- go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line

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
opt.pumheight = 10
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.jumpoptions = "view"
opt.wildmode = "longest:full,full" -- command-line completion mode
opt.winminwidth = 5

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen"

-- undo settings
opt.undofile = true
opt.undolevels = 10000

-- buffer unload behavior
opt.hidden = true

-- session options
opt.sessionoptions = { "buffers", "tabpages", "winsize", "help" }

-- listchars
opt.list = true
opt.listchars:append("eol:↴")
opt.listchars:append("space: ")
opt.fillchars = { eob = " ", foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱" }

-- disable default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
