{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Communication
    discord
    telegram-desktop
    whatsapp-for-linux

    # Productivity
    libreoffice
    gh
    kitty
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
    openvpn
    python3

  ];
}
