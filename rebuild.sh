#!/usr/bin/env bash

pushd /etc/nixos

git diff -U0 HEAD

echo "Now rebuilding..."

rebuildcommand="nixos-rebuild switch"
which ksshaskpass
if [ $? -eq 0 ]; then
    SUDO_ASKPASS=$(which ksshaskpass) sudo -A $rebuildcommand
else
    sudo $rebuildcommand
fi

if [ $? -ne 0 ]; then
    echo "Nixos Rebuilt Unsuccessful, see above"
    read
    exit 1
fi

echo "Rebuild success!"

current=$(nixos-rebuild list-generations | grep current)

git add .

git commit -a -m "$current"

popd # return to whatever dir you were in

kdialog --msgbox "Nixos Rebuild Ok 👍"
