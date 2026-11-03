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
  },
}
