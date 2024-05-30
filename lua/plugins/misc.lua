return{
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-lint",
    "nvim-tree/nvim-web-devicons",
    {
        "lewis6991/gitsigns.nvim",

        config = function()
            require('gitsigns').setup()
        end
    }
}

