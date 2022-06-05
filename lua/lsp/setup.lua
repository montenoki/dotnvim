-- local lsp_installer = require("nvim-lsp-installer")
require('nvim-lsp-installer').setup({
    -- Automatic Install Language Servers
    automatic_installation = true,
})
local lspconfig = require('lspconfig')

-- language list
-- { key: lang value: 設定ファイル }
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    sumneko_lua = require('lsp.config.lua'), -- lua/lsp/config/lua.lua
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == 'table' then
        config.on_setup(lspconfig[name])
    else
        lspconfig[name].setup({})
    end
end
