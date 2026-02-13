return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Enable treesitter highlighting for all filetypes
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Install common parsers
    require("nvim-treesitter").install({ "lua", "java", "python", "javascript", "typescript", "c", "cpp", "go", "rust", "bash" })
  end,
}
