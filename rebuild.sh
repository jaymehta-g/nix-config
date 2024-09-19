#!/usr/bin/env bash
set -e # Exit on error

pushd /etc/nixos

git diff -U0

echo "Now rebuilding..."

logfile=/tmp/nixos-rebuild-log-$(date +"%H:%I:%M:%S").txt

sudo nixos-rebuild switch | tee $logfile || (cat $logfile | grep --color error && false)

echo "Rebuild success!"

current=$(nixos-rebuild list-generations | grep current)

git add .

git commit -a -m "$current"

popd # return to whatever dir you were in

kdialog --msgbox "Nixos Rebuild Ok 👍"
