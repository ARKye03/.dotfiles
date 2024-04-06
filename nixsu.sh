#
if [ $# -eq 0 ]; then
    echo "Need generation name as argument"
    exit 1
fi

echo "$1" > /home/nixarkye/.dotfiles/generation
echo "$(date)" >> /home/nixarkye/.dotfiles/generation

sudo nixos-rebuild switch
