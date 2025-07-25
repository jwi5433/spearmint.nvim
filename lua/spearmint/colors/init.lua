local Util = require("spearmint.util")

local M = {}

---@type table<string, Palette|fun(opts:spearmint.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("spearmint.colors." .. style))
  end,
})

---@param opts? spearmint.Config
function M.setup(opts)
  opts = require("spearmint.config").extend(opts)

  Util.day_brightness = opts.day_brightness

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Palette]]
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  colors.diff = {
    add = Util.blend_bg(colors.green2, 0.15),
    delete = Util.blend_bg(colors.red1, 0.15),
    change = Util.blend_bg(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.git.ignore = colors.dark3
  colors.black = Util.blend_bg(colors.bg, 0.8, "#000000")
  colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = Util.blend_bg(colors.blue0, 0.4)
  colors.bg_search = colors.blue0
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.error = colors.red1
  colors.todo = colors.blue
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  colors.rainbow = {
    colors.blue,
    colors.yellow,
    colors.green,
    colors.teal,
    colors.cyan,
    colors.orange,
    colors.red,
  }

  -- stylua: ignore
  --- @class TerminalColors
  colors.terminal = {
    black          = colors.black,
    black_bright   = colors.terminal_black,
    red            = colors.red,
    red_bright     = Util.brighten(colors.red),
    green          = colors.green,
    green_bright   = Util.brighten(colors.green),
    yellow         = colors.yellow,
    yellow_bright  = Util.brighten(colors.yellow),
    blue           = colors.blue,
    blue_bright    = Util.brighten(colors.blue),
    magenta        = colors.magenta,
    magenta_bright = Util.brighten(colors.magenta),
    cyan           = colors.cyan,
    cyan_bright    = Util.brighten(colors.cyan),
    white          = colors.fg_dark,
    white_bright   = colors.fg,
  }

  opts.on_highlights = function(hl, c)
    hl["@keyword"] = { fg = "#63c8aa" }

    hl["@function"] = { fg = "#00dba7" }

    hl["@variable"] = { fg = "#55b9a6" }

    hl["@constant"] = { fg = "#61afef" }

    hl["@type"] = { fg = "#6db9d6" }

    hl.String = { fg = "#4db5bd" }

    hl.Comment = { fg = "#5c6370", italic = true }

    hl.Visual = { bg = "#2d4d43" }

    hl.IndentBlanklineChar = { fg = "#4db5bd", nocombine = true }
    hl.IndentBlanklineContextChar = { fg = "#63c8aa", nocombine = true }

    hl.LineNr = { fg = "#879F91" }
    hl.CursorLineNr = { fg = "#00dba7", bold = true }
  end

  opts.on_colors(colors)

  return colors, opts
end

return M
