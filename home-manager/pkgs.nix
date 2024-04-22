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
    # GnomeShits
    gnome-browser-connector
    gnome.gnome-tweaks

    # Communication
    discord
    telegram-desktop
    whatsapp-for-linux

    # Productivity
    libreoffice
    gh
    kitty
    ocs-url
    obsidian
    lunarvim

    # Media
    celluloid
    vlc
    geogebra
    amberol

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
    nil
    nixpkgs-fmt
    # unstable.unityhub
    python3

    # VPN Stuff
    networkmanager-openvpn
    openvpn
    protonvpn-gui

    # GNOME Extensions
  ] ++ gnomeExtensions;
}
