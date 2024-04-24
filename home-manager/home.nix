{ config, ... }:
{
  imports = [
    ./shs.nix
    ./pkgs.nix
    ./gnome.nix
    ./gtk.nix
    ./progs/kitty.nix
    ./progs/vscode.nix
    ./progs/direnv.nix
    ./progs/cava.nix
  ];

  home = {
    username = "nixarkye";
    homeDirectory = "/home/nixarkye";
    stateVersion = "23.11";
    file = { };
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/.cargo/bin"
      "${config.home.homeDirectory}/.venv/bin"
      "${config.home.homeDirectory}/.local/share/gem/ruby/3.1.0/bin"
    ];
  };
  nixpkgs.config.allowUnfree = true;

  programs = {
    bat.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
    chromium.enable = true;
    firefox.enable = true;

    home-manager.enable = true;
  };
}
