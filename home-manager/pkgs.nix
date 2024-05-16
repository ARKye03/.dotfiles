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
    upscayl

    # Gaming
    osu-lazer-bin
    godot_4

    # Langs utils
    rustup
    nil
    nixpkgs-fmt
    zed-editor
    python3

    # System utils
    tree
    uget
    tgpt
    tldr
    libnotify
    wl-clipboard

    # VPN Stuff
    networkmanager-openvpn
    openvpn
    protonvpn-gui
  ];
}
