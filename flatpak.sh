#!/usr/bin/env bash

flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

flatpak --user update --appstream
flatpak --user -y upgrade

# flatpak install flathub io.gitlab.librewolf-community -y
# flatpak install flathub org.videolan.VLC -y
flatpak --user -y install flathub \
	org.qbittorrent.qBittorrent \
	im.riot.Riot \
	io.mpv.Mpv \
	com.github.tchx84.Flatseal
