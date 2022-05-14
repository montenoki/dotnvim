local status, bufferline = pcall(require, 'bufferline')
if not status then
    vim.notify('bufferline Not Found!')
    return
end

-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
    options = {
        close_command = 'Bdelete! %d',
        right_mouse_command = 'Bdelete! %d',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left',
            },
        },
        -- LSP連携
        diagnostics = 'nvim_lsp',
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
                local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
                s = s .. n .. sym
            end
            return s
        end,
    },
})
