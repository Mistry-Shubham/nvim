return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local lintfmt = require("core.lintfmt")
    local timeout_ms = 5000
    local lsp_fallback = "never"

    -- Priority: biome -> oxfmt -> prettier. Skip when no config file exists.
    local function resolve(bufnr, with_imports)
      if lintfmt.is_configured(bufnr, lintfmt.config_files.biome) then
        if with_imports then
          return { "biome", "biome-organize-imports" }
        end
        return { "biome" }
      end
      if lintfmt.is_configured(bufnr, lintfmt.config_files.oxfmt) then
        return { "oxfmt" }
      end
      if lintfmt.is_configured(bufnr, lintfmt.config_files.prettier) then
        return { "prettier" }
      end
      return {}
    end

    conform.setup({
      formatters_by_ft = {
        javascript = function(bufnr) return resolve(bufnr, true) end,
        typescript = function(bufnr) return resolve(bufnr, true) end,
        javascriptreact = function(bufnr) return resolve(bufnr, true) end,
        typescriptreact = function(bufnr) return resolve(bufnr, true) end,
        css = function(bufnr) return resolve(bufnr, false) end,
        html = function(bufnr) return resolve(bufnr, false) end,
        json = function(bufnr) return resolve(bufnr, false) end,
        yaml = { "prettier" },
        markdown = { "prettier" },
        toml = { "taplo" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
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
