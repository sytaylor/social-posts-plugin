# Simon's Research Scripts

Scripts for maintaining and improving the social-posts profile through ongoing research.

---

## 🤖 Automated Quarterly Research (RECOMMENDED)

**YES, you can fully automate the algorithm research!**

### Quick Setup (One-Time):

```bash
cd ~/social-posts-plugin/profiles/simon
bash scripts/setup-automation.sh
```

This will:
1. Check dependencies (jq, curl)
2. Setup your Anthropic API key
3. Make scripts executable
4. Optionally test the research
5. Add cron jobs to run quarterly

### What Gets Automated:

**Quarterly (Jan 1, Apr 1, Jul 1, Oct 1):**
- 9 AM: LinkedIn research runs automatically
- 10 AM: Twitter/X research runs automatically
- Results saved to `research/[platform]-patterns-YYYY-MM-DD.md`
- Notification sent (macOS) when complete
- **All claims are cited with sources** (inline markdown links)
- **Compares against previous quarter** to identify changes

**Cost:**
- Uses Claude API (Claude 3.5 Sonnet)
- ~$0.30-0.50 per research run
- ~$2-4 per year total (4 quarters × 2 platforms)

### Manual Test Run:

```bash
# Test LinkedIn research
bash scripts/auto-research-linkedin.sh

# Test Twitter research
bash scripts/auto-research-twitter.sh
```

### How It Works:

1. **Cron triggers quarterly** (first day of Jan/Apr/Jul/Oct)
2. **Script calls Claude API** with research prompt (with strict citation requirements)
3. **Claude researches** current algorithm patterns with sources
4. **Results saved** to markdown file with inline citations
5. **Script compares** against previous quarter's research
6. **You get notified** to review findings
7. **You archive** current guide version (optional)
8. **You update** platform guides based on research

### Requirements:

