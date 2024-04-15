{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

  gnomeExtensions = with pkgs.gnomeExtensions; [
    nauta-connect
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
  ];
in
{
  home.packages = with pkgs; [
    # Web Browsers
    microsoft-edge
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
    uget-integrator
    networkmanager-openvpn
    nil
    nixpkgs-fmt
    unstable.vscode-fhs
    unstable.unityhub
    openvpn
    python3
    bun
    nodePackages.pnpm

    # GNOME Extensions
  ] ++ gnomeExtensions;
}
