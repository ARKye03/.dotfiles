#  _   _ _                _               
# | \ | (_)              | |              
# |  \| |___  ____ _ _ __| | ___   _  ___ 
# | . ` | \ \/ / _` | '__| |/ / | | |/ _ \
# | |\  | |>  < (_| | |  |   <| |_| |  __/
# |_| \_|_/_/\_\__,_|_|  |_|\_\\__, |\___|
#                               __/ |     
#                              |___/      
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    pinned-nixpkgs.url = "nixpkgs/706eef542dec88cc0ed25b9075d3037564b2d164";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, pinned-nixpkgs, home-manager, ... }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      overlay-pinned = final: prev: {
        pinned = import pinned-nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
      shell = pkgs.mkShell {
        nativeBuildInputs = with pkgs.buildPackages; [ 
        shfmt 
        nil
        nixpkgs-fmt
        ];
        shellHook = ''
          export MAIN_FLAKE="$HOME/.dotfiles/"
        '';
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
      homeConfigurations."nixarkye" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable overlay-pinned ]; })
          ./home-manager/home.nix
        ];
      };
      devShell.${system} = shell;
    };
}

