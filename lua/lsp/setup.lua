local lsp_installer = require('nvim-lsp-installer')

-- language list
-- { key: lang value: 設定ファイル }
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    sumneko_lua = require('lsp.config.lua'), -- lua/lsp/config/lua.lua
}
-- 自動インストール Language Servers
for name, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print('Installing ' .. name)
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local config = servers[server.name]
    if config == nil then
        return
    end
    if config.on_setup then
        config.on_setup(server)
    else
        server:setup({})
    end
end)
