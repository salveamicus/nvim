local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  ---
  -- List of plugins
  ---
  'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'},
  'preservim/nerdtree',
  'neoclide/coc.nvim', {'branch': 'release'}
  'jpmcb/nvim-llama',
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  'yamatsum/nvim-cursorline'
})

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

require('nvim-llama').setup {}

vim.command[[set laststatus=2]]
vim.command[[let g:airline#extension#tabline#enabled=1]]
vim.command[[let g:airline_powerline_fonts=1]]
vim.command[[let g:airline_statusline_ontop=0]]
vim.command[[let g:airline_theme='deus']]
vim.command[[let g:airline#extension#tabline#formatter='defualt']]
vim.command[[nnoremap <M-Right> :bn<cr>]]
vim.command[[nnoremap <M-Left> :bp<cr>]]
vim.command[[nnoremap <c-x> :bp \|bd #<cr>]]

vim.command[[set mouse=a]]
vim.command[[set number]]
vim.command[[set hidden]]
vim.command[[set expandtab]]
vim.command[[set autoindent]]
vim.command[[set smartindent]]
vim.command[[set shiftwidth=4]]
vim.command[[set tabstop=4]]
vim.command[[set encoding=utf8]]
vim.command[[set history=5000]]
vim.command[[set clipboard+=unamedplus]]
