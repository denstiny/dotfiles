local plugin = require("core.packers")

plugin.add({
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim",          cmd = { "Mason" } },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        require("plugin.server.lsp")
    end,
})

plugin.add({
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
        require("plugin.server.lsp.go")
    end,
})

plugin.add({
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        --"HiPhish/nvim-ts-rainbow2",
        "nvim-treesitter/playground",
    },
    config = function()
        require("plugin.server.treesitter")
    end,
    cmd = { "TSEnable", "TSInstall", "TSInstallInfo", "TSModuleInfo" },
    cond = true,
})

plugin.add({
    "L3MON4D3/LuaSnip",
    config = function()
        require("plugin.server.snip")
    end,
    dependencies = {
        "Leiyi548/friendly-snippets",
    },
    build = "make install_jsregexp",
    lazy = true,
})

plugin.add({
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    lazy = true,
    --cond = false,
})

plugin.add({
    "rcarriga/nvim-dap-ui",
    dependencies = {
        { "mfussenegger/nvim-dap" },
        { "jayp0521/mason-nvim-dap.nvim" },
        { "p00f/clangd_extensions.nvim" },
        { "simrat39/rust-tools.nvim" },
    },
    config = function()
        require("plugin.server.dap")
    end,
    cmd = {
        "DapContinue",
        "DapRestart",
        "DapClose",
        "DapToggleBreakpoint",
        "DapStepOver",
        "DapStepInto",
        "DapToggleRepl",
    },
})
