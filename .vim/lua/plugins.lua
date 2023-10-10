vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use({
      "jackMort/ChatGPT.nvim",
      commit = "d4aa4d9e31d620a0c01006e59f4449ffc7eb33ce",
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

