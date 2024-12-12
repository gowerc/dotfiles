

-- Colour theme with some basic overrides

return {
    { 
        "navarasu/onedark.nvim",
        name = "onedark",
        priority = 1000,
        config = function() 
            require("onedark").setup({
                style = 'light',
                highlights = {
                    ["@comment"] = {fg = "#25a723"},
                    ["@string"] = {fg = "#b57d1c"}
                }
            })
            vim.cmd.colorscheme("onedark")
        end
    }
}