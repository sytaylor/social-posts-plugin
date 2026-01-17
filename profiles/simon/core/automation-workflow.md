# Automation Workflow & Setup Guide

**Purpose:** Document what's automated vs manual, setup instructions, and daily workflow.

**Goal:** Reduce post creation time from 30 minutes → 10 minutes (with automation).

---

## What's Automated vs Manual

### ✅ AUTOMATED (No human input needed)

| Task | Automation | Time Saved |
|------|------------|------------|
| **Story Discovery** | Daily RSS feed scan | 10 min/day |
| **Story Filtering** | 3-Filter System (AI-assisted) | 5-10 min/day |
| **Visual Prompt Generation** | Hook type → Image prompt | 2-3 min/post |
| **Image Generation** | Nano Banana API | 5-10 min/post |
| **Daily Digest** | Morning notification with Priority 1 stories | 5 min/day |

**Total Time Saved:** 25-35 minutes per day

---

### 🔄 SEMI-AUTOMATED (Human review/approval needed)

| Task | Automation Level | Human Role |
|------|------------------|------------|
| **Hook Selection** | AI suggests pattern | Approve or adjust |
| **Visual Format** | Auto-determined from hook | Review and approve |
| **Story Prioritization** | AI applies filters | Final priority call |
| **Post Draft** | AI writes initial draft | Edit for voice |

**Process:** AI does heavy lifting → Human reviews/approves → Publish

---

### ⚠️ MANUAL (Creative decisions)

| Task | Why Manual | Time Required |
|------|------------|---------------|
| **Voice Authenticity Check** | Only you know if it "sounds like you" | 1-2 min |
| **Final Hook Editing** | Fine-tuning for maximum impact | 2-3 min |
| **Engagement/Comments** | Relationship building | 15-30 min |
| **Pattern Recognition** | Human insight for trends | Ongoing |

**Process:** These require your judgment and can't be fully automated

---

## Automation Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    DAILY AUTOMATION                         │
└─────────────────────────────────────────────────────────────┘

7:00 AM - Daily Story Discovery Script Runs
   ↓
   ├─ Fetch RSS Feeds (TechCrunch, The Block, etc.)
   ├─ AI Analysis: Apply 3-Filter System
   ├─ Prioritize: P1 (publish), P2 (develop), P3 (watch), P4 (skip)
   ├─ Generate Daily Digest
   └─ Send Notification

YOU REVIEW (10 min):
   ↓
   ├─ Read Priority 1 stories
   ├─ Select 1-2 to post about
   └─ Proceed to post creation

┌─────────────────────────────────────────────────────────────┐
│                  PER-POST AUTOMATION                        │
└─────────────────────────────────────────────────────────────┘

You Select Story
   ↓
AI Hook Selection (auto-suggest)
   ↓
   ├─ Story type → Hook pattern mapping
   ├─ Draft hook in your voice
   └─ YOU APPROVE/EDIT (2 min)

AI Visual Strategy (auto-generate)
   ↓
   ├─ Hook type → Visual format
   ├─ Generate nano banana prompt
   ├─ Call API → Create image
   └─ YOU REVIEW/APPROVE (1 min)

AI Post Draft (auto-write)
   ↓
   ├─ Hook + value delivery + payoff
   ├─ Voice authenticity check
   └─ YOU EDIT/FINALIZE (3 min)

YOU PUBLISH + ENGAGE (2 min + ongoing)
```

---

## Setup Instructions

### Step 1: Install Dependencies

**Required:**
```bash
# System dependencies
sudo apt-get update
sudo apt-get install -y curl jq

# Optional (for fallback image creation)
sudo apt-get install -y imagemagick
```

**Environment Variables:**
```bash
# Add to ~/.bashrc or ~/.zshrc

# Nano Banana API
export NANO_BANANA_API_URL="http://your-nano-banana-api:8000"

