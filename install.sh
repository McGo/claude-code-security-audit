#!/usr/bin/env bash
# install.sh – Installs the security-audit skill globally for Claude Code
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude/skills"
LINK_PATH="$TARGET_DIR/security-audit"

# Ensure ~/.claude/skills/ exists
if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
  echo "Created $TARGET_DIR"
fi

# Create or update symlink
if [ -L "$LINK_PATH" ]; then
  echo "Updating existing symlink..."
  rm "$LINK_PATH"
elif [ -e "$LINK_PATH" ]; then
  echo "Error: $LINK_PATH exists but is not a symlink. Remove it manually."
  exit 1
fi

ln -s "$SKILL_DIR" "$LINK_PATH"
echo "Symlink created: $LINK_PATH -> $SKILL_DIR"
echo ""
echo "Installation complete. The /security-audit skill is now available in Claude Code."
echo "Usage: /security-audit [scope]"
echo "  scope: full (default), docker, api, auth, dependencies, config, network"
