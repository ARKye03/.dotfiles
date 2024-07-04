{ ... }:
let
  theme = "catppuccin_mocha";
in
{
  programs.btop = {
    enable = true;
    # settings = {
    #   color_theme = theme;
    # };
  };
  # home.file.".config/btop/themes/${theme}.theme".source = ../../extra/btop/catppuccin_mocha.theme;
}
