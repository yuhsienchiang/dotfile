return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        styles = {
            notification = { border = "single" },
        },
        quickfile = { enabled = true },
        notifier = { enabled = true },
        words = { enabled = true },
        -- scope library
        scope = {
            min_size = 1,
            debounce = 50,
            treesitter = {
                enabled = true,
                blocks = { enabled = true },
                field_blocks = { "local_declaration" },
            },
        },
        indent = {
            indent = {
                enabled = true,
                char = "▏",
            },
            animate = { enabled = false },
            scope = {
                enabled = true, -- enable highlighting the current scope
                char = "▏",
                only_current = true, -- only show scope in the current window
            },
        },
        statuscolumn = {
            enabled = true,
            folds = { git_hl = true },
        },
        dashboard = {
            preset = {
                pick = function(cmd, opts)
                    require("fzf-lua")[cmd](opts)
                end,
                keys = {
                    { icon = "󰙅 ", key = "s", desc = "Explorer", action = ":NvimTreeToggle" },
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    {
                        icon = " ",
                        key = "w",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep_glob', {winopts={title=' Live Multi-Grep '}})",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles', {cwd_only=true})",
                    },
                    { icon = " ", key = "u", desc = "Restore Session", section = "session" },
                    {
                        icon = "󰒲 ",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = [[
 ██████╗ ██████╗ ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║     ██║   ██║██║  ██║█████╗  
██║     ██║   ██║██║  ██║██╔══╝  
╚██████╗╚██████╔╝██████╔╝███████╗
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]],
            },
            formats = {
                icon = function(item)
                    if item.file and item.icon == "file" or item.icon == "directory" then
                        return { "", hl = "icon", width = 0 }
                    end
                    return { item.icon, width = 0, hl = "icon" }
                end,
            },
            sections = {
                { pane = 1, section = "header" },
                { pane = 1, section = "keys", title = "Quick", padding = 1 },
                -- { pane = 2, section = "recent_files", title = "Recent Files", cwd = true, limit = 5, padding = 1 },
                {
                    pane = 1,
                    text = { "Pause and Pray | Jesus over everything", hl = "SnacksDashboardFooter" },
                    align = "center",
                },
                { pane = 1, section = "startup" },
            },
        },
    },
}
