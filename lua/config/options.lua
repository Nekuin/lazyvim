-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Define Ruby LSP based on Ruby version
local v = vim.version.parse(vim.fn.system({ "ruby", "-v" }), { strict = false })
if v ~= nil then
  if vim.version.gt(v, { 3, 0, 0 }) then
    vim.g.lazyvim_ruby_lsp = "ruby_lsp"
    vim.g.lazyvim_ruby_formatter = "ruby_lsp"
  else
    vim.g.lazyvim_ruby_lsp = "solargraph"
    vim.g.lazyvim_ruby_formatter = "null"
  end
end
