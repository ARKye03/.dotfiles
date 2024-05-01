{ ... }:
let
  theme = "Catppuccin_Mocha";
in
{
  programs.bat = {
    enable = true;
    config = {
      theme = theme;
    };
  };

  home.file.".config/bat/themes/${theme}.tmTheme".source = ../extra/bat/Catppuccin_Mocha.tmTheme;
}
