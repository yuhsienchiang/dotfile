return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 900,
    opts = {
        styles = {
            notification = {
                border = "single",
            },
        },
        scope = { debounce = 50 },

        quickfile = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        indent = {
            indent = {
                enabled = true,
                char = "▏",
                blank = " ",
            },
            scope = {
                enabled = true, -- enable highlighting the current scope
                animate = { enabled = false },
                char = "▏",
                underline = false, -- underline the start of the scope
                only_current = true, -- only show scope in the current window
            },
        },
        statuscolumn = {
            enabled = true,
            folds = {
                open = false, -- show open fold icons
                git_hl = true,
            },
        },
        words = {
            enabled = true,
            debounce = 200,
            modes = { "n", "i", "c" }, -- modes to show references
        },
        dashboard = {
            preset = {
                pick = "telescope.nvim",
                keys = {
                    { icon = "󰙅 ", key = "s", desc = "Explorer", action = ":NvimTreeToggle" },
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "w", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')", },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles', {only_cwd=true})", },
                    { icon = " ", key = "u", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil, },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = [[
 ██████╗ ██████╗ ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║     ██║   ██║██║  ██║█████╗  
██║     ██║   ██║██║  ██║██╔══╝  
╚██████╗╚██████╔╝██████╔╝███████╗
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝

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
                {
                    pane = 1,
                    text = "Pause and Pray | Jesus over everything",
                    align = "center",
                    hl = "SnacksDashboardFooter",
                },
                { pane = 2, section = "keys", title = "Quick", padding = 1 },
                { pane = 2, section = "recent_files", title = "Recent Files", cwd = true, limit = 5, padding = 1 },
                { pane = 2, section = "startup" },
            },
        },
    },
}
