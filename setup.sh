#!/bin/bash

# simple logging stuff

log() {
  echo -e "\e[34m[INFO]\e[0m $1"
}

success() {
  echo -e "\e[32m[SUCCESS]\e[0m $1"
}

error() {
  echo -e "\e[31m[ERROR]\e[0m $1"
}

# beeeeeeh

WORKDIR="$HOME/termux_setup_sideloader"
PKGS=(libimobiledevice-glue libplist libusb termux-api jq tar wget)
workdir() {
  mkdir -p "$WORKDIR"
  cd "$WORKDIR" || exit 1 
}

install_packages() {
  apt update -y
  for i in "${!PKGS[@]}"; do
    if apt install "${PKGS[$i]}"; then
      success "Installed package: ${PKGS[$i]}"
    fi
  done
}

check_packages() {
  for pkg in "${PKGS[@]}"; do
    if dpkg -s "$pkg" >/dev/null 2>&1; then
      success "Installled package: $pkg"
    else
      error "Failed to install package: $pkg"
    fi
  done
}

libs_reference() {
  ln -sf $PREFIX/lib/libplist-2.0.so $PREFIX/lib/libplist-2.0.so.4
  ln -sf $PREFIX/lib/libimobiledevice-1.0.so $PREFIX/lib/libimobiledevice-1.0.so.6
}

get_debs() {
  wget https://github.com/AmarKherala/debs/releases/download/release/usbmuxd_sideloader_debs_aarch64.zip
  unzip usbmuxd_sideloader_debs_aarch64.zip
}

extract() {
  cd "$WORKDIR" || exit 1
  for file in *.tar*; do
    if [ -f "$file" ] && tar -xf "$file"; then
      success "Unpacked [$file] successfully!"
    fi
  done
}

install() {
  cd "$WORKDIR/debs" || exit 1
  for file in *.deb; do
    if dpkg -i "$file"; then
      success "Installed [[$file]] successfully!!"
    fi
  done
}

workdir

log "Installing packages..."
install_packages
libs_reference

log "Checking packages..."
check_packages

log "Getting debs..."
get_debs

log "Installing usbmuxd and sideloader..."
extract
install

log "Done!"
