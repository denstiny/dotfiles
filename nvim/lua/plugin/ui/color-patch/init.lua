require("color-patch").setup({
    use = {
        name = "kanagawa",
        lazy = true
    },
    all = function()
        require("basis.hi")()
    end,
    kanagawa = {
        patch = function()
            require("core.chronus-theme")()
        end,
        config = function()
        end
    }
})
