local status, formatter = pcall(require, 'formatter')
if not status then
    vim.notify('formatter Not Found!')
    return
end

formatter.setup({
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {
                        -- "--config-path "
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        --   .. "/stylua/stylua.toml",
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
    },
})

-- format on save
vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua FormatWrite
    augroup END
]],
    true
)
