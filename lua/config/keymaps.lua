-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "C-d + zz" })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "C-u + zz" })
vim.keymap.set("n", "<leader>r", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "Search and replace" })
vim.keymap.set("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run test under cursor" })
vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end, { desc = "Open test window" })
vim.keymap.set("n", "<leader>ts", function()
  require("neotest").run.stop()
end, { desc = "Stop running tests" })
vim.keymap.set("n", "<leader>tp", function()
  require("neotest").output_panel.open()
end, { desc = "Open test panel" })
vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run tests in current file" })
