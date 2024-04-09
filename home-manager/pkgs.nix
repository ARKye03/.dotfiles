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
  ];
in
{
  home.packages = with pkgs; [
    microsoft-edge
    discord
    telegram-desktop
    gnome-browser-connector
    fastfetch
    geogebra
    vlc
    libreoffice
    gh
    kitty
    uget
    ocs-url
    tgpt
    cava
    btop
    rustup
    uget-integrator
    networkmanager-openvpn
    nil
    nixpkgs-fmt
    unstable.vscode-fhs
    unstable.unityhub
    jetbrains.ruby-mine
    gnome.gnome-tweaks
    openvpn
    python3
    bun
    nodePackages.pnpm
  ] ++ gnomeExtensions;
}
