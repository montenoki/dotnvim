local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
    vim.notify('nvim-tree Not Found!')
    return
end

-- キーバインド導入
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- git 状態表示 on/off
    git = {
        enable = false,
    },
    -- project plugin と連携
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- dot ファイルと node_modules フォルダー非表示
    filters = {
        dotfiles = false,
        custom = {},
    },
    view = {
        -- 幅
        width = 40,
        -- 左右
        side = 'left',
        -- ルートフォルダー非表示
        hide_root_folder = false,
        -- キーバインド導入
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- 行番号非表示
        number = false,
        relativenumber = false,
        -- アイコン表示
        signcolumn = 'yes',
    },
    actions = {
        -- ファイルを開く時の action
        open_file = {
            resize_window = true,
            quit_on_open = true,
        },
    },
})
-- 自動 OFF
vim.cmd([[
  autocmd BufEnter * ++nested if winnr("$") == 1 && bufname() == "NvimTree_" . tabpagenr() | quit | endif
]])
