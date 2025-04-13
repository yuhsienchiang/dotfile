return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    config = function()
        local actions = require("fzf-lua").actions
        require("fzf-lua").setup({
            fzf_colors = true,
            fzf_opts = {
                ["--pointer"] = "▎",
                ["--cycle"] = true,
                ["--scrollbar"] = " ",
            },
            keymap = {
                builtin = {
                    false,
                    ["<C-f>"] = "preview-down",
                    ["<C-b>"] = "preview-up",
                    ["<C-o>"] = "toggle-preview",
                },
                fzf = {
                    false,
                    ["ctrl-f"] = "preview-down",
                    ["ctrl-b"] = "preview-up",
                    ["ctrl-o"] = "toggle-preview",
                },
            },
            files = {
                prompt = " 󰍉 ",
                cwd_prompt = false,
                file_icons = "devicons",
                git_icons = false,
                no_header_i = true,
                hidden = true,
                follow = true,
                -- previewer = "bat",
                no_ignore = false,
                winopts = {
                    height = 0.4,
                    width = 1,
                    row = 1, -- window row position (0=top, 1=bottom)
                    col = 0, -- window col position (0=left, 1=right)
                    border = { "─", "─", "─", " ", " ", " ", " ", " " },
                    backdrop = 100,
                    title = " Find ",
                    title_pos = "center",
                    preview = {
                        hidden = "hidden",
                        border = { "┬", "─", "─", " ", " ", " ", "│", "│" },
                        title = false,
                        horizontal = "right:50%", -- right|left:size
                        scrollbar = false,
                        winopts = { number = false, relativenumber = false },
                    },
                },
            },
            oldfiles = {
                prompt = " 󰍉 ",
                cwd_only = false,
                stat_file = true, -- verify files exist on disk
                include_current_session = true, -- include bufs from current session
                -- previewer = "bat",
                winopts = {
                    height = 0.4,
                    width = 1,
                    row = 1,
                    col = 0,
                    border = { "─", "─", "─", " ", " ", " ", " ", " " },
                    backdrop = 100,
                    title = " Recents ",
                    title_pos = "center",
                    preview = {
                        hidden = "hidden",
                        border = { "┬", "─", "─", " ", " ", " ", "│", "│" },
                        title = false,
                        horizontal = "right:50%", -- right|left:size
                        scrollbar = false,
                        winopts = { number = false, relativenumber = false },
                    },
                },
                actions = {
                    ["enter"] = actions.file_edit,
                },
            },
            buffers = {
                prompt = " 󰍉 ",
                file_icons = "devicons", -- show file icons (true|"devicons"|"mini")?
                color_icons = true, -- colorize file|git icons
                sort_lastused = true, -- sort buffers() by last used
                show_unloaded = true, -- show unloaded buffers
                cwd_only = false, -- buffers for the cwd only
                cwd = nil, -- buffers list for a given dir
                no_header_i = true,
                -- previewer = "bat",
                winopts = {
                    height = 0.4,
                    width = 1,
                    row = 1,
                    col = 0,
                    border = { "─", "─", "─", " ", " ", " ", " ", " " },
                    backdrop = 100,
                    title = " Buffers ",
                    title_pos = "center",
                    preview = {
                        hidden = "hidden",
                        border = { "┬", "─", "─", " ", " ", " ", "│", "│" },
                        title = false,
                        horizontal = "right:50%", -- right|left:size
                        scrollbar = false,
                        winopts = { number = false, relativenumber = false },
                    },
                },
                actions = {
                    ["ctrl-x"] = false,
                    ["ctrl-d"] = { actions.buf_del, actions.resume },
                },
            },
            grep = {
                prompt = " 󰍉 ",
                glob_separator = "  ",
                live_ast_prefix = false,
                no_header_i = true,
                fzf_opts = {
                    ["--delimiter"] = "[\\):]",
                    ["--with-nth"] = "1,2,3",
                },
                previewer = "bat",
                hidden = true, -- enable hidden files by default
                follow = true, -- do not follow symlinks by default
                no_ignore = false, -- respect ".gitignore"  by default
                formatter = "path.dirname_first",
                winopts = {
                    height = 0.6,
                    width = 1,
                    row = 1,
                    col = 0,
                    border = { "─", "─", "─", " ", " ", " ", " ", " " },
                    backdrop = 100,
                    title = " Grep ",
                    title_pos = "center",
                    preview = {
                        border = { "┬", "─", "─", " ", " ", " ", "│", "│" },
                        horizontal = "right:50%", -- right|left:size
                        layout = "horizontal", -- horizontal|vertical|flex
                        title = true, -- preview border title (file/buf)?
                        title_pos = "center", -- left|center|right, title alignment
                        scrollbar = false,
                        winopts = { number = false, relativenumber = false },
                    },
                },
            },
            manpages = {
                prompt = " 󰍉 ",
                winopts = {
                    height = 0.4,
                    width = 1,
                    row = 1,
                    col = 0,
                    border = { "─", "─", "─", " ", " ", " ", " ", " " },
                    backdrop = 100,
                    title = " Man ",
                    title_pos = "center",
                    preview = {
                        border = { "┬", "─", "─", " ", " ", " ", "│", "│" },
                        horizontal = "right:50%", -- right|left:size
                        layout = "horizontal", -- horizontal|vertical|flex
                        title = true, -- preview border title (file/buf)?
                        title_pos = "center", -- left|center|right, title alignment
                        scrollbar = false,
                    },
                },
            },
            helptags = {
                prompt = " 󰍉 ",
                winopts = {
                    height = 0.4,
                    width = 1,
                    row = 1,
                    col = 0,
                    border = { "─", "─", "─", " ", " ", " ", " ", " " },
                    backdrop = 100,
                    title = " Help ",
                    title_pos = "center",
                    preview = {
                        border = { "┬", "─", "─", " ", " ", " ", "│", "│" },
                        horizontal = "right:50%", -- right|left:size
                        layout = "horizontal", -- horizontal|vertical|flex
                        title = true, -- preview border title (file/buf)?
                        title_pos = "center", -- left|center|right, title alignment
                        scrollbar = false,
                    },
                },
            },
            lsp = {
                prompt = " 󰍉 ",
                title_prefix = " LSP",
                formatter = "path.filename_first",
                jump1 = false,
                winopts = {
                    height = 0.6,
                    width = 0.6,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title_pos = "center",
                    preview = {
                        border = "single",
                        horizontal = "right:50%",
                        layout = "horizontal",
                        scrollbar = false,
                        winopts = { number = false, relativenumber = false },
                    },
                },
                finder = {
                    prompt = " 󰍉 ",
                    formatter = "path.filename_first",
                    providers = {
                        { "definitions", prefix = "[0;33mDEF [0m" },
                        { "implementations", prefix = "[0;32mIMP [0m" },
                        { "references", prefix = "[0;34mREF [0m" },
                    },
                    winopts = {
                        height = 0.6,
                        width = 0.6,
                        row = 0.55,
                        col = 0.50,
                        border = "single",
                        backdrop = 100,
                        title = " LSP Finder ",
                        title_pos = "center",
                        preview = {
                            border = "single",
                            horizontal = "right:50%",
                            layout = "horizontal",
                            scrollbar = false,
                            winopts = { number = false, relativenumber = false },
                        },
                    },
                },
            },
        })

        require("fzf-lua").register_ui_select(function(fzf_opts, items)
            return vim.tbl_deep_extend("force", fzf_opts, {
                winopts = {
                    border = "single",
                    backdrop = 100,
                    title_pos = "center",
                },
            }, fzf_opts.kind == "codeaction" and {
                winopts = {
                    layout = "vertical",
                    height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
                    width = 0.3,
                },
            } or {
                winopts = {
                    width = 0.3,
                    height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
                },
            })
        end
)
    end,
}
