return {
  "tpope/vim-projectionist",
  lazy = false,
  config = function()
    vim.g.projectionist_heuristics = {
      ["config/environment.rb&test/"] = {
        ["app/*.rb"] = {
          alternate = "test/{}_test.rb",
        },
        ["test/*_test.rb"] = {
          alternate = "app/{}.rb",
        },
      },
    }
  end,
  keys = {
    { "<leader>fa", "<cmd>A<CR>", desc = "Alternate file" },
  },
}
