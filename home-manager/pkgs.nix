{ pkgs, ... }: {
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

    # Langs utils
    rustup
    nil
    nixpkgs-fmt

    # System utils
    fastfetch
    uget
    tgpt
    tldr
    libnotify
    python3

    # VPN Stuff
    networkmanager-openvpn
    openvpn
    protonvpn-gui
  ];
}
