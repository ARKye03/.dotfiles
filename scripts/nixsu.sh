# shellcheck disable=SC2148
gen_name="Default"

if [ $# -eq 0 ]; then
  echo "No name gen specified"
else
  gen_name=$1
fi

pushd ~/.dotfiles/ || exit
gen_name="$(date +%d-%m-%Y_%H) ${gen_name}"

if ! (sudo nixos-rebuild switch); then
  echo "Error rebuilding system"
  exit 1
else
  echo "System rebuilt successfully"
  echo "$gen_name" > generation
  date >> generation
  
  git add configuration.nix generation flake.nix flake.lock
  git commit -m "Nix Generation: $gen_name"
  popd || exit
fi
