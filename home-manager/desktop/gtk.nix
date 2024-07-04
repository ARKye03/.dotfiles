{ pkgs
, ...
}: {
  gtk = {
    enable = true;
     theme = {
       name = "Catppuccin-mocha-standard-mauve-dark";
      #  package = pkgs.catppuccin-gtk.override {
      #    accents = [ "mauve" ];
      #    size = "standard";
      #    tweaks = [ "rimless" ];
      #    variant = "mocha";
      #  };
     };
     cursorTheme = {
       package = pkgs.catppuccin-cursors.mochaDark;
       name = "Catppuccin-mocha-dark-cursors";
     };
    iconTheme = {
      name = "Colloid-purple-dark";
      package = pkgs.colloid-icon-theme.override {
        schemeVariants = [ "default" ];
        colorVariants = [ "purple" ];
      };
    };
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
  
  # Now symlink the `~/.config/gtk-4.0/` folder declaratively:
  # home.file = {
  #   "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  #   "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  #   "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  # };
}
