local packer = require("packer")
packer.startup({
  function(use)
    -- 拡張機能マネージャー
    use 'wbthomason/packer.nvim'
    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- dracula.nvim
    use("Mofiqul/dracula.nvim")
    -------------------------------------------------------
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
