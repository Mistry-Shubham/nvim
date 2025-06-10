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
  vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line git blame" }),
}
