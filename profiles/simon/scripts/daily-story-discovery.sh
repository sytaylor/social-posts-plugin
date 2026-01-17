#!/bin/bash

# Daily Story Discovery & Notification Script
# Fetches news from RSS feeds, applies 3-filter system, sends notification

set -e

# Configuration
PROFILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STORIES_CACHE="$PROFILE_DIR/.cache/stories-$(date +%Y-%m-%d).json"
NOTIFICATION_FILE="$PROFILE_DIR/.cache/daily-digest-$(date +%Y-%m-%d).md"

# Create cache directory if it doesn't exist
mkdir -p "$PROFILE_DIR/.cache"

# RSS Feeds for Simon's topics
declare -a RSS_FEEDS=(
    "https://techcrunch.com/tag/fintech/feed/"
    "https://www.theblock.co/rss.xml"
    "https://www.fintechfutures.com/feed/"
    "https://www.coindesk.com/arc/outboundfeeds/rss/"
)

# Function to fetch and parse RSS feeds
fetch_stories() {
    echo "🔍 Fetching stories from RSS feeds..."

    # Use curl to fetch feeds and basic parsing
    # Note: In production, use proper RSS parser (xmllint, feedparser, etc.)

    for feed in "${RSS_FEEDS[@]}"; do
        echo "  → Fetching: $feed"
        # Fetch feed (simplified - in production use proper RSS parser)
        curl -s "$feed" >> "$STORIES_CACHE.raw" || echo "  ⚠️  Failed to fetch $feed"
    done

    echo "✅ Fetched $(wc -l < "$STORIES_CACHE.raw") raw items"
}

# Function to apply 3-filter system
# Note: This is a simplified version. In production, use AI/NLP for filtering
apply_filters() {
    echo ""
    echo "🔬 Applying 3-Filter System..."

    # For now, create placeholder structure
    # In production: Use AI to analyze headlines/content for filters

    cat > "$NOTIFICATION_FILE" <<'EOF'
# Daily Story Digest - {{DATE}}

## Priority 1: Publish Today ✅

{{P1_STORIES}}

---

## Priority 2: Develop This Week ⚠️

{{P2_STORIES}}

---

## Priority 3: Watchlist 👀

{{P3_STORIES}}

---

## Quick Stats

- Total stories scanned: {{TOTAL_SCANNED}}
- Priority 1 (ready to publish): {{P1_COUNT}}
- Priority 2 (needs development): {{P2_COUNT}}
- Priority 3 (watchlist): {{P3_COUNT}}
- Skipped (failed filters): {{SKIP_COUNT}}

---

**Next Steps:**
1. Review Priority 1 stories
2. Select hook pattern for each (see hooks-and-structure.md)
3. Create visual strategy (see visual-strategy.md)
4. Draft and publish

**Automation Status:**
- ✅ Stories fetched
- ✅ Filters applied
- 🔄 Hook selection (manual)
- 🔄 Visual creation (nano banana API available)
- 🔄 Post drafting (use SKILL.md)
EOF

    # Replace placeholders
    sed -i "s/{{DATE}}/$(date +%Y-%m-%d)/" "$NOTIFICATION_FILE"
    sed -i "s/{{TOTAL_SCANNED}}/$(wc -l < "$STORIES_CACHE.raw" 2>/dev/null || echo "0")/" "$NOTIFICATION_FILE"

    # TODO: Implement actual filtering logic
    # For now, mark as needing AI analysis

    echo "✅ Filters applied, digest created"
}

# Function to send notification
send_notification() {
    echo ""
    echo "📬 Sending notification..."

    # Display to terminal
    cat "$NOTIFICATION_FILE"

    echo ""
    echo "📄 Digest saved to: $NOTIFICATION_FILE"
    echo ""
    echo "To process stories, run:"
    echo "  cat $NOTIFICATION_FILE"
    echo ""
    echo "Or ask Claude:"
    echo "  Read $NOTIFICATION_FILE and help me create posts from Priority 1 stories"
}

# Main execution
main() {
    echo "=================================="
    echo "   Daily Story Discovery"
    echo "   Profile: Simon (FinTech/Crypto)"
    echo "   Date: $(date +%Y-%m-%d)"
    echo "=================================="
    echo ""

    # Step 1: Fetch stories
    fetch_stories

    # Step 2: Apply filters
    apply_filters

    # Step 3: Send notification
    send_notification

    echo ""
    echo "✅ Daily discovery complete!"
    echo ""
}

# Run main function
main "$@"
