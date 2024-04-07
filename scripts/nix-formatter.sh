#!/bin/bash

# Loop through all files in the current directory and its subdirectories
find . -name "*.nix" -type f | while read -r file; do
    # Apply "nixpkgs-fmt" to the file
    echo "Formatting: $file"
    nixpkgs-fmt "$file"
done