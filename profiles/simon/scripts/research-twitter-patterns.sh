#!/bin/bash
# Twitter/X Pattern Research Script
# Run manually: bash research-twitter-patterns.sh
# Or schedule quarterly: crontab -e

TIMESTAMP=$(date +%Y-%m-%d)
OUTPUT_DIR="$HOME/social-posts-plugin/profiles/simon/research"
mkdir -p "$OUTPUT_DIR"

echo "🔍 Researching Twitter/X patterns for week of $TIMESTAMP..."

cat > /tmp/twitter_research_prompt.txt << 'EOF'
Analyze Twitter/X's current algorithm priorities and provide a detailed breakdown of:

### Algorithm Factors
- Primary ranking signals and their weight/importance
- Content format preferences (video length, image specs, character limits, threads)
- Engagement velocity requirements for viral potential
- Optimal posting times and frequency
- Blue checkmark impact on reach

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

Base recommendations on current 2026 platform data and provide specific, actionable steps I can implement immediately.

Note: Twitter became "X" in 2023 but many still call it Twitter. Include both naming conventions in research.
EOF

echo "---" > "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "# Twitter/X Pattern Research - $TIMESTAMP" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "## Research Query" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
cat /tmp/twitter_research_prompt.txt >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "## Findings" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "TODO: Run web search and add findings here" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "## Action Items" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "- [ ] Update platforms/twitter.md with new insights" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "- [ ] Test new patterns in next 3 tweets/threads" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
echo "- [ ] Measure performance vs baseline" >> "$OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"

echo "✅ Twitter/X research template created!"
echo "Output: $OUTPUT_DIR/twitter-patterns-$TIMESTAMP.md"
