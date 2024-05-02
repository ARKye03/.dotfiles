{ ... }: {
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./terms/kitty.nix
    ./terms/alacritty.nix
    ./code/vscode.nix
    ./code/direnv.nix
    ./utils/btop.nix
    ./utils/eza.nix
    ./utils/fzf.nix
    ./utils/zoxide.nix
    ./utils/bat.nix
    ./utils/thefuck.nix
    ./audio/cava.nix
  ];

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    firefox.enable = true;
    neovim.enable = true;
    yt-dlp.enable = true;

    home-manager.enable = true;
  };
}
