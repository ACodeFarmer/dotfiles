#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

source $DOTFILES_ROOT/scripts/utils.sh

get_os

if [ "$OS" == "macOS" ]; then
  . "$DOTFILES_ROOT/system/macos/macos.sh"
  . "$DOTFILES_ROOT/system/macos/homebrew.sh"
fi
