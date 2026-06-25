return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = { "html" },
      },
      indent = { enable = true },
      ensure_installed = { "vue", "scss" },
    },
  },
}
