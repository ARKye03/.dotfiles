$gen_name = "Default"

if [ $# -eq 0 ]; then
  echo "No name gen specified"
else
  $gen_name = $1
fi

export NIXOS_LABEL="$gen_name"
sudo nixos-rebuild switch --impure

if [ $? -ne 0 ]; then
  echo "Error rebuilding system"
  exit 1
else
  echo "System rebuilt successfully"
  echo "$gen_name" > /home/nixarkye/.dotfiles/generation
  echo "$(date)" >> /home/nixarkye/.dotfiles/generation
  
  git add -A
  git commit -m "Nix Generation: $gen_name"
fi