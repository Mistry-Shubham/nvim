local icons = require("core.icons")

-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = icons.added },
      change = { text = icons.modified },
      delete = { text = icons.removed },
      topdelete = { text = icons.removed },
      changedelete = { text = icons.modified },
    },
    signs_staged = {
      add = { text = icons.added },
      change = { text = icons.modified },
      delete = { text = icons.removed },
      topdelete = { text = icons.removed },
      changedelete = { text = icons.modified },
    },
  },
  keys = {
    {
      "]c",
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      expr = true,
      desc = "Next Git hunk",
    },
    {
      "[c",
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      expr = true,
      desc = "Previous Git hunk",
    },
    {
      "<leader>gb",
      "<cmd>Gitsigns toggle_current_line_blame<CR>",
      desc = "Toggle line git blame",
    },
  },
}
