{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  home.packages = with pkgs; [
    microsoft-edge
    discord
    telegram-desktop
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
    networkmanager-openvpn
    nil
    nixpkgs-fmt
    unstable.vscode-fhs
    openvpn
    python3
    xfce.thunar 
    copyq
    wofi
  ];
}
