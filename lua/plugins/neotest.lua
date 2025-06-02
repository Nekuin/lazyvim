return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
    "zidhuss/neotest-minitest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-minitest")({
          test_cmd = function()
            local command = vim.tbl_flatten({
              "docker",
              "compose",
              "exec",
              "dev",
              "bin/rails",
              "test",
            })

            vim.print("Neotest Minitest test_cmd:", command)

            return command
          end,

          transform_spec_path = function(path)
            local prefix = require("neotest-minitest").root(path)
            local transformed_path = string.sub(path, string.len(prefix) + 2, -1)
            local line = vim.fn.line(".")

            vim.print("Neotest Minitest path:", { original = path, transformed_path })

            return transformed_path .. ":" .. line
          end,

          results_path = "tmp/minitest.output",
        }),
      },
    })
  end,
}
