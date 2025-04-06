return {}

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


-- return {

    -- -- LSP support
    -- {'neovim/nvim-lspconfig'},
    -- { "williamboman/mason.nvim" },
    -- { "williamboman/mason-lspconfig.nvim" },
    
    -- -- Autocompletion
    -- {'hrsh7th/cmp-buffer'},
    -- {'hrsh7th/cmp-path'},
    -- {'hrsh7th/cmp-nvim-lsp'},
    -- {'hrsh7th/cmp-nvim-lua'},
    -- {'hrsh7th/cmp-cmdline'},
    -- {'hrsh7th/cmp-nvim-lsp-signature-help'},
    -- {'hrsh7th/cmp-vsnip'},
    -- {'hrsh7th/vim-vsnip'},
    -- { 
    --     'hrsh7th/nvim-cmp',
    --     config = function()
    --         local cmp = require'cmp'
    --         cmp.setup({
    --             snippet = {
    --                 -- REQUIRED - you must specify a snippet engine
    --                 expand = function(args)
    --                     vim.fn["vsnip#anonymous"](args.body)
    --                 end,
    --             },
    --             window = {
    --                 completion = cmp.config.window.bordered(),
    --                 documentation = cmp.config.window.bordered(),
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --                 ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --                 ['<C-Space>'] = cmp.mapping.complete(),
    --                 ['<C-e>'] = cmp.mapping.abort(),
    --                 ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --             }),
    --             sources = cmp.config.sources({
    --                 { 
    --                     name = 'path',
    --                     option = {
    --                         -- Ensure that all relative paths are from the project root dir
    --                         get_cwd = function() 
    --                             return vim.fn.getcwd()
    --                         end
    --                     }
    --                 },
    --                 { name = "nvim_lsp_signature_help" },
    --                 { name = 'nvim_lsp' },
    --                 { name = 'vsnip' },
    --             }, {
    --                 { name = 'buffer', keyword_length = 3 },
    --             })
    --         })
            
    --         -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    --         cmp.setup.cmdline({ '/', '?' }, {
    --             mapping = cmp.mapping.preset.cmdline(),
    --             sources = {
    --                 { name = 'buffer' }
    --             }
    --         })
          
    --         -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --         cmp.setup.cmdline(':', {
    --             mapping = cmp.mapping.preset.cmdline(),
    --             sources = cmp.config.sources({
    --                 { name = 'path' }
    --             }, {
    --                 { name = 'cmdline' }
    --             }),
    --             matching = { disallow_symbol_nonprefix_matching = false }
    --         })
          
    --         -- Set up lspconfig
    --         local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
    --         require("mason").setup()
    --         require("mason-lspconfig").setup()
    --         vim.opt.signcolumn = "yes"

            
            
            
    --         local function file_exists(filepath)
    --             local stat = vim.loop.fs_stat(filepath)
    --             return stat ~= nil
    --         end
    --         local data_path = vim.fn.stdpath("data") .."/mason/packages/" 

    --         if file_exists(data_path .. "r-languageserver") then
    --             require('lspconfig').r_language_server.setup { capabilities = capabilities }
    --         else
    --             print("Unable to find R-Language server\nTry running :MasonInstall r-languageserver\n")
    --         end

    --         if file_exists(data_path .. "pyright") then
    --             require('lspconfig').pyright.setup { capabilities = capabilities }
    --         else
    --             print("Unable to find pyright\nTry running :MasonInstall pyright\n")
    --         end
            
            
            
    --         -- -- Example code to modify the popup box for signatureHelp
    --         -- -- for example setting new conditions / events to close the window
    --         -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    --         --     vim.lsp.handlers.signature_help,
    --         --     {
    --         --         border = "rounded", -- Add a border around the popup
    --         --         -- close_events = "CompleteDone",
    --         --     }
    --         -- )
            
    --         -- signature_help() - Only works if you are within the function brackets
    --         -- hover() -- Only works if curosr is above the symbol
    --         vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, { noremap = true })
    --         vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { noremap = true })
    --         vim.keymap.set("n", "<c-k>", vim.lsp.buf.hover, { noremap = true })
    --         vim.opt.completeopt = "menuone,menu,preview,noinsert"


    --     end
    -- },
-- }




