local packer = require("packer")
packer.startup({
    function(use)
        -- 拡張機能マネージャー
        use "wbthomason/packer.nvim"
        --------------------- colorschemes --------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        -- dracula.nvim
        use("Mofiqul/dracula.nvim")
        -- OceanicNext
        use("mhartington/oceanic-next")
        -- gruvbox
        use({
            "ellisonleao/gruvbox.nvim",
            requires = { "rktjmp/lush.nvim" },
        })
        -- nord
        use("shaunsingh/nord.nvim")
        -- onedark
        use("ful1e5/onedark.nvim")
        -- nightfox
        use("EdenEast/nightfox.nvim")
        ----------------------- plugins ------------------------
        -- ディレクトリツリー
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

        -- タブ表示
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

        -- ステータスバー表示
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")

        -- telescope ファイル検索
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        -- telescope extensions
        use "LinArcX/telescope-env.nvim"  -- 環境変数表示機能

        -- 開始画面
        use("glepnir/dashboard-nvim")

        -- project
        use("ahmedkhalf/project.nvim")

        -- treesitter
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

        ------------------------- LSP --------------------------
        use({ "williamboman/nvim-lsp-installer" })
        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })

        --------------------------------------------------------
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    }
})

--  plugins.lua ファイル保存時に自動更新
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
