
-- This extension attaches semantics to code for use in other tools such as colour highlighters
-- That is it provides a schematic saying which parts of the code are comments / functions /
-- literals / strings / etc. nvim has built in support for some languages but no where near all
-- This extension provides a much more comprehensive picture

return {
    'nvim-treesitter/nvim-treesitter',
    name = "treesitter",
    build = ":TSUpdate",
    config = function() 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query",
                "markdown", "markdown_inline", "r",
                "cpp", "javascript", "typescript", "python",
                "julia"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            
            indent = { enable = false },
            -- List of parsers to ignore installing (or "all")
            ignore_install = {  },

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        })
    end
}


