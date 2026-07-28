#!/bin/bash
# Antigravity Skill Setup Script
# This script installs the self-pr-review skill into your Antigravity IDE plugins directory.

echo "Installing self-pr-review skill into Antigravity..."

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ANTIGRAVITY_PLUGINS_DIR="${HOME}/.gemini/config/plugins"
TARGET_PLUGIN_NAME="self-pr-review"
TARGET_PLUGIN_DIR="${ANTIGRAVITY_PLUGINS_DIR}/${TARGET_PLUGIN_NAME}"

# Ensure plugins directory exists
mkdir -p "${ANTIGRAVITY_PLUGINS_DIR}"

# Remove existing installation if any
if [ -d "${TARGET_PLUGIN_DIR}" ] || [ -L "${TARGET_PLUGIN_DIR}" ]; then
    echo "Removing existing installation at ${TARGET_PLUGIN_DIR}..."
    rm -rf "${TARGET_PLUGIN_DIR}"
fi

# Create a plugin directory and link the skill
mkdir -p "${TARGET_PLUGIN_DIR}/skills"

# Create a basic plugin.json
cat > "${TARGET_PLUGIN_DIR}/plugin.json" << EOF
{
  "name": "self-pr-review",
  "version": "1.0.0",
  "description": "Antigravity skill for reviewing local Git PR changes."
}
EOF

# Symlink the skill directory
ln -s "${SKILL_DIR}" "${TARGET_PLUGIN_DIR}/skills/self-pr-review"

echo "✅ Successfully installed self-pr-review into Antigravity!"
echo "Please restart Antigravity or open a new conversation to use the /self-pr-review command."
