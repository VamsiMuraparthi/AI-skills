#!/bin/bash
# Keka Copilot Skill Setup Script
# This script installs the self-pr-review skill into your Keka Copilot plugin directory.

echo "Installing self-pr-review skill into Keka Copilot..."

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COPILOT_PLUGINS_DIR="${HOME}/.gemini/config/plugins/keka-copilot/skills"
TARGET_LINK="${COPILOT_PLUGINS_DIR}/self-pr-review"

# Ensure the Keka Copilot skills directory exists
if [ ! -d "${COPILOT_PLUGINS_DIR}" ]; then
    echo "Creating Keka Copilot skills directory at ${COPILOT_PLUGINS_DIR}..."
    mkdir -p "${COPILOT_PLUGINS_DIR}"
fi

# Remove existing link if it exists
if [ -L "${TARGET_LINK}" ] || [ -d "${TARGET_LINK}" ]; then
    echo "Removing existing link at ${TARGET_LINK}..."
    rm -rf "${TARGET_LINK}"
fi

# Create the symlink
ln -s "${SKILL_DIR}" "${TARGET_LINK}"

echo "✅ Successfully linked self-pr-review into Keka Copilot!"
echo "The /self-pr-review skill is now available in your Copilot environment."
