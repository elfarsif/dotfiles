return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("ts_ls")

      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
      vim.keymap.set("n", "<leader>nr", "<cmd>Telescope lsp_references<cr>", { desc = "Find usages/references" })
      vim.keymap.set("n", "<leader>ni", "<cmd>Telescope lsp_implementations<cr>", { desc = "Go to implementation" })
      vim.keymap.set("n", "<leader>nt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Go to type definition" })

    end,
  },
}
