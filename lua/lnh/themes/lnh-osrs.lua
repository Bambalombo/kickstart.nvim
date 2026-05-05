-- vim.o.guifont = 'RuneScape-Plain-12:h12:#e-alias:#h-none'

local T = {}

local colors = {
  Backgroubackground = '#000000',
  panel_bg = '#DEB887',
  alt_panel_bg = '#F5F5DC',

  -- Text Colors
  text_primary = '#FFFFFF',
  text_secondary = '#9F9F9F',
  text_tertiary = '#D3D3D3',
  text_alt = '#FFFFF0',
  text_accent_gold = '#FFD701',
  text_accent_khaki = '#F0E68C',
  text_accent_cyan = '#00FFFF',
  text_accent_green = '#006400',
  text_accent_orange = '#FF981F',
  text_quest_red = '#FF0000',
  text_quest_yellow = '#FEFE05',
  text_quest_green = '#0DC10D',

  border = '#808080',
  highlight_bg = '#F4A460',
  special = '#FFFF00',

  -- Quest Log Backgrounds
  background_main_brown = '#332B21',
  background_second_darkbrown = '#2b2116',
  background_alt_medium_brown = '#4a3a26',
  background_custom_alt_lighter_brown = '#59482E',
  background_alt_light_brown = '#7a623e',

  -- Other Accent Colors
  Muted_green_text = '#6fa24a',
  Cyanblue_accent_ = '#4aa3d4',
  white_light_text = '#d8d2b8',
  off_red = '#b23a2a',
  Gold_yellow_text = '#d4a21a',
  Bright_yellow_highlight = '#f2c94c',
}

function T.colorscheme()
  vim.cmd 'highlight clear'
  vim.cmd 'syntax reset'

  vim.o.background = 'dark'
  vim.g.colors_name = 'osrs-like'

  local set = vim.api.nvim_set_hl
  set(0, 'Normal', { bg = colors.background_main_brown, fg = colors.text_alt })
  set(0, 'Visual', { bg = colors.background_alt_light_brown })
  set(0, 'Comment', { fg = colors.text_secondary, italic = true })

  -- line numbers
  set(0, 'CursorLine', { bg = colors.background_alt_medium_brown })
  set(0, 'CursorLineNr', { fg = colors.text_accent_orange, bg = colors.background_alt_light_brown })
  set(0, 'LineNr', { fg = colors.panel_bg, bg = colors.background_alt_medium_brown })

  -- status line
  set(0, 'StatusLine', { fg = colors.alt_panel_bg, bg = colors.background_alt_light_brown })
  set(0, 'StatusLineNC', { fg = colors.panel_bg, bg = colors.background_alt_medium_brown })

  -- pop ups
  set(0, 'NormalFloat', { fg = colors.panel_bg, bg = colors.background_alt_medium_brown })
  set(0, 'FloatBorder', { fg = colors.panel_bg, bg = colors.background_alt_medium_brown })

  -- TODO: Fix other settings like set(0, "VertSplit", { fg = "#313244" })
  -- set(0, "WinSeparator", {  })
  -- -- Syntax
  -- set(0, "String", {  })
  -- set(0, "Number", {  })
  -- set(0, "Boolean", {  })
  -- set(0, "Function", {  })
  -- set(0, "Keyword", {  })
  -- set(0, "Type", {  })
  -- set(0, "Identifier", {  })
  -- -- UI feedback
  -- set(0, "Search", {  })
  -- set(0, "IncSearch", {  })
  -- -- Diagnostics
  -- set(0, "DiagnosticError", {  })
  -- set(0, "DiagnosticWarn", {  })
  -- set(0, "DiagnosticInfo", {  })
  -- set(0, "DiagnosticHint", {  })
end

return T
