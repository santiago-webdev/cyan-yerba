#!/usr/bin/env bash

flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

flatpak --user update --appstream
flatpak --user -y upgrade

flatpak --user -y install flathub \
  com.google.Chrome \
  com.obsproject.Studio \
  im.riot.Riot \
  io.mpv.Mpv \
  org.blender.Blender \
  org.inkscape.Inkscape \
  org.kde.gwenview \
  org.kde.okular \
  org.kde.okular \
  org.qbittorrent.qBittorrent \
  org.qbittorrent.qBittorrent \
