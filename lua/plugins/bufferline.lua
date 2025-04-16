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
  end,
}
