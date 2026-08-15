local M = {}

-- Config filenames used to detect whether a tool is configured for a project.
-- Checked upward from the current file via vim.fs.root.
M.config_files = {
  biome = { "biome.json", "biome.jsonc" },
  oxfmt = { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts", "oxfmt.config.mts" },
  oxlint = { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts", "oxlint.config.mts" },
  prettier = {
    ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.yaml",
    ".prettierrc.json5", ".prettierrc.js", ".prettierrc.cjs", ".prettierrc.mjs",
    ".prettierrc.ts", ".prettierrc.cts", ".prettierrc.mts", ".prettierrc.toml",
    "prettier.config.js", "prettier.config.cjs", "prettier.config.mjs",
    "prettier.config.ts", "prettier.config.cts", "prettier.config.mts",
  },
  eslint = {
    "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs",
    "eslint.config.ts", "eslint.config.mts", "eslint.config.cts",
    ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json",
    ".eslintrc.yaml", ".eslintrc.yml",
  },
}

--- Whether any of `filenames` exists in the current buffer's directory tree.
function M.is_configured(bufnr, filenames)
  bufnr = bufnr or 0
  local fname = vim.api.nvim_buf_get_name(bufnr)
  if fname == "" then
    return false
  end
  return vim.fs.root(fname, filenames) ~= nil
end

return M
