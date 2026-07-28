#!/bin/bash
# Setup script for self-pr-review skill

echo "Setting up self-pr-review skill..."

# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "Error: git could not be found. Please install git to use this skill."
    exit 1
fi

echo "Checking if you are inside a git repository..."
if ! git rev-parse --is-inside-work-tree &> /dev/null
then
    echo "Warning: Current directory is not a git repository."
    echo "Make sure to run this skill inside a git repository for the diff to work."
else
    echo "Git repository detected."
fi

echo "Setup complete!"
