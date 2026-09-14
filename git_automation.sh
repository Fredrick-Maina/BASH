#!/usr/bin/env bash

set -e

# Make sure we're in a Git repository
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Error: not inside a Git repository."
    exit 1
}

# Check for changes
if [[ -z "$(git status --porcelain)" ]]; then
    echo "No changes to commit."
    exit 0
fi

# Use supplied message or generate one
if [[ $# -gt 0 ]]; then
    commit_message="$*"
else
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    commit_message="Automated update: $timestamp"
fi

echo "Changes:"
git status --short

echo
echo "Commit message: $commit_message"

# Stage and commit
git add -A
git commit -m "$commit_message"

# Get current branch
branch=$(git branch --show-current)

# Push
git push origin "$branch"

echo "Successfully committed and pushed to '$branch'."
