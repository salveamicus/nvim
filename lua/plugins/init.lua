return {
  "andweeb/presence.nvim",
  "lewis6991/gitsigns.nvim",
  "mason-org/mason-registry",
  "williamboman/nvim-lsp-installer",
  "neovim/nvim-lspconfig",
  "jay-babu/mason-nvim-dap.nvim",
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-lint",
  "rshkarin/mason-nvim-lint",
  "nvim-tree/nvim-web-devicons",
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local remap = vim.api.nvim_set_keymap
        local npairs = require('nvim-autopairs')

        npairs.setup({ map_bs = false, map_cr = false })

        vim.g.coq_settings = { keymap = { recommended = false } }

        -- these mappings are coq recommended mappings unrelated to nvim-autopairs
        remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
        remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
        remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
        remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

        -- skip it, if you use another global object
        _G.MUtils= {}

        MUtils.CR = function()
          if vim.fn.pumvisible() ~= 0 then
            if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
              return npairs.esc('<c-y>')
            else
              return npairs.esc('<c-e>') .. npairs.autopairs_cr()
            end
          else
            return npairs.autopairs_cr()
          end
        end
        remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

        MUtils.BS = function()
          if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
            return npairs.esc('<c-e>') .. npairs.autopairs_bs()
          else
            return npairs.autopairs_bs()
          end
        end
        remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
    end,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    },

  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")

    mason.setup()

        lspconfig.clangd.setup({})
        lspconfig.cmake.setup({})
        lspconfig.hls.setup({})
        lspconfig.pyright.setup({})
        lspconfig.luals.setup({})
        lspconfig.texlab.setup({})

    -- ...
    end,
  },
  {
	"ms-jpq/coq_nvim",
	branch = "coq",
    priority = 500,
  },
  {
	"ms-jpq/coq.artifacts",
	branch = "artifacts",
  },
  {
	"ms-jpq/coq.thirdparty",
	branch = "3p",
  },
  {
    'freddiehaddad/feline.nvim',
    opts = {},
    config = function(_, opts)
      require('feline').setup()
      require('feline').winbar.setup()       -- to use winbar
      require('feline').statuscolumn.setup() -- to use statuscolumn
    end
  },
  {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  {
	"yamatsum/nvim-cursorline",
	config = function ()
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
	end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "nvim-telescope/telescope.nvim", branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim",
                     "nvim-tree/nvim-web-devicons",
                     "nvim-treesitter/nvim-treesitter",
                     "sharkdp/fd",
                     "BurntSushi/ripgrep"},
    opts = {}
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  "nvim-telescope/telescope-project.nvim",
  {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
}
