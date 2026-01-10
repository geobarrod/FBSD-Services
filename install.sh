#!/bin/sh
# install.sh - Installer for FreeBSD Services
# Author: Geovanni B.R. (geobarrod)
# Date: 2026-01-05

set -e

# Verify root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "ERROR: This installer must be run as root."
  exit 1
fi

# Paths
BIN_DIR="/usr/local/sbin"
SCRIPT_NAME="services"

echo "Installing FreeBSD Services..."

# Copy main script
echo "Copying $SCRIPT_NAME to $BIN_DIR..."
cp "$SCRIPT_NAME" "$BIN_DIR/"
chmod 755 "$BIN_DIR/$SCRIPT_NAME"

echo "Installation complete."
echo "You can now run: $BIN_DIR/$SCRIPT_NAME"
echo "Example: $BIN_DIR/$SCRIPT_NAME start nginx php_fpm postfix"
