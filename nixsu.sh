if [ $# -eq 0 ]; then
  echo "Need generation name as argument"
  exit 1
fi

export NIXOS_LABEL="$1"
sudo nixos-rebuild switch --impure

if [ $? -ne 0 ]; then
  echo "Error rebuilding system"
  exit 1
else
  echo "System rebuilt successfully"
  echo "$1" > /home/nixarkye/.dotfiles/generation
  echo "$(date)" >> /home/nixarkye/.dotfiles/generation
  
  git add -A
  git commit -m "New Generation: $1"
fi
