{ pkgs, ... }:
let
  gnomeExtras = with pkgs; [
    gnome-browser-connector
    gnome.gnome-tweaks
    amberol
  ];
in
{
  home.packages = with pkgs.gnomeExtensions; [
    arcmenu
    forge
    dash-to-dock
    caffeine
    grand-theft-focus
    blur-my-shell
    media-controls
    battery-indicator-icon
    clipboard-indicator
    tiling-assistant
    color-picker
    tray-icons-reloaded
    gsconnect
    transparent-window-moving
  ] ++ gnomeExtras;
}
