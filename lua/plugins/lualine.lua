return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "wombat",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = { "branch" },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_d = {
          -- { "searchcount", padding = { left = 0, right = 1 } },
        },
        lualine_x = {
          Snacks.profiler.status(),
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = function() return { fg = Snacks.util.color("Statement") } end,
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = function() return { fg = Snacks.util.color("Constant") } end,
        },
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          color = function() return { fg = Snacks.util.color("Debug") } end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return { fg = Snacks.util.color("Special") } end,
        },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "searchcount", padding = { left = 2, right = 1 } },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
          -- {
          --   function()
          --     -- 获取当前 buffer 里的所有行
          --     local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          --     -- 把字符串列表变成一个长字符串，用空格分隔
          --     local content = table.concat(lines, " ")
          --     -- 对于每个匹配这个模式 `%a+` 的子串，增加单词计数器
          --     -- 模式 `%a+` 是行中的字母 [a-z][A-Z]
          --     -- 如果要用字母数字而不是纯字母，用 `%w+`
          --     local words = 0
          --     for _ in content:gmatch("%a+") do
          --       words = words + 1
          --     end
          --
          --     -- 返回单词计数，这样它就会出现在 lualine 里
          --     -- 如果你想显示 "Word count: 87" 这样的话，写 `return "Word count: " .. words`
          --     return words
          --   end,
          -- },
        },
        lualine_z = {
          function()
            return " " .. os.date("%Y-%m-%d %H:%M:%S")
          end,
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      -- local trouble = require("trouble")
      -- local symbols = trouble.statusline({
      --   mode = "symbols",
      --   groups = {},
      --   title = false,
      --   filter = { range = true },
      --   format = "{kind_icon}{symbol.name:Normal}",
      --   hl_group = "lualine_c_normal",
      -- })
      -- table.insert(opts.sections.lualine_c, {
      --   symbols and symbols.get,
      --   cond = function()
      --     return vim.b.trouble_lualine ~= false and symbols.has()
      --   end,
      -- })
    end

    -- table.insert(opts.sections.lualine_x, {
    --   function()
    --     return "😄你好[刘豫川]"
    --   end,
    -- })
    return opts
  end,
}
