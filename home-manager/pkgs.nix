{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Communication
    discord
    telegram-desktop

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
    godot_4
    unityhub

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
    wl-copy

    # VPN Stuff
    networkmanager-openvpn
    openvpn
    protonvpn-gui
  ];
}
