#!/bin/sh

export DOTFILES=$HOME/.dotfiles

# Default settings
BRANCH=${BRANCH:-dev}
REMOTE=${REMOTE:-https://github.com/bagrat/dotfiles.git}

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

error() {
    echo ${RED}"Error: $@"${RESET} >&2
}

setup_color() {
    # Only use colors if connected to a terminal
    if [ -t 1 ]; then
        RED=$(printf '\033[31m')
        GREEN=$(printf '\034[32m')
        YELLOW=$(printf '\033[33m')
        BLUE=$(printf '\033[34m')
        BOLD=$(printf '\033[1m')
        RESET=$(printf '\033[m')
    else
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        BOLD=""
        RESET=""
    fi
}

backup_and_install() {
    src=$1
    dest=$2

    if [ -e $dest ]
    then
        mv "$dest" "$dest.$(date +%Y-%m-%d_%H-%M-%S).bak"
    fi

    cp $src $dest
}

setup_dotfiles() {
    command_exists git || {
        error "git is not installed"
        exit 1
    }

    # Clone dotfiles
    git clone --depth=1 --branch "$BRANCH" "$REMOTE" "$DOTFILES" || {
        error "git clone of dotfiles repo failed"
        exit 1
    }

    for file in $DOTFILES/files/*
    do
        backup_and_install "$file" ".$(basename $file)"
    done
}

setup_omz() {
    # Configuration for Oh-my-zsh installer
    export REMOTE=${OMZ_BRANCH:-https://github.com/bagrat/oh-my-zsh.git}
    export BRANCH=${OMZ_BRANCH:-dev}
    export CHSH=yes
    export RUNZSH=no

    # Install Oh-my-zsh
    OMZ_INSTALL_URL="https://raw.githubusercontent.com/bagrat/oh-my-zsh/master/tools/install.sh"

    sh -c "$(curl -fsSL $OMZ_INSTALL_URL)"
}

main() {
    OS=$(uname -s)

    if [ "$OS" = "Linux" ]
    then
        if [ -n "$(uname -a | grep Ubuntu)" ]; then
            sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install -y zsh
        fi
    else
        if [ "$OS" = "Darwin" ]
        then
	    if ! command_exists brew
            then
                /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
                # brew bundle --file=$DOTFILES/macos/Brewfile
            fi
        fi
    fi

    setup_color
    setup_dotfiles
    setup_omz

    echo
    echo "Dotfiles are installed successfully!"
}

main "$@"
