#!/bin/bash

# Sync Best Practices Submodule (Optional)
# Run this periodically to keep best practices up to date

set -e

echo "🔄 Syncing best practices from shared repository..."

# Check if submodule is initialized
if [ ! -d ".shared/.git" ]; then
  echo "⚠️  Submodule not initialized. This is optional - the plugin works without it."
  echo ""
  echo "To initialize the submodule, run:"
  echo "  git submodule update --init --recursive"
  echo ""
  exit 0
fi

# Navigate to submodule
cd .shared

# Pull latest changes
echo "📥 Pulling latest changes..."
git pull origin main

# Go back to project root
cd ..

# Stage the submodule update
echo "📝 Staging submodule update..."
git add .shared

# Check if there are changes
if git diff --cached --quiet; then
  echo "✅ Already up to date!"
else
  echo "💾 Committing submodule update..."
  git commit -m "sync: Update best practices to latest version"

  echo "📤 Pushing to remote..."
  git push origin main

  echo "✅ Best practices synced successfully!"
fi

echo ""
echo "Done! Best practices are now up to date."
