require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    -- lua functions
    use("nvim-lua/plenary.nvim")
    -- Must Have In VIM
    use({"mbbill/undotree"})
    use("kyazdani42/nvim-tree.lua")
    use("windwp/nvim-autopairs")
    use("liuchengxu/vim-which-key")
    use("terrortylor/nvim-comment")
    use("tpope/vim-surround")
    -- Theme
    use("norcalli/nvim-colorizer.lua")
    use({"mhartington/oceanic-next"})
    -- use({"ellisonleao/gruvbox.nvim"})
    use("kyazdani42/nvim-web-devicons")
    use({"feline-nvim/feline.nvim"})
    use({"xiyaowong/nvim-transparent"})
    -- Tab / Buffer
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- Git
    use("lewis6991/gitsigns.nvim")
    use("mattn/webapi-vim")
    -- Auto Completion
    use("hrsh7th/nvim-cmp")
    -- Language Servers
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")
    -- List of Completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    -- Snippets
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
    -- Rust
    -- add this so we can test under cursor with RustTest
    use("rust-lang/rust.vim")
    use("simrat39/rust-tools.nvim")
    use("chentoast/marks.nvim")
    -- ! Tabnine is disabled, uncomment to enable , but disable github Copilot
    use {
        'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp'
    }
    -- ! End Tabnine

    -- ! Github Copilot is enabled
    -- Install Copilot
    -- ! use {"github/copilot.vim"}
    --  run :PackaerSync
    -- remove after we Install Copilot
    -- ! Start Copilot
    -- use {
    --     "zbirenbaum/copilot.lua",
    --     event = {"VimEnter"},
    --     config = function()
    --         vim.defer_fn(function()
    --             require("copilot").setup()
    --         end, 100)
    --     end
    -- }
    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     module = "copilot_cmp"
    -- }
    -- ! End Copilot

    -- Easy Motion
    use("phaazon/hop.nvim")
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        requires = {{'nvim-treesitter/nvim-treesitter'}}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-ui-select.nvim'}
    -- Debugging
    use {
        'mfussenegger/nvim-dap',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"}
    }
    use {
        'saecki/crates.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('crates').setup()
        end
    }
    use({
        'mrjones2014/dash.nvim',
        run = 'make install'
    })
end)
