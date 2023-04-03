#!/bin/sh

set -eu -o pipefail   #fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

echo installing GPU drivers
while read -r p ; do sudo pacman -S --needed $p ; done < <(cat << "EOF"
    amdvlk
    vulkan-radeon
EOF
)

echo installing nice to haves
while read -r p ; do sudo pacman -S --needed $p ; done < <(cat << "EOF"
    qbittorrent
    steam
    wine
    winetricks
    giflib
    lib32-giflib
    libpng
    lib32-libpng
    libldap
    lib32-libldap
    gnutls
    lib32-gnutls
    mpg123
    lib32-mpg123
    openal
    lib32-openal
    v4l-utils
    lib32-v4l-utils
    libpulse
    lib32-libpulse
    libgpg-error
    lib32-libgpg-error
    alsa-plugins
    lib32-alsa-plugins
    alsa-lib
    lib32-alsa-lib
    libjpeg-turbo
    lib32-libjpeg-turbo
    sqlite
    lib32-sqlite
    libxcomposite
    lib32-libxcomposite
    libxinerama
    lib32-libgcrypt
    libgcrypt lib32-libxinerama
    ncurses
    lib32-ncurses
    ocl-icd
    lib32-ocl-icd
    libxslt
    lib32-libxslt
    libva
    lib32-libva gtk3
    lib32-gtk3
    gst-plugins-base-libs
    lib32-gst-plugins-base-libs
    vulkan-icd-loader
    lib32-vulkan-icd-loader
    lutris
EOF
)

sudo -k
echo installing AUR packages
yay vulkan-amdgpu-pro
yay icaclient
yay discord
yay visual-studio-code-bin
yay cura-bin