{ pkgs, ... }:
let
  gnomeExtensions = with pkgs.gnomeExtensions; [
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
  ];
in
{
  home.packages = with pkgs; [
    # Web Browsers
    gnome-browser-connector

    # Communication
    discord
    telegram-desktop
    whatsapp-for-linux

    # Productivity
    libreoffice
    gh
    kitty
    ocs-url
    gnome.gnome-tweaks
    lunarvim

    # Media
    celluloid
    vlc
    geogebra

    # Gaming
    osu-lazer-bin

    #Rust-lang
    rustup

    # System Utilities
    fastfetch
    uget
    tgpt
    cava
    btop
    tldr
    fd
    ripgrep
    networkmanager-openvpn
    nil
    nixpkgs-fmt
    # unstable.unityhub
    openvpn
    python3

    # GNOME Extensions
  ] ++ gnomeExtensions;
}
