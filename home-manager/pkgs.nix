{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  home.packages = with pkgs; [
    microsoft-edge
    discord
    telegram-desktop
    gnome-browser-connector
    fastfetch
    geogebra
    celluloid
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
    nil
    nixpkgs-fmt
    unstable.vscode-fhs
    gnome.gnome-tweaks
    openvpn
    python3
  ];
}
