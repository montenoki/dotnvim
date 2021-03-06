require('utils')
------------- Neovim Keybindings -------------
-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- システムコピペ連携
vim.api.nvim_set_keymap('v', '<c-c>', '"+y', { noremap = true, silent = true })

-- 垂直スクロール
map('n', '<C-j>', '4j', opt) -- 4行
map('n', '<C-k>', '4k', opt)

map('n', '<C-u>', '9k', opt) -- 9行
map('n', '<C-d>', '9j', opt)

map('v', '<', '<gv', opt) -- インデント移動
map('v', '>', '>gv', opt)

map('v', 'J', ":move '>+1<CR>gv-gv", opt) -- 選択した行ごと移動
map('v', 'K', ":move '<-2<CR>gv-gv", opt)

-- windows 管理
map('n', 's', '', opt) -- デフォルトの s コマンドOff
map('n', 'sv', ':vsp<CR>', opt) -- 縦分割
map('n', 'sh', ':sp<CR>', opt) -- 横分割
map('n', 'sc', '<C-w>c', opt) -- 当 window 閉じる
map('n', 'so', '<C-w>o', opt) -- 当 window 以外を閉じる

map('n', '<A-h>', '<C-w>h', opt) -- windows 間の Focus 移動
map('n', '<A-j>', '<C-w>j', opt)
map('n', '<A-k>', '<C-w>k', opt)
map('n', '<A-l>', '<C-w>l', opt)

map('n', '<C-Left>', ':vertical resize -2<CR>', opt) -- window 大きさ調整
map('n', '<C-Right>', ':vertical resize +2<CR>', opt)
map('n', 's,', ':vertical resize -20<CR>', opt)
map('n', 's.', ':vertical resize +20<CR>', opt)

map('n', 'sj', ':resize +10<CR>', opt)
map('n', 'sk', ':resize -10<CR>', opt)
map('n', '<C-Down>', ':resize +2<CR>', opt)
map('n', '<C-Up>', ':resize -2<CR>', opt)

map('n', 's=', '<C-w>=', opt) -- 等幅

-- Terminal
map('n', '<leader>t', ':ToggleTerm<CR>', opt) -- Open Terminal
map('t', '<Esc>', '<C-\\><C-n>:ToggleTerm<CR>', opt) -- Exit Termail

------------ Plugin Keybindings -------------
local pluginKeys = {}

------------ nvim-tree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt) -- alt + m ON/OFF
-- ファイル操作
pluginKeys.nvimTreeList = {
    -- Open file
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
    -- Open file at split window
    { key = 'v', action = 'vsplit' },
    { key = 'h', action = 'split' },
    -- ignore ファイル表示・非表示
    { key = 'i', action = 'toggle_git_ignored' },

    -- dot ファイル表示・非表示
    { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)

    { key = '<F5>', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'd', action = 'remove' },
    { key = 'r', action = 'rename' },
    { key = 'x', action = 'cut' },
    { key = 'c', action = 'copy' },
    { key = 'p', action = 'paste' },
    { key = 'o', action = 'system_open' },
}

------------ bufferline
-- 左右Tab移動
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
map('n', '<C-w>', ':Bdelete!<CR>', opt) --"moll/vim-bbye"
map('n', '<leader>bl', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>bh', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>bc', ':BufferLinePickClose<CR>', opt)

------------- Telescope
-- ファイル検索
map('n', '<C-p>', ':Telescope find_files<CR>', opt)
-- グローバル検索
map('n', '<C-f>', ':Telescope live_grep<CR>', opt)
pluginKeys.telescopeList = {
    i = {

        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<Down>'] = 'move_selection_next',
        ['<Up>'] = 'move_selection_previous',

        ['<C-n>'] = 'cycle_history_next',
        ['<C-p>'] = 'cycle_history_prev',

        ['<C-c>'] = 'close',

        ['<C-u>'] = 'preview_scrolling_up',
        ['<C-d>'] = 'preview_scrolling_down',
    },
}

-------------- Dashboard
map('n', '<leader>d', ':Dashboard<CR>', opt)

-------------- LSP Keybindings ---------------
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    --[[
  Lspsaga rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
    mapbuf('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)
    -- code action
    --[[
  Lspsaga  ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
    mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
    -- go xx
    --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
    mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --[[
  Lspsaga gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
    mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
    --[[
  Lspsaga gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
    mapbuf('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
    --[[
  Lspsaga gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
    -- diagnostic
    mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
    mapbuf('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
    mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
    mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)

    -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end
    return {
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 确认
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- 如果窗口内容太多，可以滚动
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

return pluginKeys
