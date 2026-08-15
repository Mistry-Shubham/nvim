return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local lintfmt = require("core.lintfmt")

    -- Static linters for non-JS filetypes (JS/TS/svelte resolved dynamically below).
    lint.linters_by_ft = {
      python = { "pylint" },
    }

    local js_fts = {
      javascript = true,
      typescript = true,
      javascriptreact = true,
      typescriptreact = true,
      svelte = true,
    }

    -- Priority: biomejs -> oxlint -> eslint_d. Returns nil for non-JS filetypes.
    local function resolve_linters(bufnr)
      local ft = vim.bo[bufnr].filetype
      if not js_fts[ft] then
        return nil
      end
      if lintfmt.is_configured(bufnr, lintfmt.config_files.biome) then
        return { "biomejs" }
      end
      if lintfmt.is_configured(bufnr, lintfmt.config_files.oxlint) then
        return { "oxlint" }
      end
      if lintfmt.is_configured(bufnr, lintfmt.config_files.eslint) then
        return { "eslint_d" }
      end
      return {}
    end

    local function lint_current()
      local linters = resolve_linters(0)
      if linters == nil then
        lint.try_lint() -- default resolution (e.g. python -> pylint)
      elseif #linters > 0 then
        lint.try_lint(linters) -- conditional biome/oxlint/eslint_d
      end
      -- else: no config present -> skip
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = lint_current,
    })

    vim.keymap.set("n", "<leader>ml", lint_current, { desc = "Trigger linting for current file" })
  end,
}
