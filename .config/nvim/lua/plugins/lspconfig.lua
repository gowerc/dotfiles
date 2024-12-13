
-------------------------------------
----        mason-lspconfig      ----
-------------------------------------

-- 
--     Provides the correct objects for LSPs installed by mason to be used
--     by lspconfg


-------------------------------------
----             mason           ----
-------------------------------------

-- This is essentially a package manager for installing LSPs
-- Recommended to not install LSPs automatically as some can be very heavy
-- Instead best to just manually install the ones you need:

-- :MasonInstall pyright
-- :MasonInstall r-languageserver


-- Default directory for installing LSPs is:
--     ~/.local/share/nvim/mason/packages


-- List of all available LSPs (can also just using :Mason within vim)
-- https://github.com/mason-org/mason-registry/tree/main/packages


-- List of all commands available for installing LSPs
-- :Mason - opens a graphical status window
-- :MasonUpdate - updates all managed registries
-- :MasonInstall <package> ... - installs/re-installs the provided packages
-- :MasonUninstall <package> ... - uninstalls the provided packages
-- :MasonUninstallAll - uninstalls all packages
-- :MasonLog - opens the mason.nvim log file in a new tab window



-------------------------------------
----             TODO            ----
-------------------------------------

-- Omni completion help page  :h ins-completion
-- Omni completion ctrl-x ctrl-o
-- Goto def   ctrl-]
-- Jump back from def   ctrl-t
--  Goto reference  grr (not currently working)
-- Shift-K   show function signature
-- :help 'completeopt'


-- <c-e> clear current autocomplete and go back to original text


-- lua vim.lsp.buf.signature_help()

return {
    -- { "williamboman/mason-lspconfig.nvim" },
    -- { "williamboman/mason.nvim" } , 
    -- {
    --     "neovim/nvim-lspconfig",
    --     config = function()
    --         require("mason").setup()
    --         require("mason-lspconfig").setup()
    --         require("lspconfig").r_language_server.setup {}
    --         require("lspconfig").pyright.setup {}
    --         vim.opt.signcolumn = "yes"
            
            
    --         -- Only works if you are within the function brackets
    --         vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, { noremap = true })
    --         vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { noremap = true })

            -- local function file_exists(filepath)
            --     local stat = vim.loop.fs_stat(filepath)
            --     return stat ~= nil
            -- end
            -- local data_path = vim.fn.stdpath("data") .."/mason/packages/" 

            -- if file_exists(data_path .. "r-languageserver") then
            --     require("lspconfig").r_language_server.setup {}
            -- else
            --     print("Unable to find R-Language server\nTry running :MasonInstall r-languageserver\n")
            -- end

            -- if file_exists(data_path .. "python-lsp-server") then
            --     require("lspconfig").pylsp.setup {}
            -- else
            --     print("Unable to find pylsp\nTry running :MasonInstall pylsp\n")
            -- end

        --     vim.opt.signcolumn = "no"
        --     -- vim.opt.completeopt = "preview,menu,menuone,noinsert"
        
        -- end,
    -- }
}

