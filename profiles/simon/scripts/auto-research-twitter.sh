#!/bin/bash
# Automated Twitter/X Algorithm Research
# Uses Claude API to run research prompt quarterly
# Setup: Add to crontab to run quarterly (Jan 1, Apr 1, Jul 1, Oct 1)
# 0 10 1 1,4,7,10 * cd ~/social-posts-plugin/profiles/simon && bash scripts/auto-research-twitter.sh

set -e

TIMESTAMP=$(date +%Y-%m-%d)
OUTPUT_DIR="$HOME/social-posts-plugin/profiles/simon/research"
mkdir -p "$OUTPUT_DIR"
OUTPUT_FILE="$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"

echo "🤖 Running automated Twitter/X algorithm research for $TIMESTAMP..."

# Check for Claude API key
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "❌ Error: ANTHROPIC_API_KEY not set"
    echo "Set it in ~/.zshrc or ~/.bash_profile:"
    echo "export ANTHROPIC_API_KEY='your-api-key-here'"
    exit 1
fi

# The research prompt
RESEARCH_PROMPT="Analyze Twitter/X's current algorithm priorities and provide a detailed breakdown of:

### Algorithm Factors
- Primary ranking signals and their weight/importance
- Content format preferences (video length, image specs, character limits, threads)
- Engagement velocity requirements for viral potential
- Optimal posting times and frequency
- Blue checkmark (X Premium) impact on reach

### Optimization Strategy
- 5 specific tactics to maximize algorithmic reach
- Thread structure recommendations
- Hashtag/keyword strategies
- Quote tweet vs reply vs retweet strategies
- Cross-platform amplification methods

### Success Metrics
- KPIs to track for algorithm optimization
- Benchmarks for viral threshold on this platform
- Timeline expectations for results
- Follower growth expectations

Base recommendations on current $(date +%Y) platform data and provide specific, actionable steps I can implement immediately.

Note: Twitter was rebranded as X in 2023 but many users still call it Twitter. Include both naming conventions in your research.

**CRITICAL REQUIREMENT: You MUST cite sources for EVERY claim:**
- Link to official X/Twitter blog posts, creator updates, or platform announcements
- Reference specific studies (with URLs) from trusted sources
- Include publication dates for all sources
- If a claim cannot be sourced, clearly mark it as \"Unverified\" or \"Anecdotal\"
- Prefer primary sources (X/Twitter official) over secondary sources (marketing blogs)

Format citations as markdown links inline, e.g.: \"Threads get 2x engagement over single tweets ([Source: Twitter Dev Blog, Nov 2025](https://example.com))\"."

echo "📡 Calling Claude API..."

# Call Claude API
RESPONSE=$(curl -s https://api.anthropic.com/v1/messages \
  -H "content-type: application/json" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -d '{
    "model": "claude-3-5-sonnet-20241022",
    "max_tokens": 4096,
    "messages": [{
      "role": "user",
      "content": "'"${RESEARCH_PROMPT}"'"
    }]
  }')

# Check for API errors
if echo "$RESPONSE" | grep -q '"error"'; then
    echo "❌ API Error:"
    echo "$RESPONSE" | jq -r '.error.message' 2>/dev/null || echo "$RESPONSE"
    exit 1
fi

# Extract the response content
RESEARCH_CONTENT=$(echo "$RESPONSE" | jq -r '.content[0].text' 2>/dev/null)

if [ -z "$RESEARCH_CONTENT" ] || [ "$RESEARCH_CONTENT" = "null" ]; then
    echo "❌ Failed to extract response from API"
    echo "Raw response:"
    echo "$RESPONSE"
    exit 1
fi

# Find previous research for comparison
PREVIOUS_RESEARCH=$(ls -t "$OUTPUT_DIR"/twitter-patterns-*.md 2>/dev/null | head -1)
COMPARISON_SECTION=""

if [ -n "$PREVIOUS_RESEARCH" ]; then
    PREV_DATE=$(basename "$PREVIOUS_RESEARCH" | sed 's/twitter-patterns-//;s/.md//')
    COMPARISON_SECTION="---

## Changes Since Previous Research ($PREV_DATE)

**Previous research file:** \`$(basename "$PREVIOUS_RESEARCH")\`

Compare this research with the previous version to identify:
- ✅ **New tactics or features** that weren't mentioned before
- 📈 **Changed benchmarks** (engagement rates, optimal times, etc.)
- ⚠️ **Deprecated advice** (tactics that no longer work)
- 🔄 **Confirmed patterns** (tactics still valid)

Use this comparison to update \`platforms/twitter.md\` with version notes."
fi

# Create formatted research file
cat > "$OUTPUT_FILE" << EOF
# Twitter/X Algorithm Research - $TIMESTAMP

**Research Date:** $TIMESTAMP
**Method:** Automated via Claude API
**Model:** Claude 3.5 Sonnet

---

## Research Prompt

$RESEARCH_PROMPT

---

## Findings

$RESEARCH_CONTENT

$COMPARISON_SECTION

---

## Action Items

- [ ] Review findings above and verify all sources are cited
- [ ] Compare with previous research (if exists) to identify changes
- [ ] Archive current \`platforms/twitter.md\` to \`research/archive/twitter-algorithm-$(date +%Y-%m).md\`
- [ ] Update \`platforms/twitter.md\` with new insights
- [ ] Add "Last updated: $TIMESTAMP" to the guide
- [ ] Document what changed in a changelog section
- [ ] Test new tactics in next 5-10 tweets/threads
- [ ] Measure performance changes

---

## Source Quality Checklist

Review the findings above and verify:
- [ ] All major claims have inline citations with URLs
- [ ] Sources are dated (preferably within last 3-6 months)
- [ ] Primary sources (X/Twitter official) are prioritized
- [ ] Unverified claims are clearly marked as such
- [ ] Studies include sample sizes and methodologies where available

---

## Follow-Up Research Needed

- [ ] Verify any unverified claims with official X/Twitter sources
- [ ] Check X Premium creator insights
- [ ] Compare with your own tweet performance data
- [ ] Test thread vs single tweet performance
- [ ] Test conflicting claims to determine what works for YOUR audience

---

**Next Research Date:** $(date -v+3m +%Y-%m-%d 2>/dev/null || date -d "+3 months" +%Y-%m-%d)
EOF

echo "✅ Research completed!"
echo "📄 Results saved to: $OUTPUT_FILE"
echo ""
echo "Next steps:"
echo "1. Review the findings: cat $OUTPUT_FILE"
echo "2. Update your platform guides"
echo "3. Test new tactics in your next tweets"

# Optional: Send notification (macOS)
if command -v osascript &> /dev/null; then
    osascript -e "display notification \"Twitter/X research completed! Check $OUTPUT_FILE\" with title \"Algorithm Research\""
fi
