#!/usr/bin/env bash

pushd /etc/nixos

git diff -U0

echo "Now rebuilding..."

sudo nixos-rebuild switch

if [ $? -ne 0 ]; then
    echo "Nixos Rebuilt Unsuccessful, see above"
    read
    exit 1
fi

echo "Rebuild success!"

set -e # Exit on error

current=$(nixos-rebuild list-generations | grep current)

git add .

git commit -a -m "$current"

popd # return to whatever dir you were in

kdialog --msgbox "Nixos Rebuild Ok 👍"
