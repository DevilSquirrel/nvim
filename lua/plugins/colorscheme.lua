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
  -- { "ellisonleao/gruvbox.nvim", opts = {
  --   transparent_mode = true,
  -- } },

  -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },
  {
    "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte", -- latte, frappe, macchiato, mocha
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha", -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    },
  },
}
