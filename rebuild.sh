#!/usr/bin/env bash
set -e # Exit on error

pushd /etc/nixos

git diff -U0

echo "Now rebuilding..."

sudo nixos-rebuild switch &> ./rebuild-log.txt || (cat ./rebuild-log.txt | grep --color error && false)

echo "Rebuild success!"

current=$(nixos-rebuild list-generations | grep current)

git add .

git commit -a -m "$current"

popd # return to whatever dir you were in

kdialog --msgbox "Nixos Rebuild Ok 👍"
