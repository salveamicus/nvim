local builtin = require('telescope.builtin')

vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

require'telescope'.load_extension('project')
require'telescope'.load_extension('file_browser')
require'telescope'.load_extension('fzf')

vim.api.nvim_set_keymap(
    'n',
    '<space>fp',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
    'n',
    '<space>fs',
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    {noremap = true}
)

-- Disable sign column in alpha
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "alpha", callback = function()
        vim.opt_local.statuscolumn = ""
    end
})
