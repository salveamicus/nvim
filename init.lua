local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({import = "plugins"})

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

vim.o.background = "dark" -- "dark" for dark or "light" for light mode

vim.cmd[[set clipboard+=unnamedplus]]

vim.wo.relativenumber = true

vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.mouse = 'a'
vim.opt.shiftwidth = 4
vim.opt.laststatus = 2
vim.opt.encoding = 'utf8'
vim.opt.history = 5000
