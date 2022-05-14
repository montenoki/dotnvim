-- 基本設定
require('basic')
-- キーバインド
require('keybindings')

-- 拡張機能
require('plugins')
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.dashboard')
require('plugin-config.project')
require('plugin-config.nvim-treesitter')
require('plugin-config.indent-blankline')

-- Colorscheme
require('colorscheme')

-- LSP
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
require('lsp.formatter')
