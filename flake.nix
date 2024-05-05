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
    nixpkgs.url = "github:NixOS/nixpkgs/63c3a29ca82437c87573e4c6919b09a24ea61b0f";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
      homeConfigurations."nixarkye" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ];
      };
    };
}

