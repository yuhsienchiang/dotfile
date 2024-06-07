return {
    "linux-cultist/venv-selector.nvim",
    cmd = { "VenvSelect" },
    branch = "regexp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local selector = require("venv-selector")
        selector.setup({
            settings = {
                options = {
                    enable_cached_venvs = false,
                    notify_user_on_venv_activation = true,
                },
                search = {
                    pyenv = {
                        command = "fd 'versions/([0-9a-z_.]+)/bin/python$' ~/.pyenv/versions -p -i -L --color never -d 3",
                    },
                    cwd = false,
                    virtualenvs = false,
                    hatch = false,
                    poetry = false,
                    anaconda_envs = false,
                    anaconda_base = false,
                    pipx = false,
                    workspace = false,
                    file = false,
                },
            },
        })
    end,
}
