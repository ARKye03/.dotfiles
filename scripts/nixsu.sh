gen_name="Default"

if [ $# -eq 0 ]; then
  echo "No name gen specified"
else
  gen_name=$1
fi

pushd ~/.dotfiles/
gen_name="$(date +%d-%m-%Y_%H) ${gen_name}"

sudo nixos-rebuild switch &>nixos-switch.log 

if [ $? -ne 0 ]; then
  echo "Error rebuilding system"
  exit 1
else
  echo "System rebuilt successfully"
  echo "$gen_name" > generation
  echo "$(date)" >> generation
  
  git add configuration.nix generation
  git commit -m "Nix Generation: $gen_name"
  popd
fi
