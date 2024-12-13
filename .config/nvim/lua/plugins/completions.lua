
return {

    -- LSP support
    {'neovim/nvim-lspconfig'},
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    
    -- Autocompletion
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-cmdline'},

    { 
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
                })
            })
            
            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
          
            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
          
            -- Set up lspconfig
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            require("mason").setup()
            require("mason-lspconfig").setup()
            vim.opt.signcolumn = "yes"
            require('lspconfig').r_language_server.setup { capabilities = capabilities }
            require('lspconfig').pyright.setup { capabilities = capabilities }
            
            -- Only works if you are within the function brackets
            vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, { noremap = true })
            vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { noremap = true })
            --vim.opt.completeopt = "menuone,menu,popup"
        end
    },
}


    -- {'hrsh7th/cmp-nvim-lsp'},  -- Integration with the lsp
    -- {'hrsh7th/cmp-buffer'},    -- Completes from current buffer (file)
    -- {'hrsh7th/cmp-path'},      -- Completes local files
    -- {"hrsh7th/cmp-nvim-lua"},  -- Completes neovim lua objects
    -- {'hrsh7th/cmp-cmdline'},
    -- { "williamboman/mason-lspconfig.nvim" },
    -- { "williamboman/mason.nvim" } , 
    -- { "neovim/nvim-lspconfig" },
    -- {
    --     'hrsh7th/nvim-cmp',
    --     config = function()
    --         require("nvim-lsp-installer").setup {}
    --         local cmp = require'cmp'

    --         cmp.setup({
    --           snippet = {
    --             -- REQUIRED - you must specify a snippet engine
    --             expand = function(args)
    --               vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --               -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --               -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --               -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --               -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    --             end,
    --           },
    --           window = {
    --             -- completion = cmp.config.window.bordered(),
    --             -- documentation = cmp.config.window.bordered(),
    --           },
    --           mapping = cmp.mapping.preset.insert({
    --             ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --             ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --             ['<C-Space>'] = cmp.mapping.complete(),
    --             ['<C-e>'] = cmp.mapping.abort(),
    --             ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --           }),
    --           sources = cmp.config.sources({
    --             { name = 'nvim_lsp' },
    --             { name = 'vsnip' }, -- For vsnip users.
    --             -- { name = 'luasnip' }, -- For luasnip users.
    --             -- { name = 'ultisnips' }, -- For ultisnips users.
    --             -- { name = 'snippy' }, -- For snippy users.
    --           }, {
    --             { name = 'buffer' },
    --           })
    --         })
          
    --         -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    --         -- Set configuration for specific filetype.
    --         --[[ cmp.setup.filetype('gitcommit', {
    --           sources = cmp.config.sources({
    --             { name = 'git' },
    --           }, {
    --             { name = 'buffer' },
    --           })
    --        })
    --        require("cmp_git").setup() ]]-- 
          
    --         -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    --         cmp.setup.cmdline({ '/', '?' }, {
    --           mapping = cmp.mapping.preset.cmdline(),
    --           sources = {
    --             { name = 'buffer' }
    --           }
    --         })
          
    --         -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    --         cmp.setup.cmdline(':', {
    --           mapping = cmp.mapping.preset.cmdline(),
    --           sources = cmp.config.sources({
    --             { name = 'path' }
    --           }, {
    --             { name = 'cmdline' }
    --           }),
    --           matching = { disallow_symbol_nonprefix_matching = false }
    --         })
          
    --         -- Set up lspconfig.
    --         local capabilities = require('cmp_nvim_lsp').default_capabilities()
    --         -- require("mason").setup()
    --         -- require("mason-lspconfig").setup()
    --         -- require("lspconfig").r_language_server.setup {}
    --         -- require("lspconfig").pylsp.setup {}
    --         -- vim.opt.signcolumn = "yes"
    --     end
    -- }
-- }

