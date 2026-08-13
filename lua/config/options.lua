-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- vim.opt.tabstop = 2        -- 一个 Tab 显示为 4 个空格的宽度
-- vim.opt.shiftwidth = 2     -- 自动缩进（如 ==, >>, <<）时每级缩进 4 格
-- vim.opt.softtabstop = 2    -- 按 Tab/Backspace 键时操作 4 个空格
-- vim.opt.expandtab = true   -- 将 Tab 转换为空格（避免混合 Tab 和空格）
vim.cmd("source  ~/AppData/Local/nvim/test.vim")
vim.g.lazyvim_mini_snippets_in_completion = true
vim.g.lazyvim_eslint_auto_format = false
vim.g.snacks_animate = false