# Optional: Notification service
export NOTIFICATION_SERVICE="slack"  # or "email", "terminal"
export SLACK_WEBHOOK_URL="https://hooks.slack.com/..."
```

Reload:
```bash
source ~/.bashrc
```

---

### Step 2: Configure Cron for Daily Discovery

**Option A: Daily at 7 AM**

```bash
# Edit crontab
crontab -e

# Add this line:
0 7 * * * /home/user/social-posts-plugin/profiles/simon/scripts/daily-story-discovery.sh >> /tmp/story-discovery.log 2>&1
```

**Option B: Run manually when needed**

```bash
cd profiles/simon/scripts
./daily-story-discovery.sh
```

**Notification:** Digest saved to `profiles/simon/.cache/daily-digest-YYYY-MM-DD.md`

---

### Step 3: Test Visual Generation

**Test nano banana integration:**

```bash
cd profiles/simon/scripts

# Test with person-focused hook
./generate-visual-nano-banana.sh person-focused \
    "MrBeast gets \$200M investment from BitMine" \
    test-mrbeast.png

# Test with "finally" moment
./generate-visual-nano-banana.sh finally-moment \
    "AI is finally getting personal: Google Personal Intelligence" \
    test-google-ai.png
```

**Check output:**
```bash
ls ../generated-visuals/
```

---

### Step 4: Setup Notification System

**Option A: Terminal (Default)**
- Digest prints to terminal
- Saved in `.cache/` directory
- Simple, no setup needed

**Option B: Slack**
```bash
# Install slack webhook script (create if needed)
cat > profiles/simon/scripts/notify-slack.sh <<'EOF'
#!/bin/bash
DIGEST_FILE="$1"
WEBHOOK_URL="$SLACK_WEBHOOK_URL"

DIGEST_CONTENT=$(cat "$DIGEST_FILE")

curl -X POST "$WEBHOOK_URL" \
  -H 'Content-Type: application/json' \
  -d "{\"text\": \"📬 Daily Story Digest\", \"blocks\": [{\"type\": \"section\", \"text\": {\"type\": \"mrkdwn\", \"text\": \"$(echo "$DIGEST_CONTENT" | head -50)...\"}}]}"
EOF

chmod +x profiles/simon/scripts/notify-slack.sh
```

**Option C: Email**
```bash
# Requires mail/sendmail installed
sudo apt-get install mailutils

# Use in daily-story-discovery.sh:
mail -s "Daily Story Digest" your@email.com < "$NOTIFICATION_FILE"
```

---

## Daily Workflow (With Automation)

### Morning (10 minutes total)

**7:00 AM - Automatic:**
```
✅ Cron runs daily-story-discovery.sh
✅ Stories fetched and filtered
✅ Digest created in .cache/
✅ Notification sent (if configured)
```

**7:05 AM - You review (5 min):**
```bash
# Read today's digest
cat profiles/simon/.cache/daily-digest-$(date +%Y-%m-%d).md

# Or ask Claude:
# "Read my daily digest and summarize Priority 1 stories"
```

**7:10 AM - Select story (1 min):**
```
- Pick 1-2 Priority 1 stories
- Note which hook pattern suggested
```

---

### Post Creation (10 minutes total per post)

**Step 1: Generate Hook (2 min - AI + review)**

Ask Claude:
```
Using story from today's digest:
"[Story title/summary]"

Generate a hook using [suggested pattern] adapted to my voice.
```

Claude will:
- Draft hook in Simon's voice
- Apply specificity (company, $, context)
- Maintain authenticity

You:
- Review and approve or tweak

---

**Step 2: Generate Visual (3 min - automated + review)**

Run script:
```bash
cd profiles/simon/scripts

./generate-visual-nano-banana.sh \
    [hook-type] \
    "[story summary]" \
    post-$(date +%Y%m%d).png
