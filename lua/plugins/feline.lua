return {
    'freddiehaddad/feline.nvim',
    opts = {},
    config = function(_, opts)
        require('feline').setup()
        require('feline').statuscolumn.setup() -- to use statuscolumn
    end
}
