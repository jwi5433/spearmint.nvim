---@class Palette
local ret = {
  bg = "#282c34",
  bg_dark = "#21252b",
  bg_dark1 = "#1b1e2d",
  bg_highlight = "#2c313c",
  fg = "#abb2bf",
  fg_dark = "#7f848e",
  fg_gutter = "#3b4048",
  comment = "#5c6370",

  -- Accents
  red = "#6db9d6", -- soft blue-cyan
  orange = "#4db5bd", -- desaturated teal
  yellow = "#63c8aa", -- mint
  green = "#00dba7", -- brighter mint for success
  blue = "#61afef", -- mid blue
  cyan = "#56b6c2", -- softer cyan
  magenta = "#6db9d6", -- soft blue-cyan
  purple = "#4db5bd", -- teal
  teal = "#63c8aa", -- pastel mint teal

  terminal_black = "#414868",
  black = "#1e222a",
  white = "#abb2bf",

  git = {
    add = "#00dba7", -- mint green
    change = "#63c8aa", -- mint teal
    delete = "#6db9d6", -- soft blue-cyan
  },
}

return ret
