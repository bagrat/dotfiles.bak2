if [ "$DOTFILES_ASK_UNINSTALL" != "no" ]
then
    read -r -p "Are you sure you want to remove Dotfiles? [y/N] " confirmation
    if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
        echo "Uninstall cancelled"
        exit
    fi
fi

for file in $DOTFILES/files/*
do
    dotfile="$HOME/.$(basename $file)"
    echo "Restoring $dotfile"
    rm -rf $dotfile
done

echo "Removing $DOTFILES"
if [ -d "$DOTFILES" ]; then
    rm -rf "$DOTFILES"
fi

# Uninstall Oh-my-zsh
sudo OMZ_ASK_UNINSTALL="no" sh $ZSH/tools/uninstall.sh
