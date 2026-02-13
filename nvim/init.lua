require("config.lazy")
-- auto-reload files changed outside of nvim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "silent! checktime",
})

-- enable true colors
vim.opt.termguicolors = true
-- tab settings (4 spaces)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
-- this enables yanking to clipboard
vim.opt.clipboard = "unnamedplus"
-- map kj to escape
vim.keymap.set("i", "kj", "<Esc>")
-- code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
-- diagnostic display settings
vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
})

-- folding with treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

-- fold keymaps with leader
vim.keymap.set("n", "<leader>za", "za", { desc = "Toggle fold" })
vim.keymap.set("n", "<leader>zc", "zc", { desc = "Close fold" })
vim.keymap.set("n", "<leader>zo", "zo", { desc = "Open fold" })
vim.keymap.set("n", "<leader>zM", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "<leader>zR", "zR", { desc = "Open all folds" })

-- window navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>wq", "<cmd>close<cr>", { desc = "Close window" })

