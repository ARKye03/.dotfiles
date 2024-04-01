{ pkgs, ... }:
{
  home.packages = [
    pkgs.protonvpn-cli
    pkgs.microsoft-edge
    pkgs.discord
    pkgs.telegram-desktop
    pkgs.gnome-browser-connector
    pkgs.fastfetch
    pkgs.geogebra
    pkgs.celluloid
    pkgs.libreoffice
    pkgs.gh
    pkgs.kitty
    pkgs.uget
    pkgs.ocs-url
    pkgs.tgpt
    pkgs.cava
    pkgs.btop
    pkgs.warp-terminal
  ];
}