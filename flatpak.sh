#!/usr/bin/env bash

flatpak upgrade -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak install flathub im.riot.Riot -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub io.gitlab.librewolf-community -y
flatpak install flathub com.github.tchx84.Flatseal -y
