home_gen_name="Home default"

if [ $# -eq 0 ]; then
  echo "No name gen specified"
else
  home_gen_name=$1
fi

pushd ~/.dotfiles/home-manager/
home-manager switch

if [ $? -ne 0 ]; then
  echo "Error rebuilding home"
  exit 1
else
  echo "Home rebuilt successfully"
  echo "$home_gen_name" > home-generation
  echo "$(date)" >> home-generation
  
  git add .
  git commit -m "Home Generation: $home_gen_name"
  popd
fi
