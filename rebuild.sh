#!/usr/bin/env bash

push=true

if [ $# -gt 0 ] && ( [ $1 = "-n" ] || [ $1 = "--no-push" ] ); then
    echo "No push selected"
    push=false
fi

pushd /etc/nixos

git add -A

git diff -U0 HEAD

echo "Now rebuilding..."

rebuildcommand="nixos-rebuild switch"

pkexec $rebuildcommand

if [ $? -ne 0 ]; then
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

zenity --info --text="Nixos Rebuild Ok 👍"
