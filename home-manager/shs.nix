{ pkgs, config, ... }:

let
  shellAliases = {
    ll = "ls -l";
    lla = "ls -al";
    ns = "nix-shell";
    ndev = "nix develop";
    ne = "nix-env";
    nst = "nix-store";
    ls = "eza --color=always --long --git --icons=always --no-time --no-user --no-permissions --group-directories-first";
    lsa = "eza -a --color=always --long --git --icons=always --no-time --no-user --no-permissions --group-directories-first";
    ptd = "pnpm tauri dev";
    prd = "pnpm run dev";
    nixsu = "/home/nixarkye/.dotfiles/scripts/nixsu.sh";
    initshell = "/home/nixarkye/.dotfiles/scripts/InitShell.sh";
    homsu = "/home/nixarkye/.dotfiles/scripts/homsu.sh";
    homre = "home-manager switch --option substitute false";
    lvnix = "lvim /home/nixarkye/.dotfiles";
    codenix = "code ~/.dotfiles";
    zdots = "z ~/.dotfiles";

    #Git Aliases
    gc = "git clone";
    gs = "git status";
    gss = "git status -s";
    ga = "git add";
    gaa = "git add --all";
    gcm = "git commit -m";
    gco = "git checkout";
    gcb = "git checkout -b";
    gbr = "git branch";
    gbd = "git branch -d";
    gpl = "git pull";
    gplr = "git pull --rebase";
    gp = "git push";
    "gpf!" = "git push --force";
    gf = "git fetch";
    gr = "git restore";
    gplm = "git pull origin main";
    gpsm = "git push origin main";
    ggpull = "git pull origin \"$(git_current_branch)\"";
    ggpush = "git push origin \"$(git_current_branch)\"";
    gm = "git merge";
    gmom = "git merge origin/$(git_main_branch)";
    grs = "git restore";
    gsw = "git switch";
    gswc = "git switch -c";
    gswm = "git switch $(git_main_branch)";
    gswd = "git switch $(git_develop_branch)";
    gts = "git tag -s";
    gtv = "git tag | sort -V";

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

    # Make Aliases
    mr = "make run";
    mp = "make prune";
    mc = "make create";
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
        searchDownKey = "$terminfo[kcud1]";
        searchUpKey = "$terminfo[kcuu1]";
      };
      initExtra = ''
        #ZStyles Completions
        zstyle ':completion:*' verbose true
        zstyle ':completion:*:*:*:*:*' menu select

        ZSH_AUTOSUGGEST_STRATEGY=(history completion)

        bindkey '^[[1;5C' forward-word  # Ctrl + Right
        bindkey '^[[1;5D' backward-word  # Ctrl + Left
        bindkey '^H' backward-kill-word # Ctrl + Backspace
        bindkey "^L" clear-screen # Ctrl + L

        function git_current_branch() {
          git branch --show-current
        }
        function gd() {
          git diff --name-only --relative --diff-filter=d $@ | xargs bat --diff
        }

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