```

Or ask Claude:
```
Generate visual for this hook using nano banana API:
[paste hook]
```

You:
- Review generated image
- Approve or regenerate with tweaks

---

**Step 3: Draft Post (3 min - AI + review)**

Ask Claude:
```
Write full LinkedIn post for:

Hook: [your hook]
Story: [summary]
Visual: [description]

Use my voice patterns, 3-paragraph structure.
```

Claude will:
- Write hook + value delivery + payoff
- Check voice authenticity
- Ensure proper structure

You:
- Quick edit for final polish
- Verify specifics (names, amounts, dates)

---

**Step 4: Publish + Engage (2 min + 90 min monitoring)**

```
1. Copy post to LinkedIn
2. Upload generated visual
3. Preview on mobile
4. Publish
5. Set 15-min timer to check back
```

**First 90 minutes:**
- Check every 15 min
- Respond to early comments
- Drive engagement velocity

---

## Automation Scripts Reference

### Script 1: `daily-story-discovery.sh`

**Purpose:** Fetch and filter daily stories

**Usage:**
```bash
./daily-story-discovery.sh
```

**Output:**
- Digest file: `.cache/daily-digest-YYYY-MM-DD.md`
- Raw stories: `.cache/stories-YYYY-MM-DD.json.raw`

**Configuration:**
Edit RSS feeds in script:
```bash
declare -a RSS_FEEDS=(
    "https://techcrunch.com/tag/fintech/feed/"
    "https://www.theblock.co/rss.xml"
    # Add your sources here
)
```

---

### Script 2: `generate-visual-nano-banana.sh`

**Purpose:** Auto-generate visuals using nano banana API

**Usage:**
```bash
./generate-visual-nano-banana.sh <hook-type> <story-details> [filename]
```

**Hook Types:**
- `person-focused`, `1` - Quote over face
- `finally-moment`, `3`, `13` - Before/after comparison
- `dollar-amount`, `2`, `11` - Person + dollar overlay
- `stakes-first`, `9` - Venn diagram
- `action-verbs`, `12` - Flow diagram
- `multiple-examples` - Timeline grid

**Examples:**
```bash
# MrBeast investment story
./generate-visual-nano-banana.sh dollar-amount \
    "MrBeast receives \$200M from BitMine - Crypto investing in creator IP" \
    mrbeast-200m.png

# Google AI personal intelligence
./generate-visual-nano-banana.sh finally-moment \
    "AI finally getting personal with Google Personal Intelligence" \
    google-ai-personal.png

# Founder profile
./generate-visual-nano-banana.sh person-focused \
    "Oliver Daemen: Youngest space traveler now investing in crypto" \
    oliver-daemen.png
```

**Output:**
- Generated image: `generated-visuals/[filename]`

---

### Script 3: `auto-research-linkedin.sh` (Existing)

**Purpose:** Research LinkedIn patterns for creators

**Usage:**
```bash
./auto-research-linkedin.sh linasbeliunas
```

**Use case:** When you find a creator to analyze

---

## Troubleshooting

### Issue: Daily digest not generating

**Check:**
```bash
# Verify cron is running
crontab -l

# Check logs
tail -f /tmp/story-discovery.log

# Run manually to test
./profiles/simon/scripts/daily-story-discovery.sh
```

**Fix:**
- Ensure correct paths in crontab
- Check RSS feeds are accessible
- Verify write permissions to .cache/

---

### Issue: Nano banana API not working

**Check:**
```bash
# Test API endpoint
curl -X GET "$NANO_BANANA_API_URL/health"

# Check environment variable
echo $NANO_BANANA_API_URL
```

**Fix:**
- Verify API is running
- Check API URL is correct
- Ensure API key/auth (if required)
- Falls back to ImageMagick if API unavailable

---

### Issue: Images not generating

**Check:**
```bash
# Verify output directory exists
ls profiles/simon/generated-visuals/

# Check permissions
ls -la profiles/simon/

