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
    ocs-url
    obsidian
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

  ];
}
