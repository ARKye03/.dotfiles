{ pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./cachix.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  programs = {
    zsh.enable = true;
    git.enable = true;
    htop.enable = true;
    kdeconnect.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  # Set your time zone.
  time.timeZone = "America/Havana";

  # Select internationalisation properties.
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
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

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
    dotnet-sdk_8
    ntfs3g
    gnumake
    gcc
    ffmpeg
    nmap
    wineWowPackages.stable
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
    API_KEY = "sk-lsjiwh2df";
  };

  system.stateVersion = "23.11";
}