# Test ImageMagick (fallback)
convert -version
```

**Fix:**
- Create output directory manually
- Install ImageMagick for fallback
- Check disk space

---

## Performance Metrics

Track to measure automation effectiveness:

### Time Metrics (Weekly)

**Before Automation:**
- Story discovery: 70 min/week (10 min x 7 days)
- Hook selection: 35 min/week (5 min x 7 posts)
- Visual creation: 70 min/week (10 min x 7 posts)
- **Total:** 175 min/week (2.9 hours)

**After Automation:**
- Story discovery: 35 min/week (5 min review x 7 days)
- Hook selection: 14 min/week (2 min x 7 posts)
- Visual creation: 21 min/week (3 min x 7 posts)
- **Total:** 70 min/week (1.2 hours)

**Time Saved:** 105 minutes/week (1.75 hours)

---

### Quality Metrics

Track to ensure automation doesn't hurt quality:

- Engagement rate (should stay same or increase)
- Comment quality (real discussion vs "great!")
- Hook effectiveness (% of Priority 1 that perform)
- Visual approval rate (% that need no edits)

**Goal:** Time saved WITHOUT quality loss

---

## Future Automation Opportunities

### Phase 2 (Not yet implemented)

**Full AI Story Analysis:**
- Claude API integration for 3-filter system
- Automatic priority assignment
- Confidence scores per story

**Smart Hook Selection:**
- Analyze past performance by hook type
- Suggest best pattern based on your history
- A/B test recommendations

**Automated Visual Sourcing:**
- Auto-fetch person photos (Clearbit, LinkedIn API)
- Auto-fetch logos (comprehensive logo APIs)
- Background removal automation

**Post Scheduling:**
- Optimal time prediction based on your audience
- Queue system (draft multiple, auto-publish)
- Cross-posting (LinkedIn → Twitter automation)

---

### Phase 3 (Advanced)

**Performance Tracking:**
- Automatically log engagement metrics
- Hook pattern performance analysis
- Visual format effectiveness tracking
- ROI dashboard

**Engagement Automation:**
- Smart comment suggestions
- Auto-like relevant comments
- Suggested follow-ups for discussions

**Content Calendar:**
- Pattern-based posting (don't oversaturate)
- Topic diversity tracking
- Seasonal trend integration

---

## Current Automation Status

✅ **Fully Implemented:**
- Daily story discovery script
- Nano banana visual generation
- Hook-to-visual mapping
- Voice pattern documentation

🔄 **Partially Implemented:**
- 3-Filter system (manual AI review)
- Notification system (terminal only)
- Performance tracking (manual)

❌ **Not Yet Implemented:**
- Automatic story filtering (needs Claude API)
- Slack/email notifications (scripts ready, need config)
- Performance dashboard
- Engagement automation

---

## Setup Checklist

Before going live with automation:

- [ ] Install system dependencies (curl, jq)
- [ ] Set NANO_BANANA_API_URL environment variable
- [ ] Configure cron for daily discovery (or run manually)
- [ ] Test visual generation with sample stories
- [ ] Review first digest to verify filtering
- [ ] Setup notification method (terminal/Slack/email)
- [ ] Create `.cache/` and `generated-visuals/` directories
- [ ] Test end-to-end workflow with 1 post
- [ ] Track time saved and quality metrics
- [ ] Adjust automation based on results

---

**Last Updated:** 2026-01-17
**Automation Level:** ~60% automated, 40% human review
**Time Savings:** ~1.75 hours/week

**Next Steps:**
1. Test automation with 1 week of posts
2. Measure time saved and quality
3. Implement Phase 2 features based on gaps
4. Share learnings with other profiles

**Related Documents:**
- `daily-story-discovery.sh` - Story fetching script
- `generate-visual-nano-banana.sh` - Image generation
- `post-creation-workflow.md` - Complete manual workflow
- `story-discovery-framework.md` - 3-Filter system details
