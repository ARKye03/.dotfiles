{ ... }: {
  nixpkgs.config.allowUnfree = true;

  programs = {
    bat.enable = true;
    ripgrep.enable = true;
    zoxide.enable = true;
    fd.enable = true;
    firefox.enable = true;
    neovim.enable = true;
    yt-dlp.enable = true;

    home-manager.enable = true;
  };
}
