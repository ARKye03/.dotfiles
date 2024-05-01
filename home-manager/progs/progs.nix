{ ... }: {
  nixpkgs.config.allowUnfree = true;

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    firefox.enable = true;
    neovim.enable = true;
    yt-dlp.enable = true;

    home-manager.enable = true;
  };
}
