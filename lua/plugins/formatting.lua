return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local timeout_ms = 5000
    local lsp_fallback = "never"

    conform.setup({
      formatters_by_ft = {
        javascript = { "biome", "biome-organize-imports", "prettier" },
        typescript = { "biome", "biome-organize-imports", "prettier" },
        javascriptreact = { "biome", "biome-organize-imports", "prettier" },
        typescriptreact = { "biome", "biome-organize-imports", "prettier" },
        css = { "biome", "prettier" },
        html = { "biome", "prettier" },
        json = { "biome", "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = lsp_fallback,
        async = false,
        timeout_ms = timeout_ms,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = lsp_fallback,
        async = false,
        timeout_ms = timeout_ms,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
