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

  red = "#7da6ff", -- soft blue for errors
  orange = "#4db5bd", -- desaturated teal
  yellow = "#6db9d6", -- muted blue-cyan
  green = "#00dba7", -- fresh mint green
  blue = "#61afef", -- mid blue (from tokyonight)
  cyan = "#56b6c2", -- softer cyan
  magenta = "#9aa5cf", -- muted lavender
  purple = "#9aa5cf", -- same as magenta for subtle purple
  teal = "#63c8aa", -- pastel mint teal

  terminal_black = "#414868",
  black = "#1e222a",
  white = "#abb2bf",

  git = {
    add = "#00dba7", -- mint green
    change = "#6db9d6", -- blue-cyan
    delete = "#7da6ff", -- soft blue
  },
}

return ret