- Anthropic API key (get at https://console.anthropic.com/settings/keys)
- `jq` installed (`brew install jq`)
- Cron access (standard on macOS/Linux)

---

## Version Control & Research Workflow

### Research Output Structure

**Raw research files:** `research/[platform]-patterns-YYYY-MM-DD.md`
- Quarterly research with full citations
- Comparison against previous quarter
- Action items and source quality checklist

**Current algorithm guides:** `platforms/[platform]-algorithm.md`
- The "live" version you reference when writing posts
- Updated after reviewing quarterly research
- Should include "Last updated: YYYY-MM-DD" at top

**Archived versions:** `research/archive/[platform]-algorithm-YYYY-MM.md`
- Historical snapshots of algorithm guides
- Archive the current version before major updates
- Useful for tracking what changed over time

### Quarterly Research Workflow

**When new research arrives (automated):**

1. **Review raw research** in `research/[platform]-patterns-YYYY-MM-DD.md`
   - Check "Source Quality Checklist" - verify citations are present
   - Review "Changes Since Previous Research" section
   - Note any unverified claims

2. **Archive current guide** (before making changes)
   ```bash
   cp platforms/linkedin-algorithm.md research/archive/linkedin-algorithm-$(date +%Y-%m).md
   ```

3. **Update platform guide** with new insights
   - Add new tactics that are well-sourced
   - Update changed benchmarks (engagement rates, optimal times)
   - Mark deprecated advice with strikethrough or removal
   - Add "Last updated: YYYY-MM-DD" at top
   - Optional: Add changelog section showing what changed

4. **Test new tactics** in next 5-10 posts
   - Measure performance changes
   - Document what works for YOUR audience

5. **Keep research file** for next quarter's comparison

### Why This Approach Works

- ✅ **Version history** - Track how algorithms evolve over time
- ✅ **Source verification** - All claims must be cited
- ✅ **Change tracking** - Easy to see what's new vs confirmed patterns
- ✅ **Your data wins** - Test generic advice against your own performance
- ✅ **No hallucinations** - Unverified claims are clearly marked

---

## Algorithm Research Prompt Template

**See:** `algorithm-research-template.md` for the full quarterly research prompt.

**The Prompt (works for any platform):**
```
Analyze [PLATFORM]'s current algorithm priorities and provide a detailed breakdown of:

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
```

**Use this quarterly (Jan, Apr, Jul, Oct) for LinkedIn and Twitter/X.**

---

## Available Scripts

### `research-linkedin-patterns.sh`

**Purpose:** Research current LinkedIn algorithm patterns using the quarterly research prompt.

**Limitations:**
- Cannot scrape LinkedIn directly (violates ToS)
- Uses web search for published insights and analysis
- Manual review required

**Usage:**

**One-time run:**
```bash
cd ~/social-posts-plugin/profiles/simon
bash scripts/research-linkedin-patterns.sh
```

**Weekly cron job (every Monday at 9 AM):**
```bash
crontab -e
# Add this line:
0 9 * * 1 cd ~/social-posts-plugin/profiles/simon && bash scripts/research-linkedin-patterns.sh
```

**What it does:**
1. Searches for recent LinkedIn algorithm updates and insights
2. Looks for viral post analysis and engagement patterns
3. Creates a research file in `research/patterns-YYYY-MM-DD.md`
4. Provides action items for updating voice patterns

**Manual follow-up required:**
- Review research findings
- Update `simon-voice-patterns.md` with new insights
- Test new patterns in posts
- Measure performance

---

### `research-twitter-patterns.sh`

**Purpose:** Research current Twitter/X algorithm patterns using the quarterly research prompt.

**Limitations:**
- Cannot scrape Twitter directly (violates ToS)
- Uses web search for published insights and analysis
- Manual review required

**Usage:**

**One-time run:**
```bash
cd ~/social-posts-plugin/profiles/simon
bash scripts/research-twitter-patterns.sh
```

**What it does:**
1. Searches for recent Twitter/X algorithm updates
2. Looks for viral tweet analysis and engagement patterns
3. Creates research file in `research/twitter-patterns-YYYY-MM-DD.md`
4. Provides action items for updating platform guides

**Manual follow-up required:**
- Review research findings
- Update `platforms/twitter.md` with new insights
- Test new patterns in tweets/threads
- Measure performance

---

## Better Alternatives to Cron Jobs

### Option 1: Quarterly Manual Research (RECOMMENDED)
**Best for:** Staying current without automation overhead

**Process:**
1. Every quarter (Jan, Apr, Jul, Oct), dedicate 30 mins to research
2. Use the algorithm research prompt template (see top of this file)
3. Run: `bash scripts/research-linkedin-patterns.sh` and `bash scripts/research-twitter-patterns.sh`
4. Or manually search: "[Platform] algorithm updates [current quarter]"
5. Review platform's official creator updates
6. Update platform guides with findings
7. Test in next 5-10 posts

**Using the research prompt:**
- Copy prompt from `algorithm-research-template.md`
- Replace [PLATFORM] with LinkedIn or Twitter/X
- Use Claude Code web search OR manual Google research
- Save findings to `research/` directory

**Why this works:**
- LinkedIn algorithm doesn't change daily
- Manual review ensures quality insights
- Less risk of ToS violations
- You control when to adopt new patterns

### Option 2: Use LinkedIn's Official Resources
**Resources to bookmark:**
- LinkedIn Creator Mode insights (in your profile)
- LinkedIn News for creators: linkedin.com/business/marketing/blog
- LinkedIn Official Blog: blog.linkedin.com

**Process:**
- Check official updates monthly
- Add significant findings to research/ directory
- Update patterns when you see consistent trends

### Option 3: Post-Mortem Analysis
**Best for:** Learning from your own data

**Process:**
1. After each post, note engagement metrics
2. Every 10 posts, analyze:
   - Which hooks performed best?
   - What formats got most comments?
   - What times/days worked?
3. Update `simon-voice-patterns.md` with findings
4. Create `research/simon-post-performance.md` to track

**Template:**
```markdown
# Post Performance Log

## Post: [Title/Hook]
- Date: YYYY-MM-DD
- Platform: LinkedIn
- Hook: "..."
- Impressions: X
- Engagement rate: X%
- Comments: X
- What worked: ...
- What to repeat: ...
```

---

## Recommended Approach

**Combine all three:**

1. **Quarterly deep research** (Option 1)
   - Jan, Apr, Jul, Oct: 30-minute research session
   - Update patterns based on industry trends

2. **Monthly official check-in** (Option 2)
   - First Monday of each month
   - Skim LinkedIn official updates
   - 5-10 minutes

3. **Ongoing post analysis** (Option 3)
   - After each post, log performance
   - Every 10 posts, identify patterns
   - Continuous improvement from your own data

**Why this beats a cron job:**
- ✅ No ToS violations
- ✅ Quality > automation
- ✅ Learn from YOUR audience, not generic trends
- ✅ Sustainable long-term
- ✅ Actually actionable insights

---

## Current LinkedIn Patterns (January 2026)

Based on our existing research in `platforms/linkedin-algorithm.md`:

**What we know works:**
- Multi-image posts: 1.0x engagement (strongest format)
- First 210 chars: Critical for "see more" hook
- First 60-90 mins: Golden hour for engagement velocity
- Knowledge + discussion: Gets beyond-follower distribution
- 2-5 posts per week: Optimal cadence

**Areas to research next:**
- Video performance changes in Q1 2026
- Carousel vs document performance shifts
- New features (Collaborative Articles impact, etc.)
- Comment-to-like ratio trends

---

## Action Items

- [ ] Set up quarterly research calendar (next: April 2026)
- [ ] Bookmark LinkedIn official creator resources
- [ ] Create post performance tracking template
- [ ] After next 10 posts, analyze Simon's personal patterns
- [ ] Update voice-patterns.md with findings

---

**Remember:** Your own post performance data > generic LinkedIn trends. Track what works for YOUR audience.
