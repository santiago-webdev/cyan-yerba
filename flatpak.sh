#!/usr/bin/env bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

flatpak update --appstream
flatpak upgrade -y

flatpak install flathub im.riot.Riot -y

# flatpak install flathub org.videolan.VLC -y
flatpak install flathub io.mpv.Mpv -y

# flatpak install flathub io.gitlab.librewolf-community -y

flatpak install flathub com.github.tchx84.Flatseal -y
