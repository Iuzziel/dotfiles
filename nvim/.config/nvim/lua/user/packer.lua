vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-web-devicons'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Magit clone
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- TJ created lodash of neovim
    -- use("nvim-lua/plenary.nvim")
    -- use("nvim-lua/popup.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-tree/nvim-web-devicons"}
        }
    })

    -- All the things
    use("neovim/nvim-lspconfig")
    use("j-hui/fidget.nvim")
    use ({
      "ms-jpq/coq.thirdparty",
      branch = "3p"
    })
    use({"ms-jpq/coq_nvim",
      branch = "coq"
    })
    use({
      "ms-jpq/coq.artifacts",
      branch = "artifacts"
    })
    use({
        "ThePrimeagen/harpoon",
        requires = { 'nvim-lua/plenary.nvim' }
    })

    use("mbbill/undotree")

    -- Colorscheme section
    -- use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use({
        "nvim-treesitter/playground",
        "romgrk/nvim-treesitter-context",
        requires = {"nvim-treesitter/nvim-treesitter"}
    })

    use('tpope/vim-commentary')
    use('tpope/vim-obsession')

    use({
      'nvim-orgmode/orgmode',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('orgmode').setup{}
        require('orgmode').setup_ts_grammar{}
      end
    })

    use({
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    })

end)
