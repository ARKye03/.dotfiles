{ pkgs, ... }:
let
  dotnet-combined = (with pkgs.dotnetCorePackages; combinePackages [
    sdk_8_0
  ]).overrideAttrs (finalAttrs: previousAttrs: {
    # This is needed to install workload in $HOME
    # https://discourse.nixos.org/t/dotnet-maui-workload/20370/2

    postBuild = (previousAttrs.postBuild or '''') + ''
       for i in $out/sdk/*
       do
         i=$(basename $i)
         length=$(printf "%s" "$i" | wc -c)
         substring=$(printf "%s" "$i" | cut -c 1-$(expr $length - 2))
         i="$substring""00"
         mkdir -p $out/metadata/workloads/''${i/-*}
         touch $out/metadata/workloads/''${i/-*}/userlocal
      done
    '';
  });
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  programs = {
    zsh.enable = true;
    git.enable = true;
    htop.enable = true;
    kdeconnect.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
    };
    # hyprland = {
    #   enable = true;
    #   xwayland.enable = true;
    # };
  };
  users.defaultUserShell = pkgs.zsh;

  time.timeZone = "America/Havana";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CU";
    LC_IDENTIFICATION = "es_CU";
    LC_MEASUREMENT = "es_CU";
    LC_MONETARY = "es_CU";
    LC_NAME = "es_CU";
    LC_NUMERIC = "es_CU";
    LC_PAPER = "es_CU";
    LC_TELEPHONE = "es_CU";
    LC_TIME = "es_CU";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.displayManager.sddm.wayland.enable = true;
  # services.desktopManager.plasma6.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.nixarkye = {
    isNormalUser = true;
    description = "nixarkye";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = [
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    dotnet-combined
    #dotnet-sdk_8
    ntfs3g
    gnumake
    gcc
    ffmpeg
    nmap
    wineWowPackages.stable
    qemu
    quickemu
  ];

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    noto-fonts

  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    DOTNET_ROOT = "${dotnet-combined}";
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  };

  system.stateVersion = "23.11";
}
