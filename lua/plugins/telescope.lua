return {
    {
        "nvim-telescope/telescope.nvim", branch = '0.1.x',
        dependencies = {"nvim-lua/plenary.nvim",
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
    
    "nvim-telescope/telescope-project.nvim"
}
