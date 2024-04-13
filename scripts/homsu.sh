home_gen_name="Home default"

if [ $# -eq 0 ]; then
  echo "No name gen specified"
else
  home_gen_name=$1
fi

export NIXOS_LABEL="$home_gen_name"
home-manager switch --impure

if [ $? -ne 0 ]; then
  echo "Error rebuilding home"
  exit 1
else
  echo "Home rebuilt successfully"
  echo "$home_gen_name" > /home/nixarkye/.dotfiles/home-manager/home-generation
  echo "$(date)" >> /home/nixarkye/.dotfiles/home-manager/home-generation
  
  cd /home/nixarkye/.dotfiles/
  git add home-manager/
  git commit -m "Home Generation: $home_gen_name"
fi
