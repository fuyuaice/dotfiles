local wezterm = require 'wezterm';
return {
    -- font
    font = wezterm.font_with_fallback({
    {family="PlemolJP Console NF", weight="Medium", style="Italic"},
  }),
    font_size = 13.5,
    color_scheme = "iceberg-dark",
    -- padding
    window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- tab bar
  use_fancy_tab_bar = false,
  colors = {
    --cursor_bg= "#444b71",
    tab_bar = {
      background = "#1b1f2f",

      active_tab = {
        bg_color = "#444b71",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = "#282d3e",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab_hover = {
        bg_color = "#1b1f2f",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = true,
        strikethrough = false,
      },

      new_tab = {
        bg_color = "#1b1f2f",
        fg_color = "#c6c8d1",
        italic = false
      },

      new_tab_hover = {
        bg_color = "#444b71",
        fg_color = "#c6c8d1",
        italic = false
      },
    }
  },

  force_reverse_video_cursor = true,

  -- background
  window_background_opacity = 0.8,
  --title
  wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    return {
      {Text=" " .. tab.active_pane.title .. " "},
    }
  end),
  -- shell
  default_prog = {"zsh","--login"},
}
