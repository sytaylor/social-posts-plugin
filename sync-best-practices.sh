#!/bin/bash

# Sync Best Practices Submodule (Optional)
# Run this periodically to keep best practices up to date
#
# Two-way sync:
# 1. Pull latest from shared repo
# 2. Push any local changes to shared repo

set -e

SHARED_DIR=".shared"

echo "🔄 Syncing best practices with shared repository..."
echo ""

# Check if submodule is initialized
if [ ! -d "$SHARED_DIR/.git" ]; then
  echo "⚠️  Submodule not initialized. This is optional - the plugin works without it."
  echo ""
  echo "To initialize the submodule, run:"
  echo "  git submodule update --init --recursive"
  echo ""
  exit 0
fi

# Navigate to submodule
cd $SHARED_DIR

# Check if there are uncommitted local changes
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "📝 You have local changes in .shared/"
  echo ""
  git status --short
  echo ""
  read -p "Would you like to commit and push these changes to shared repo? (y/n) " -n 1 -r
  echo ""

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "💾 Committing local changes..."
    git add .

    # Prompt for commit message or use default
    read -p "Commit message (or Enter for default): " commit_msg
    if [ -z "$commit_msg" ]; then
      commit_msg="Update best practices - $(date +%Y-%m-%d)"
    fi

    git commit -m "$commit_msg"

    echo "📤 Pushing to shared repository..."
    git push origin main
    echo "✅ Local changes pushed successfully!"
  else
    echo "⚠️  Skipping push. Note: Your local changes won't be synced."
  fi
fi

# Pull latest changes from shared repo
echo ""
echo "📥 Pulling latest changes from shared repository..."
git pull origin main

# Go back to project root
cd ..

# Stage the submodule update
echo "📝 Updating submodule reference in parent project..."
git add $SHARED_DIR

# Check if there are changes to the submodule reference
if git diff --cached --quiet; then
  echo "✅ Already up to date!"
else
  echo "💾 Committing submodule update in parent project..."
  git commit -m "sync: Update best practices submodule to latest"

  echo ""
  read -p "Push to parent project repository? (y/n) " -n 1 -r
  echo ""

  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📤 Pushing to parent repository..."
    git push
    echo "✅ Parent project updated!"
  else
    echo "⚠️  Submodule updated locally. Remember to push later with: git push"
  fi
fi

echo ""
echo "✅ Best practices sync complete!"
echo ""
echo "What was synced:"
echo "  • Universal hook patterns"
echo "  • Visual sourcing strategies"
echo "  • Story evaluation framework"
echo "  • Engagement best practices"
echo ""
echo "These are now shared across all your profile dashboards."
echo ""
