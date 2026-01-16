#!/bin/bash
# Setup script for automated quarterly algorithm research
# Run once: bash scripts/setup-automation.sh

set -e

echo "🚀 Setting up automated algorithm research..."
echo ""

# Check for required tools
echo "Checking dependencies..."

if ! command -v jq &> /dev/null; then
    echo "❌ jq is required but not installed."
    echo "Install it with: brew install jq"
    exit 1
fi

if ! command -v curl &> /dev/null; then
    echo "❌ curl is required but not installed."
    exit 1
fi

echo "✅ Dependencies installed"
echo ""

# Check for API key
echo "Checking for ANTHROPIC_API_KEY..."

if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "⚠️  ANTHROPIC_API_KEY not set"
    echo ""
    echo "You need a Claude API key to run automated research."
    echo "Get one at: https://console.anthropic.com/settings/keys"
    echo ""
    read -p "Enter your Anthropic API key (or press Enter to skip): " API_KEY

    if [ -n "$API_KEY" ]; then
        # Determine which shell config to use
        if [ -f "$HOME/.zshrc" ]; then
            SHELL_CONFIG="$HOME/.zshrc"
        elif [ -f "$HOME/.bash_profile" ]; then
            SHELL_CONFIG="$HOME/.bash_profile"
        else
            SHELL_CONFIG="$HOME/.bashrc"
        fi

        echo "" >> "$SHELL_CONFIG"
        echo "# Anthropic API Key for automated research" >> "$SHELL_CONFIG"
        echo "export ANTHROPIC_API_KEY='$API_KEY'" >> "$SHELL_CONFIG"

        echo "✅ API key added to $SHELL_CONFIG"
        echo "   Run: source $SHELL_CONFIG"
        export ANTHROPIC_API_KEY="$API_KEY"
    else
        echo "⚠️  Skipping API key setup. Set it manually later:"
        echo "   export ANTHROPIC_API_KEY='your-key-here'"
        echo "   Add to ~/.zshrc or ~/.bash_profile to make permanent"
    fi
else
    echo "✅ ANTHROPIC_API_KEY is set"
fi

echo ""

# Make scripts executable
echo "Making scripts executable..."
chmod +x "$HOME/social-posts-plugin/profiles/simon/scripts/auto-research-linkedin.sh"
chmod +x "$HOME/social-posts-plugin/profiles/simon/scripts/auto-research-twitter.sh"
echo "✅ Scripts are executable"
echo ""

# Test run option
echo "Would you like to test the LinkedIn research script now? (It will use API credits)"
read -p "Test now? (y/N): " TEST_NOW

if [[ "$TEST_NOW" =~ ^[Yy]$ ]]; then
    echo ""
    echo "🧪 Running test..."
    bash "$HOME/social-posts-plugin/profiles/simon/scripts/auto-research-linkedin.sh"
    echo ""
    echo "✅ Test complete! Check the output above."
    echo ""
fi

# Setup cron jobs
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "CRON JOB SETUP"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "To run research automatically every quarter, add these to your crontab:"
echo ""
echo "1. Run: crontab -e"
echo ""
echo "2. Add these lines:"
echo ""
echo "# LinkedIn algorithm research (quarterly: Jan 1, Apr 1, Jul 1, Oct 1 at 9 AM)"
echo "0 9 1 1,4,7,10 * cd ~/social-posts-plugin/profiles/simon && bash scripts/auto-research-linkedin.sh"
echo ""
echo "# Twitter/X algorithm research (quarterly: Jan 1, Apr 1, Jul 1, Oct 1 at 10 AM)"
echo "0 10 1 1,4,7,10 * cd ~/social-posts-plugin/profiles/simon && bash scripts/auto-research-twitter.sh"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Would you like to automatically add these to crontab? (y/N): " ADD_CRON

if [[ "$ADD_CRON" =~ ^[Yy]$ ]]; then
    # Create temp file with new cron jobs
    TEMP_CRON=$(mktemp)

    # Get existing crontab
    crontab -l > "$TEMP_CRON" 2>/dev/null || true

    # Add new jobs if they don't exist
    if ! grep -q "auto-research-linkedin.sh" "$TEMP_CRON"; then
        echo "" >> "$TEMP_CRON"
        echo "# LinkedIn algorithm research (quarterly: Jan 1, Apr 1, Jul 1, Oct 1 at 9 AM)" >> "$TEMP_CRON"
        echo "0 9 1 1,4,7,10 * cd ~/social-posts-plugin/profiles/simon && bash scripts/auto-research-linkedin.sh" >> "$TEMP_CRON"
    fi

    if ! grep -q "auto-research-twitter.sh" "$TEMP_CRON"; then
        echo "" >> "$TEMP_CRON"
        echo "# Twitter/X algorithm research (quarterly: Jan 1, Apr 1, Jul 1, Oct 1 at 10 AM)" >> "$TEMP_CRON"
        echo "0 10 1 1,4,7,10 * cd ~/social-posts-plugin/profiles/simon && bash scripts/auto-research-twitter.sh" >> "$TEMP_CRON"
    fi

    # Install new crontab
    crontab "$TEMP_CRON"
    rm "$TEMP_CRON"

    echo "✅ Cron jobs added!"
    echo ""
    echo "Your crontab now looks like this:"
    crontab -l | tail -6
else
    echo "⚠️  Skipping cron setup. Add manually later with: crontab -e"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ SETUP COMPLETE!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Your automated research will run:"
echo "  📅 Quarterly: Jan 1, Apr 1, Jul 1, Oct 1"
echo "  🕒 LinkedIn: 9 AM"
echo "  🕙 Twitter: 10 AM"
echo ""
echo "Research results will be saved to:"
echo "  ~/social-posts-plugin/profiles/simon/research/"
echo ""
echo "Manual test run:"
echo "  bash scripts/auto-research-linkedin.sh"
echo "  bash scripts/auto-research-twitter.sh"
echo ""
echo "View scheduled cron jobs:"
echo "  crontab -l"
echo ""
echo "Check research results:"
echo "  ls -la ~/social-posts-plugin/profiles/simon/research/"
echo ""
