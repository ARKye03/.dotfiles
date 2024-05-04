# shellcheck disable=SC2148
home_gen_name="Home default"

if [ $# -eq 0 ]; then
  echo "No name gen specified"
else
  home_gen_name=$1
fi

pushd ~/.dotfiles/home-manager/ || exit

if ! (home-manager switch --flake ../ | tee home-switch.log >/dev/null); then
  echo "Error rebuilding home"
  exit 1
else
  echo "Home rebuilt successfully"
  echo "$home_gen_name" > home-generation
  date >> home-generation
  
  git add .
  git commit -m "Home Generation: $home_gen_name"
  popd || exit
fi
