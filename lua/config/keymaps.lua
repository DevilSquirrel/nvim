-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
--插入模式
keymap.set("i", "jk", "<esc>")
keymap.set("i", "<esc>", "<nop>")
keymap.set("v", "<C-j>", "yP")
