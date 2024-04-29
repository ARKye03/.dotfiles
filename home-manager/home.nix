{ config, ... }:
{
  imports = [
    ./shs.nix
    ./pkgs.nix
    ./desktop/gnome.nix
    ./desktop/gtk.nix
    ./progs/kitty.nix
    ./progs/alacritty.nix
    ./progs/vscode.nix
    ./progs/direnv.nix
    ./progs/cava.nix
    ./progs/btop.nix
    ./progs/progs.nix
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
}
