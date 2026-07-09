#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGS_DIR="$DOTFILES_DIR/configs"

cd "$CONFIGS_DIR"

for package in */; do
  package="${package%/}"

  echo "Stowing $package..."
  stow \
    --dir="$CONFIGS_DIR" \
    --target="$HOME" \
    --restow \
    "$package"
done

echo "Done."

