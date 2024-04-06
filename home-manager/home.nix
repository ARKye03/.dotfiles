{ config, ... }:
{
  imports = [
    ./shs.nix
    ./pkgs.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nixarkye";
  home.homeDirectory = "/home/nixarkye";

  home.stateVersion = "23.11";

  home.file = {
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
  ];

  programs.home-manager.enable = true;
}
