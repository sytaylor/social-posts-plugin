#!/bin/bash
# Automated LinkedIn Algorithm Research
# Uses Claude API to run research prompt quarterly
# Setup: Add to crontab to run quarterly (Jan 1, Apr 1, Jul 1, Oct 1)
# 0 9 1 1,4,7,10 * cd ~/social-posts-plugin/profiles/simon && bash scripts/auto-research-linkedin.sh

set -e

TIMESTAMP=$(date +%Y-%m-%d)
OUTPUT_DIR="$HOME/social-posts-plugin/profiles/simon/research"
mkdir -p "$OUTPUT_DIR"
OUTPUT_FILE="$OUTPUT_DIR/linkedin-patterns-$TIMESTAMP.md"

echo "🤖 Running automated LinkedIn algorithm research for $TIMESTAMP..."

# Check for Claude API key
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "❌ Error: ANTHROPIC_API_KEY not set"
    echo "Set it in ~/.zshrc or ~/.bash_profile:"
    echo "export ANTHROPIC_API_KEY='your-api-key-here'"
    exit 1
fi

# The research prompt
RESEARCH_PROMPT="Analyze LinkedIn's current algorithm priorities and provide a detailed breakdown of:

### Algorithm Factors
- Primary ranking signals and their weight/importance
- Content format preferences (video length, image specs, text limits)
- Engagement velocity requirements for viral potential
- Optimal posting times and frequency

### Optimization Strategy
- 5 specific tactics to maximize algorithmic reach
- Content structure recommendations
- Hashtag/keyword strategies
- Cross-platform amplification methods

### Success Metrics
- KPIs to track for algorithm optimization
- Benchmarks for viral threshold on this platform
- Timeline expectations for results

Base recommendations on current $(date +%Y) platform data and provide specific, actionable steps I can implement immediately.

**CRITICAL REQUIREMENT: You MUST cite sources for EVERY claim:**
- Link to official LinkedIn blog posts, creator updates, or platform announcements
- Reference specific studies (with URLs) from trusted sources like Buffer, Hootsuite, Sprout Social
- Include publication dates for all sources
- If a claim cannot be sourced, clearly mark it as \"Unverified\" or \"Anecdotal\"
- Prefer primary sources (LinkedIn official) over secondary sources (marketing blogs)

Format citations as markdown links inline, e.g.: \"Multi-image posts get 1.5x engagement ([Source: LinkedIn Marketing Blog, Dec 2025](https://example.com))\"."

echo "📡 Calling Claude API..."

# Call Claude API with web search capability (use jq to properly encode JSON)
RESPONSE=$(curl -s https://api.anthropic.com/v1/messages \
  -H "content-type: application/json" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -d "$(jq -n \
    --arg prompt "$RESEARCH_PROMPT" \
    '{
      "model": "claude-3-haiku-20240307",
      "max_tokens": 4096,
      "messages": [{
        "role": "user",
        "content": $prompt
      }]
    }')")

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
PREVIOUS_RESEARCH=$(ls -t "$OUTPUT_DIR"/linkedin-patterns-*.md 2>/dev/null | head -1)
COMPARISON_SECTION=""

if [ -n "$PREVIOUS_RESEARCH" ]; then
    PREV_DATE=$(basename "$PREVIOUS_RESEARCH" | sed 's/linkedin-patterns-//;s/.md//')
    COMPARISON_SECTION="---

## Changes Since Previous Research ($PREV_DATE)

**Previous research file:** \`$(basename "$PREVIOUS_RESEARCH")\`

Compare this research with the previous version to identify:
- ✅ **New tactics or features** that weren't mentioned before
- 📈 **Changed benchmarks** (engagement rates, optimal times, etc.)
- ⚠️ **Deprecated advice** (tactics that no longer work)
- 🔄 **Confirmed patterns** (tactics still valid)

Use this comparison to update \`platforms/linkedin-algorithm.md\` with version notes."
fi

# Create formatted research file
cat > "$OUTPUT_FILE" << EOF
# LinkedIn Algorithm Research - $TIMESTAMP

**Research Date:** $TIMESTAMP
**Method:** Automated via Claude API
**Model:** Claude 3 Haiku

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
- [ ] Archive current \`platforms/linkedin-algorithm.md\` to \`research/archive/linkedin-algorithm-$(date +%Y-%m).md\`
- [ ] Update \`platforms/linkedin-algorithm.md\` with new insights
- [ ] Add "Last updated: $TIMESTAMP" to the guide
- [ ] Document what changed in a changelog section
- [ ] Test new tactics in next 5-10 posts
- [ ] Measure performance changes

---

## Source Quality Checklist

Review the findings above and verify:
- [ ] All major claims have inline citations with URLs
- [ ] Sources are dated (preferably within last 3-6 months)
- [ ] Primary sources (LinkedIn official) are prioritized
- [ ] Unverified claims are clearly marked as such
- [ ] Studies include sample sizes and methodologies where available

---

## Follow-Up Research Needed

- [ ] Verify any unverified claims with official LinkedIn sources
- [ ] Cross-reference with recent LinkedIn blog posts
- [ ] Check for creator insights at linkedin.com/creators
- [ ] Compare with your own post performance data
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
echo "3. Test new tactics in your next posts"

# Optional: Send notification (macOS)
if command -v osascript &> /dev/null; then
    osascript -e "display notification \"LinkedIn research completed! Check $OUTPUT_FILE\" with title \"Algorithm Research\""
fi

# Optional: Send email notification (if mail is configured)
# echo "LinkedIn algorithm research completed. Results: $OUTPUT_FILE" | mail -s "Quarterly Research: LinkedIn" your@email.com
