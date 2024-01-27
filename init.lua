vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local Plug = require 'usermod.plugInterface'

Plug.begin()

Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('tpope/vim-sensible')
Plug('sharkdp/fd')
Plug('BurntSushi/ripgrep')
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x'})
Plug('nvim-telescope/telescope-project.nvim')
Plug('nvim-telescope/telescope-file-browser.nvim')
Plug('nvim-treesitter/nvim-treesitter', {run = vim.fn['tsupdate']})
Plug('nvim-neo-tree/neo-tree.nvim', { branch = 'v3.x'})
Plug('MunifTanjim/nui.nvim')
Plug('3rd/image.nvim')
Plug('neovim/nvim-lspconfig') 
Plug('yamatsum/nvim-cursorline')
Plug('nanotee/sqls.nvim')
Plug('rktjmp/lush.nvim')
Plug('adisen99/apprentice.nvim')
Plug('fgheng/winbar.nvim')
Plug('SmiteshP/nvim-navic')
Plug('ms-jpq/coq_nvim', {branch = 'coq'})
Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})
Plug('ms-jpq/coq.thirdparty', {branch = '3p'})

Plug.ends()

local lspconfig = require 'lspconfig'

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

require('telescope').load_extension('project')
require('telescope').load_extension('file_browser')

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>fs",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

require('winbar').setup({
	enabled = true,

    show_file_path = true,
    show_symbols = true,

    colors = {
        path = '', -- You can customize colors like #c946fd
        file_name = '',
        symbols = '',
    },

    icons = {
        file_icon_default = '',
        seperator = '>',
        editor_state = '●',
        lock_icon = '',
    },

    exclude_filetype = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
	    'neo-tree',
        'NvimTree',
        'Trouble',
        'alpha',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'qf',
    }
})

vim.o.background = "dark" -- or "light" for light mode

-- Load and setup function to choose plugin and language highlights
require('lush')(require('apprentice').setup({
  plugins = {
    "buftabline",
    "coc",
    "cmp", -- nvim-cmp
    "fzf",
    "gitgutter",
    "gitsigns",
    "lsp",
    "lspsaga",
    "nerdtree",
    "netrw",
    "nvimtree",
    "neogit",
    "packer",
    "signify",
    "startify",
    "syntastic",
    "telescope",
    "treesitter"
  },
  langs = {
    "c",
    "clojure",
    "coffeescript",
    "csharp",
    "css",
    "elixir",
    "golang",
    "haskell",
    "html",
    "java",
    "js",
    "json",
    "jsx",
    "lua",
    "markdown",
    "moonscript",
    "objc",
    "ocaml",
    "purescript",
    "python",
    "ruby",
    "rust",
    "scala",
    "typescript",
    "viml",
    "xml"
  }
}))

require('nvim-cursorline').setup {
    cursorline = {
        enable = true, 
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
}

lspconfig.hls.setup{}
lspconfig.clangd.setup{}
lspconfig.cmake.setup{}
lspconfig.pyright.setup{}
lspconfig.marksman.setup{}
lspconfig.lua_ls.setup{}
lspconfig.texlab.setup{}
lspconfig.sqls.setup{
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end
}

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

vim.cmd[[set clipboard+=unnamedplus]]

--opens NERDtree on open
vim.cmd[[autocmd StdinReadPre * let s:std_in=1]]
vim.cmd[[autocmd VimEnter * Neotree]]
