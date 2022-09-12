vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Magit clone
    use("TimUntersberger/neogit")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim"}
    })

    -- All the things
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    -- use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use({
        "glepnir/lspsaga.nvim",
        requires = { 'neovim/nvim-lspconfig' }
    })
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- Primeagen doesn't create lodash
    use("ThePrimeagen/git-worktree.nvim")
    use({
        "ThePrimeagen/harpoon",
        requires = { 'nvim-lua/plenary.nvim' }
    })

    use("mbbill/undotree")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    use("nvim-treesitter/nvim-treesitter", {
    	run = ':TSUpdate'
    })
    use({
        "nvim-treesitter/playground",
        "romgrk/nvim-treesitter-context",
        requires = {"nvim-treesitter/nvim-treesitter"}
    })

    use('tpope/vim-commentary')
    use('tpope/vim-obsession')

    use("mfussenegger/nvim-dap")
    use({
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        requires = { "mfussenegger/nvim-dap" }
    })

    use('kyazdani42/nvim-web-devicons')
    -- use("folke/which-key.nvim")

end)
