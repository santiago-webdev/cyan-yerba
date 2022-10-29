#!/usr/bin/env bash

sudo tee -a /etc/sudoers <<EOT
Defaults !tty_tickets
EOT

# Enable automatic updates
sudo sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
rpm-ostree reload
systemctl enable rpm-ostreed-automatic.timer --now

# rpm-ostree override remove plasma-discover plasma-discover-notifier plasma-discover-flatpak

# RPM Fusion repos
# I install ffmpeg from here
rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm --apply-live
# I install intel-media-driver from here
rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm --apply-live
rpm-ostree install intel-media-driver ffmpeg --apply-live

# # https://coreos.github.io/rpm-ostree/countme/
# systemctl mask --now rpm-ostree-countme.timer

# Change the hostname
echo "New hostname name, the default value being 'fedora':"
read -r HOSTNAME_NEW
hostnamectl set-hostname "$HOSTNAME_NEW"

# Install zsh
rpm-ostree install --apply-live zsh
# Now switch to the z shell
sudo lchsh
sudo usermod -s /bin/zsh "$USER"
