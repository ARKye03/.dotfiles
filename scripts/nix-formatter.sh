cd /home/nixarkye/.dotfiles/
find . -name "*.nix" -type f | while read -r file; do
  echo "Formatting: $file"
  nixpkgs-fmt "$file"
done