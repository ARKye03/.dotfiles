#  _   _ _                _               
# | \ | (_)              | |              
# |  \| |___  ____ _ _ __| | ___   _  ___ 
# | . ` | \ \/ / _` | '__| |/ / | | |/ _ \
# | |\  | |>  < (_| | |  |   <| |_| |  __/
# |_| \_|_/_/\_\__,_|_|  |_|\_\\__, |\___|
#                               __/ |     
#                              |___/      
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}
