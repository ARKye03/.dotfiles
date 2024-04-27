#!/bin/bash

pushd ~/.dotfiles/ || exit
fd -e nix | while read -r file; do
  echo "Formatting: $file"
  nixpkgs-fmt "$file"
done
popd || exit