#!/usr/bin/env bash

flatpak upgrade
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak install flathub im.riot.Riot -y
flatpak install flathub org.videolan.VLC -y
