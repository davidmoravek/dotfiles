#!/bin/bash
cd "$(dirname "$0")"
git pull

function doSync() {
        rsync --exclude ".git/" --exclude ".DS_Store" --exclude ".gitignore" --exclude "sync.sh" --exclude "README.md" -av . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
        doSync
else
        read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
                doSync
        fi
fi

unset doSync
source ~/.bashrc
