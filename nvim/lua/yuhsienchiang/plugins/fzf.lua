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
                    ["<C-n>"] = "preview-down",
                    ["<C-p>"] = "preview-up",
                    ["<C-o>"] = "toggle-preview",
                },
                fzf = {
                    false,
                    ["ctrl-n"] = "preview-down",
                    ["ctrl-p"] = "preview-up",
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
                    height = 0.35,
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
                    height = 0.35,
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
                    height = 0.35,
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
                fzf_opts = {
                    ["--layout"] = "reverse-list",
                    ["--keep-right"] = true,
                },
                live_ast_prefix = false,
                no_header_i = true,
                -- previewer = "bat",
                hidden = true, -- enable hidden files by default
                follow = true, -- do not follow symlinks by default
                no_ignore = false, -- respect ".gitignore"  by default
                multiline = true,
                winopts = {
                    height = 0.8,
                    width = 0.9,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title = " Grep ",
                    title_pos = "center",
                    preview = {
                        border = "single",
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
                fzf_opts = { ["--layout"] = "reverse-list" },
                winopts = {
                    height = 0.8,
                    width = 0.8,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title = " Man ",
                    title_pos = "center",
                    preview = {
                        border = "single",
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
                fzf_opts = { ["--layout"] = "reverse-list" },
                winopts = {
                    height = 0.8,
                    width = 0.9,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title = " Help ",
                    title_pos = "center",
                    preview = {
                        border = "single", -- border|noborder, applies only to
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
    end,
}
