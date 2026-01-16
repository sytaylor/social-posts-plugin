#!/bin/bash
# LinkedIn Pattern Research Script
# Run manually: bash research-linkedin-patterns.sh
# Or schedule weekly: crontab -e, then add:
# 0 9 * * 1 cd ~/social-posts-plugin/profiles/simon && bash scripts/research-linkedin-patterns.sh

TIMESTAMP=$(date +%Y-%m-%d)
OUTPUT_DIR="$HOME/social-posts-plugin/profiles/simon/research"
mkdir -p "$OUTPUT_DIR"

echo "🔍 Researching LinkedIn patterns for week of $TIMESTAMP..."

# Use Claude Code to research current patterns via web search
# This searches for recent analysis, not direct LinkedIn scraping

cat > /tmp/linkedin_research_prompt.txt << 'EOF'
Analyze LinkedIn's current algorithm priorities and provide a detailed breakdown of:

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

Base recommendations on current 2026 platform data and provide specific, actionable steps I can implement immediately.
EOF

echo "Running web search for LinkedIn insights..."
echo "Results will be saved to: $OUTPUT_DIR/patterns-$TIMESTAMP.md"

# Note: This would need to integrate with Claude Code's web search
# For now, it's a template that shows the structure

echo "---" > "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "# LinkedIn Pattern Research - $TIMESTAMP" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "## Research Query" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
cat /tmp/linkedin_research_prompt.txt >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "## Findings" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "TODO: Run web search and add findings here" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "## Action Items" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "- [ ] Update simon-voice-patterns.md with new insights" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "- [ ] Test new patterns in next 3 posts" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "- [ ] Measure performance vs baseline" >> "$OUTPUT_DIR/patterns-$TIMESTAMP.md"

echo "✅ Research template created!"
echo "Next steps:"
echo "1. Run web searches for LinkedIn 2026 patterns"
echo "2. Review findings in $OUTPUT_DIR/patterns-$TIMESTAMP.md"
echo "3. Update voice patterns based on research"
