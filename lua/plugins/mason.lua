return {
    "mason-org/mason-registry",
    "rshkarin/mason-nvim-lint",
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    "jay-babu/mason-nvim-dap.nvim",
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

        end
    }
}
