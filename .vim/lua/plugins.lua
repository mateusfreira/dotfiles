vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use({
      "jackMort/ChatGPT.nvim",
      commit = "346ebaba1c537f030505c9e5d92f48c88ee235b4",
      config = function()
        require("chatgpt").setup({
        keymaps = {
          submit = "<C-s>"
        }
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })
end)

