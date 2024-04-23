{ config, pkgs, ... }:
{
  imports = [
    ./shs.nix
    ./pkgs.nix
    ./gnome.nix
    ./gtk.nix
    ./progs/kitty.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nixarkye";
  home.homeDirectory = "/home/nixarkye";

  home.stateVersion = "23.11";

  home.file = { };
  nixpkgs.config.allowUnfree = true;

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
    "${config.home.homeDirectory}/.venv/bin"
    "${config.home.homeDirectory}/.local/share/gem/ruby/3.1.0/bin"
  ];

  programs = {
    bat.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
    chromium.enable = true;
    firefox.enable = true;
    cava.enable = true;
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    home-manager.enable = true;
  };
}
