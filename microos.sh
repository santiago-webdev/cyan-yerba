#!/usr/bin/env bash

# DESCRIPTION: This is a guide for myself so that I don't forget about any step along the way when setting up a MicroOS machine.


###
# SOFTWARE_INSTALL:
# In the last screen of the installer you can install one or two missing packages for KDE that provide thumbnail support for Dolphin
# and other software like toolbox(which I don't need right now).
#
#
# FULL_DISK_ENCRYPTION:
# In the last screen of the installer you can choose "Partitions" and
# there you'll be able to select "Guided Setup"
#
#
# PASSWORD:
# I use dvorak, so in the first screen of the microos installer you are going to type with the default US qwerty layout your password in the type test propt bar, and you are going to remember it
# even though it's not your real password, after that switch to dvorak and reach the end of the installer, in the last screen go to Partition, guided partitioning, when asked for a password type the characters
# that you remembered in the first prompt with that US qwerty layout, so now each time you start your computer you can type your password as if you were typing it in dvorak even though the luks2 decryption screen is using the qwerty layout.
#
#
# AUTOLOGIN_AND_PLASMA_WAYLAND_SESSION:
# In the installer you can set this up when creating your user. After
# you have booted your machine for the first time go to
# /etc/sysconfig/displaymanager and change DISPLAYMANAGER_XSERVER="Xorg"
# to DISPLAYMANAGER_XSERVER="Wayland" and for the last step go to
# /etc/sddm.conf.d/autologin.conf and add something like this:
# # https://wiki.archlinux.org/title/SDDM#Autologin
# [Autologin]
# User=your_user
# Session=plasmawayland
###


###
# RESTORING_MY_CONFIGS:
#
#
# FIREFOX:
# Start firefox once and then search with krunner for "Profile Manager" and create one with your name, start the session and close
# Firefox completely right away, now go to ~/.var/app/org.mozilla.firefox/.mozilla/firefox/ID.name and delete the ID.name of the profile that
# you just setup, now move and rename the mozilla profile from the backup drive to the same ID.name that you just deleted, once you open Firefox
# you'll have all your wallets and configs configured which the sync functionality can't really provide.
#
#
# FLATPAKS:
# https://github.com/santigo-zero/cyan-yerba
# Go to the repo cyan-yerba and execute ./flatpak.sh
#
#
# COLORSCHEMES:
# https://github.com/santigo-zero/JetJBP
#
#
# DOTFILES:
# https://github.com/santigo-zero/dotfiles/
# To get the dotfiles run:
# curl https://raw.githubusercontent.com/santigo-zero/dotfiles/master/clone-dotfiles | bash
# You can delete the directories ./dotfiles-master or ./dotfiles afterwards.
#
#
# DISTROBOX:
# https://github.com/santigo-zero/cyan-yerba
# https://github.com/89luca89/distrobox
# Go to the repo cyan-yerba and configure distrobox in the directory main-distrobox:
# ./image.sh && ./container.sh && distrobox enter main
# If zap fails you'll have to delete it and then exit and enter the main
# container again and hopefully zsh and zap will work properly.
#
#
# DEVELOPMENT_TOOLS
# Run tools.sh, a scripts that is in by dotfiles
#
#
# NEOVIM:
# https://github.com/santigo-zero/fractal-nvim
# To build from source use this command:
# make CMAKE_INSTALL_PREFIX=~/.local/ install
# After setting most tools you can run
# gcs git@github.com:santigo-zero/fractal-nvim.git "$XDG_CONFIG_HOME/nvim"
###



# This setting allows the user to continue running sudo in other windows
# and programs without requiring a password for a preset time period in
# each window.
sudo tee -a /etc/sudoers <<EOT
Defaults !tty_tickets
EOT



# # Install zsh
# sudo transactional-update pkg install zsh
# # Now switch to the z shell
# sudo usermod -s /bin/zsh "$USER"



# Change the hostname
echo "Choose new hostname name, the default value being 'fedora' but you can cancel with control+c"
read -r HOSTNAME_NEW
hostnamectl set-hostname "$HOSTNAME_NEW"
