-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- windows 管理
map("n", "s", "", opt)  -- s のデフォルト機能Off
map("n", "sv", ":vsp<CR>", opt)  -- 縦分割
map("n", "sh", ":sp<CR>", opt)  -- 横分割
map("n", "sc", "<C-w>c", opt)  -- 当 window 閉じる
map("n", "so", "<C-w>o", opt)  -- 当 window 以外を閉じる

map("n", "<A-h>", "<C-w>h", opt) -- windows 間の Focus 移動
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("n", "<C-Left>", ":vertical resize -2<CR>", opt)  -- window 大きさ調整
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)

map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)

map("n", "s=", "<C-w>=", opt)  -- 等幅

-- Terminal
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)

map("t", "<Esc>", "<C-\\><C-n>", opt)

map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- Visual モード
map("v", "<", "<gv", opt)  -- インデント移動
map("v", ">", ">gv", opt)

map("v", "J", ":move '>+1<CR>gv-gv", opt)  -- 選択した行ごと移動
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- システムコピペ連携
vim.api.nvim_set_keymap('v', '<c-c>', '"+y', { noremap = true, silent = true })

-- 垂直スクロール
map("n", "<C-j>", "4j", opt)  -- 4行
map("n", "<C-k>", "4k", opt)

map("n", "<C-u>", "9k", opt)  -- 9行
map("n", "<C-d>", "9j", opt)