#!/usr/bin/env bash

sudo tee -a /etc/sudoers <<EOT
Defaults !tty_tickets
EOT

# rpm-ostree upgrade
# rpm-ostree override remove plasma-discover plasma-discover-notifier plasma-discover-flatpak
# rpm-ostree kargs --append="pci=nocrs" # Fix for my Lenovo Ideapad 3 14IIL05

# Change the hostname
echo "New hostname name, the default value being 'fedora':"
read -r HOSTNAME_NEW
hostnamectl set-hostname "$HOSTNAME_NEW"

# Install zsh
rpm-ostree install --apply-live zsh
# Now switch to the z shell
sudo lchsh
sudo usermod -s /bin/zsh "$USER"
