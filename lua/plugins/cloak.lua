return {
  "laytan/cloak.nvim",
  config = function()
    local cloak = require("cloak")

    cloak.setup({
      enabled = true,
      cloak_character = "*",
      try_all_patterns = true,
      cloak_telescope = true,
      cloak_on_leave = true,
      patterns = {
        {
          file_pattern = ".env*",
          cloak_pattern = "=.+",
        },
      },
    })
    local keymap = vim.keymap
    keymap.set("n", "<leader>csc", "<cmd>CloakPreviewLine<CR>", { desc = "Previw secret under cursor" })
    keymap.set("n", "<leader>cst", "<cmd>CloakToggle<CR>", { desc = "Toggle hidden secrets" })
  end,
}
