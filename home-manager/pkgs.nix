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

    #Main-langs
    rustup
    nil
    nixpkgs-fmt

    # System Utilities
    fastfetch
    uget
    tgpt
    btop
    tldr
    fd
    ripgrep
    # unstable.unityhub
    python3

    # VPN Stuff
    networkmanager-openvpn
    openvpn
    protonvpn-gui
  ];
}
