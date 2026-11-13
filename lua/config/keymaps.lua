-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
--插入模式
keymap.set("i", "jk", "<esc>")
keymap.set("i", "<esc>", "<nop>")
keymap.set("v", "<C-j>", function() 
  local saved = vim.fn.getreg("+")
  local saved_type = vim.fn.getregtype("+")
  vim.cmd.normal('"+y')
  vim.cmd("'>put +")
  vim.fn.setreg("+", saved, saved_type)
end, { noremap = true, silent = true, desc = "复制一行" })
keymap.set("n", "<C-j>", function()
  local saved = vim.fn.getreg("+")
  local saved_type = vim.fn.getregtype("+")
  vim.cmd.normal('"+yyp')
  vim.fn.setreg("+", saved, saved_type)
end, { noremap = true, silent = true, desc = "复制一行" })
-- keymap.set("n", "H", "H", { desc = "Go to top of visible screen" });
-- keymap.set({"n"}, "p", "viwp")
-- vim.keymap.set("n", "<localleader>q", function()
--   vim.cmd([[execute "normal! mqA;\<esc>`q"]]);
-- end, { noremap = true, silent = true, desc = "在行尾添加分号" });
-- vim.keymap.set("n", "<localleader>q", "mqA;<esc>`q", { noremap = true, silent = true, desc = "在行尾添加分号" })
vim.keymap.set("n", "<localleader>c", function()
  -- print(vim.inspect(vim.fn.getregion(vim.fn.getpos('.'), vim.fn.getpos('v'))))
  -- local saved = vim.fn.getreg("/")
  -- local saved_type = vim.fn.getregtype("/")
  --
  -- local key = "set"
  -- vim.cmd('execute "normal! gg/' .. key .. '\\<cr>n"')
  --
  -- vim.fn.setreg("/", saved, saved_type)
  -- vim.cmd('execute "normal! ceLiuyC\\<esc>"')
  -- vim.cmd('execute "normal! Go<input />\\<esc>"')
  -- vim.cmd.normal("")
  --
  -- local version = vim.fn.system({"python3", "-c", "import sys; print(sys.version)"})
  local version = vim.fn.system({ "python3", "C://Users/Administrator/AppData/Local/nvim/test.py" })
  print(version)
end, {
  desc = "测试用",
})

vim.keymap.set("n", "*", function()
  local view = vim.fn.winsaveview()
  vim.cmd("normal! *")
  vim.fn.winrestview(view)
end, { desc = "搜索光标下单词但不移动光标" })

vim.keymap.set("n", "#", function()
  local view = vim.fn.winsaveview()
  vim.cmd("normal! #")
  vim.fn.winrestview(view)
end, { desc = "反向搜索光标下单词但不移动光标" })
-- keymap
-- keymap    keymap
-- keymap
