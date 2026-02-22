return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "horizontal",
        size = 15,
      })

      -- Run ./gradlew run in a floating terminal
      vim.keymap.set("n", "<leader>r", function()
        local term = require("toggleterm.terminal").Terminal:new({
          cmd = "./gradlew run",
          direction = "horizontal",
          close_on_exit = false,
        })
        term:toggle()
      end, { desc = "Run gradlew (gradle run)" })

      -- General toggle terminal (optional convenience)
      vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
      vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
    end,
  },
}
