-- utf8
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'utf-8'
-- hjkl 移動時の上下デッドゾーン
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 相対的に行番号表示
vim.wo.number = true
vim.wo.relativenumber = true
-- 所在行ハッチング
vim.wo.cursorline = true
-- アイコン列表示
vim.wo.signcolumn = 'yes'
-- 垂直ルーラー表示
vim.wo.colorcolumn = '80'
-- Tab の長さ
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 移動距離
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- Tab を Space に変更
vim.o.expandtab = true
vim.bo.expandtab = true
-- 自動インデント
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 大文字込みのキーワード以外では、大文字小文字無視検索
vim.o.ignorecase = true
vim.o.smartcase = true
-- 検索時ハイライト OFF
vim.o.hlsearch = false
-- 入力中検索
vim.o.incsearch = true
-- CMD バー2行表示
vim.o.cmdheight = 2
-- 編集中のファイルを自動 Reload（外部修正があった場合）
vim.o.autoread = true
vim.bo.autoread = true
-- 行の折返し OFF
vim.wo.wrap = false
-- ← → で行頭行尾移動時、次の行に移動
vim.o.whichwrap = '<,>,[,]'
-- 修正ありの Buffer は非表示可能
vim.o.hidden = true
-- マウスサポート ON
vim.o.mouse = 'a'
-- バックアップ OFF
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- タイピング停止時から反映されるまでの時間
vim.o.updatetime = 100
-- キーコードの待ち時間 (ms)
vim.o.timeoutlen = 400
-- split window 右と下に
vim.o.splitbelow = true
vim.o.splitright = true
-- 自動補完時、自動選択しない
vim.g.completeopt = 'menu,menuone,noselect,noinsert'
-- スタイル
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 見えないをスペースを点に表示
vim.o.list = true
vim.o.listchars = 'space:·'
-- 自動補完機能のメニュー表示
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 自動補完機能の表示数
vim.o.pumheight = 10
-- Tabline 常時表示
vim.o.showtabline = 2
-- 純正のモード表示 OFF （拡張により表示）
vim.o.showmode = false
