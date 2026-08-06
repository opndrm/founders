local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback { 'JetBrains Mono', 'Menlo' }
config.font_size = 14
config.line_height = 1.08
config.color_scheme = 'OPNDRM Black'
config.color_schemes = {
  ['OPNDRM Black'] = {
    foreground = '#ffffff', background = '#171717', cursor_bg = '#8b8b8b',
    cursor_fg = '#171717', cursor_border = '#8b8b8b', selection_bg = '#4d4d4d',
    selection_fg = '#ffffff', scrollbar_thumb = '#4d4d4d', split = '#666666',
    ansi = { '#000000', '#990000', '#00a600', '#999900', '#0000b2', '#b200b2', '#00a6b2', '#bfbfbf' },
    brights = { '#666666', '#e50000', '#00d900', '#e5e500', '#0000ff', '#e500e5', '#00e5e5', '#e5e5e5' },
  },
}
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }
config.bold_brightens_ansi_colors = true
if wezterm.target_triple:find('darwin') then
  config.window_decorations = 'INTEGRATED_BUTTONS | RESIZE'
  config.integrated_title_button_style = 'MacOsNative'
  config.integrated_title_button_alignment = 'Left'
  config.integrated_title_buttons = { 'Hide', 'Maximize', 'Close' }
else
  config.window_decorations = 'TITLE | RESIZE'
end
config.window_background_opacity = 1.0
config.window_padding = { left = 14, right = 14, top = 12, bottom = 12 }
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.scrollback_lines = 10000
config.audible_bell = 'Disabled'

return config
