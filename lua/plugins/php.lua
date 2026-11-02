return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        php_lsp = {
          mason = false,
          cmd = { "php-lsp" },
          filetypes = { "php" },
          root_markers = { "composer.json", ".git" },
        },
      },
    },
  },
}
