{ ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    settings = {
      disable_ligatures = "never";
      cursor_shape = "block";
      scrollback_lines = 2000;
      enable_audio_bell = true;
      url_style = "curly";
      open_url_with = "default";
      detect_url = true;
      draw_minimal_borders = true;
      background_opacity = "0.98";
    };
  };
}
