return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        php_lsp = {
          mason = false,
          cmd = { "phpantom_lsp" },
          filetypes = { "php" },
          root_markers = { "composer.json", ".git" },
        },
      },
    },
  }, -- Stop Mason from auto-installing php-cs-fixer
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return tool ~= "php-cs-fixer"
      end, opts.ensure_installed or {})
    end,
  },

  -- Stop conform from formatting PHP with php-cs-fixer
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { "pint" } -- or {} for no PHP formatter
    end,
  },
}
