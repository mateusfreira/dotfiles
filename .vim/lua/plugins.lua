vim.cmd [[packadd packer.nvim]]


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use({
      "jackMort/ChatGPT.nvim",
      commit = "df53728e05129278d6ea26271ec086aa013bed90",
      config = function()
         require("chatgpt").setup()
        -- require("chatgpt").setup({
        --keymaps = {
        --  submit = "<C-s>"
        -- }
        -- })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })
end)


