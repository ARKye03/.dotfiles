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
    ./progs/eza.nix
    ./progs/fzf.nix
    ./progs/zoxide.nix
    ./progs/bat.nix
    ./progs/progs.nix
  ];

  home = {
    username = "nixarkye";
    homeDirectory = "/home/nixarkye";
    stateVersion = "23.11";
    file = { };
    sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/.cargo/bin"
      "${config.home.homeDirectory}/.venv/bin"
      "${config.home.homeDirectory}/.local/share/gem/ruby/3.1.0/bin"
    ];
  };
}
