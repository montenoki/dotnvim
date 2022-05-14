local status, ident_blankline = pcall(require, 'indent_blankline')
if not status then
    vim.notify('indent_blankline Not Found!')
    return
end

ident_blankline.setup({
    -- blank line
    space_char_blankline = ' ',
    -- treesitter 連携
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = {
        'class',
        'function',
        'method',
        'element',
        '^if',
        '^while',
        '^for',
        '^object',
        '^table',
        'block',
        'arguments',
    },
    -- :echo &filetype
    filetype_exclude = {
        'dashboard',
        'packer',
        'terminal',
        'help',
        'log',
        'markdown',
        'TelescopePrompt',
        'lsp-installer',
        'lspinfo',
        'toggleterm',
    },
    -- char = '¦'
    -- char = '┆'
    -- char = '│'
    -- char = "⎸",
    char = '▏',
})
