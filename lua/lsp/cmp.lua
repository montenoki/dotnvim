local cmp = require('cmp')

cmp.setup({
    -- snippet エンジン指定
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn['vsnip#anonymous'](args.body)

            -- For `luasnip` users.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)

            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
        end,
    },
    -- 補完ソース
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- For vsnip users.
        { name = 'vsnip' },

        -- For luasnip users.
        -- { name = 'luasnip' },

        --For ultisnips users.
        -- { name = 'ultisnips' },

        -- -- For snippy users.
        -- { name = 'snippy' },

        { name = "buffer" },
    }, { { name = 'path' } }),

    -- キーバインド導入
    mapping = require('keybindings').cmp(cmp),
    -- lspkind-nvim icon 表示
    formatting = require('lsp.ui').formatting,
})

-- / 検索モード buffer を使う
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- : コマンドモード path cmdline を使う
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
