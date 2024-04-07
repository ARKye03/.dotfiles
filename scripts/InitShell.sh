if [ -f shell.nix ]; then
  exit 0
else
cat <<EOF > shell.nix
{ pkgs ? import <nixpkgs> {} }:
    pkgs.mkShell {
        # nativeBuildInputs is usually what you want -- tools you need to run
        nativeBuildInputs = with pkgs.buildPackages; [ "$@" ];
    }
EOF
fi
