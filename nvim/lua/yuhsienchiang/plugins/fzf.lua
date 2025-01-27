return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    config = function()
        local actions = require("fzf-lua").actions
        require("fzf-lua").setup({
            fzf_colors = true,
            fzf_opts = {
                ["--pointer"] = " ",
                ["--cycle"] = true,
                ["--scrollbar"] = " ",
            },
            keymap = {
                builtin = {
                    false,
                    ["<C-n>"] = "preview-down",
                    ["<C-p>"] = "preview-up",
                },
                fzf = {
                    false,
                    ["ctrl-n"] = "preview-down",
                    ["ctrl-p"] = "preview-up",
                },
            },
            files = {
                prompt = " 󰍉 ",
                cwd_prompt = false,
                file_icons = "devicons",
                git_icons = false,
                no_header_i = true,
                winopts = {
                    height = 0.5,
                    width = 0.5,
                    row = 0.55, -- window row position (0=top, 1=bottom)
                    col = 0.50, -- window col position (0=left, 1=right)
                    border = "single",
                    backdrop = 100,
                    title = " Find ",
                    title_pos = "center",
                    preview = { hidden = "hidden" },
                },
            },
            oldfiles = {
                prompt = " 󰍉 ",
                cwd_only = false,
                stat_file = true, -- verify files exist on disk
                include_current_session = true, -- include bufs from current session
                winopts = {
                    height = 0.5,
                    width = 0.5,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title = " Recents ",
                    title_pos = "center",
                    preview = { hidden = "hidden" },
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
                winopts = {
                    height = 0.5,
                    width = 0.5,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title = " Buffers ",
                    title_pos = "center",
                    preview = { hidden = "hidden" },
                },
                actions = {
                    ["ctrl-x"] = false,
                    ["ctrl-d"] = { actions.buf_del, actions.resume },
                },
            },
            grep = {
                prompt = " 󰍉 ",
                glob_separator = "  ",
                fzf_opts = { ["--layout"] = "reverse-list" },
                live_ast_prefix = false,
                no_header_i = true,
                previewer = "bat",
                winopts = {
                    height = 0.8,
                    width = 0.8,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title = " Grep ",
                    title_pos = "center",
                    preview = {
                        border = "border", -- border|noborder, applies only to
                        horizontal = "right:50%", -- right|left:size
                        layout = "horizontal", -- horizontal|vertical|flex
                        title = true, -- preview border title (file/buf)?
                        title_pos = "center", -- left|center|right, title alignment
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
                        border = "border", -- border|noborder, applies only to
                        horizontal = "right:50%", -- right|left:size
                        layout = "horizontal", -- horizontal|vertical|flex
                        title = true, -- preview border title (file/buf)?
                        title_pos = "center", -- left|center|right, title alignment
                    },
                },
            },

            helptags = {
                prompt = " 󰍉 ",
                fzf_opts = { ["--layout"] = "reverse-list" },
                winopts = {
                    height = 0.8,
                    width = 0.8,
                    row = 0.55,
                    col = 0.50,
                    border = "single",
                    backdrop = 100,
                    title = " Help ",
                    title_pos = "center",
                    preview = {
                        border = "border", -- border|noborder, applies only to
                        horizontal = "right:50%", -- right|left:size
                        layout = "horizontal", -- horizontal|vertical|flex
                        title = true, -- preview border title (file/buf)?
                        title_pos = "center", -- left|center|right, title alignment
                    },
                },
            },
        })
    end,
}
