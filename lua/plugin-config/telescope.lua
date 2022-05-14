local status, telescope = pcall(require, 'telescope')
if not status then
    vim.notify('telescope Not Found!')
    return
end

telescope.setup({
    defaults = {
        initial_mode = 'insert',
        mappings = require('keybindings').telescopeList,
    },
    pickers = {
        find_files = {},
    },
    extensions = {},
})

pcall(telescope.load_extension, 'env')
