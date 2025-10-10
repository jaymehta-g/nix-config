#!/usr/bin/env bash

push=true

if [ $# -gt 0 ]; then
    if ( [ $1 = "-n" ] || [ $1 = "--no-push" ] ); then
        echo "No push selected"
        push=false
    else
        echo "Invalid option"
        echo "--no-push or -n to not push after commit"
        exit 1
    fi
fi

pushd /etc/nixos

git add -A

git diff -U0 HEAD

echo "Now rebuilding..."

rebuildcommand="nixos-rebuild switch"

pkexec $rebuildcommand

if [ $? -ne 0 ]; then
    popd
    zenity --info --text="Nixos Rebuild Failed 💔💔💔"
    echo "Nixos Rebuilt Unsuccessful, see above"
    read
    exit 1
fi

echo "Rebuild success!"

current=$(nixos-rebuild list-generations | grep current)

git add .

git commit -a -m "$current"

if [ $push = true ]; then
    git push
fi

popd # return to whatever dir you were in

zenity --info --text="Nix Rebuild Ok 🤠"
