---@class spearmint.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias spearmint.Highlights table<string,spearmint.Highlight|string>

---@alias spearmint.HighlightsFn fun(colors: ColorScheme, opts:spearmint.Config):spearmint.Highlights

---@class spearmint.Cache
---@field groups spearmint.Highlights
---@field inputs table
