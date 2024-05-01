{ pkgs, config, ... }:

let
  shellAliases = {
    ll = "ls -l";
    lla = "ls -al";
    ns = "nix-shell";
    ndev = "nix develop";
    ne = "nix-env";
    nst = "nix-store";
    ls = "eza --color=always --long --git --icons=always --no-time --no-user --no-permissions";
    lsa = "eza -a --color=always --long --git --icons=always --no-time --no-user --no-permissions";
    ptd = "pnpm tauri dev";
    prd = "pnpm run dev";
    nixsu = "/home/nixarkye/.dotfiles/scripts/nixsu.sh";
    initshell = "/home/nixarkye/.dotfiles/scripts/InitShell.sh";
    homsu = "/home/nixarkye/.dotfiles/scripts/homsu.sh";
    homre = "home-manager switch --option substitute false";
    lvnix = "lvim /home/nixarkye/.dotfiles";
    codenix = "code /home/nixarkye/.dotfiles";

    #Git Aliases
    gc = "git clone";
    gs = "git status";
    ga = "git add";
    gaa = "git add .";
    gcm = "git commit -m";
    gco = "git checkout";
    gcb = "git checkout -b";
    gbr = "git branch";
    gbd = "git branch -d";
    gpl = "git pull";
    gps = "git push";
    gd = "git diff";
    gr = "git restore";
    gplm = "git pull origin main";
    gpsm = "git push origin main";

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
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      shellAliases = shellAliases;
      history = {
        ignoreDups = true;
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      historySubstringSearch = {
        enable = true;
        searchDownKey = "^[[B";
        searchUpKey = "^[[A";
      };
      initExtra = ''
        bindkey '^[[1;5C' forward-word  # Ctrl + Right
        bindkey '^[[1;5D' backward-word  # Ctrl + Left
        bindkey '^H' backward-kill-word # Ctrl + Backspace
        bindkey "^L" clear-screen # Ctrl + L

        # pnpm
        export PNPM_HOME="/home/archkye/.local/share/pnpm"
        case ":$PATH:" in
          *":$PNPM_HOME:"*) ;;
          *) export PATH="$PNPM_HOME:$PATH" ;;
        esac
        # pnpm end
      '';
    };
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = shellAliases;
    };
    starship = {
      enable = true;
      # Configuration written to ~/.config/starship.toml
      settings = pkgs.lib.importTOML ./extra/starship.toml;
    };
  };
}
