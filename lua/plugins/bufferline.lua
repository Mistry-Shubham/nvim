return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers",
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
      highlights = {
        buffer_selected = {
          bold = true,
          italic = false,
          underline = true,
          fg = "#00BFFF",
        },
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<Tab>", "<cmd>:bnext<CR>", { desc = "Switch next buffer" })
    keymap.set("n", "<S-Tab>", "<cmd>:bprevious<CR>", { desc = "Switch previous buffer" })
    keymap.set("n", "<leader>bx", "<cmd>:bdelete!<CR>", { desc = "Close current active buffer" })
    keymap.set("n", "<leader>ba", "<cmd>:BufferLineCloseOthers<CR><cmd>:bdelete!<CR>", { desc = "Close all the buffers" })
  end,
}
