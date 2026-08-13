return {
  -- "folke/tokyonight.nvim",
  -- lazy = true,
  -- opts = {
  --   style = "night", --"day",
  --   transparent = true,
  --   styles = {},
  -- },
  --
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim", opts = {
    transparent_mode = true,
  } },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
