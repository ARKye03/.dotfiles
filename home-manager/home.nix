{ config, pkgs, ... }:
let
  shellAliases = {
    ll = "ls -l";
    nixsu = "sudo nixos-rebuild switch";
    homsu = "home-manager switch";
    lvnix = "sudo lvim /etc/nixos/configuration.nix";
    lvhom = "lvim /home/nixarkye/.config/home-manager/home.nix";
    gc = "git clone";
    codenix = "code /home/nixarkye/.dotfiles";
    #.Net Aliases
    dn = "dotnet new";
    dr = "dotnet run";
    dt = "dotnet test";
    dw = "dotnet watch";
    dwr = "dotnet watch run";
    dwt = "dotnet watch test";
    ds = "dotnet sln";
    da = "dotnet add";
    dp = "dotnet pack";
    dng = "dotnet nuget";
    db = "dotnet build";
  };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nixarkye";
  home.homeDirectory = "/home/nixarkye";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.protonvpn-cli
    pkgs.microsoft-edge
    pkgs.discord
    pkgs.telegram-desktop
    pkgs.gnome-browser-connector
    pkgs.fastfetch
    pkgs.geogebra
    pkgs.celluloid
    pkgs.libreoffice
    pkgs.gh
    pkgs.kitty
    pkgs.uget
    pkgs.ocs-url
    pkgs.tgpt
    pkgs.cava
    pkgs.btop
    pkgs.warp-terminal

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nixarkye/etc/profile.d/hm-session-vars.sh
  #
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.cargo/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = shellAliases;
    history = {
      ignoreDups = true;
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };
}
