if [ -f shell.nix ]; then
  exit 0
else
# cat <<EOF > shell.nix
# { pkgs ? import <nixpkgs> {} }:
#     pkgs.mkShell {
#         # nativeBuildInputs is usually what you want -- tools you need to run
#         nativeBuildInputs = with pkgs.buildPackages; [ $@ ];
#     }
# EOF
cat <<EOF > flake.nix
{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.\${system};
          shell = pkgs.mkShell {
            nativeBuildInputs = with pkgs.buildPackages; [ $@ ];
          };
        in
        {
          devShells.default = shell;
        }
      );
}
EOF
fi
