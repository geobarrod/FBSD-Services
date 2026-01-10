#!/bin/sh
# uninstall.sh - Uninstaller for FreeBSD Services
# Author: Geovanni B.R. (geobarrod)
# Date: 2026-01-05

set -e

# Verify root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "ERROR: This uninstaller must be run as root."
  exit 1
fi

# Paths
BIN_DIR="/usr/local/sbin"
SCRIPT_NAME="services"

echo "Uninstalling FreeBSD Services..."

# Remove main script
if [ -f "$BIN_DIR/$SCRIPT_NAME" ]; then
  echo "Removing $BIN_DIR/$SCRIPT_NAME..."
  rm -f "$BIN_DIR/$SCRIPT_NAME"
fi

echo "Uninstallation complete."
