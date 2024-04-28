{ ... }:
let
  theme = "catppuccin_mocha";
in
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = theme;
    };
  };
}
