local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("nvim-treesitter Not Found!")
    return
end

treesitter.setup({
    -- language 解析器
    ensure_installed = { "vim", "lua" },
    -- 構文の強調表示ON
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- 漸進式選択
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
    -- 自動indent (=)
    indent = {
        enable = true,
    },
})

--  Folding 機能ON
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- デフォルトはFolding OFF
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
