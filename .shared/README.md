# Shared Best Practices (Universal)

**Purpose:** Universal social media best practices that work across all voices, industries, and profiles.

**Sync:** This directory is a git submodule pointing to `brainfood-social-best-practices` repository.

---

## What Goes Here vs Profile-Specific

### ✅ Universal (Goes in `.shared/`)

**Hook Patterns:**
- Person-focused narrative ("This is [Name]...")
- Dollar amount specificity ("$200M investment...")
- "Finally" moment framing
- Exclamatory emotion hooks
- Stakes-first framing
- Action verbs with stakes

**Visual Strategies:**
- Image sourcing techniques (Clearbit API, press kits)
- Format decision trees (hook type → visual format)
- Legal/rights information
- Quality checklist

**Story Evaluation:**
- 3-Filter System (Voice/Audience/Performance)
- Priority matrix (P1-P4)
- Pattern recognition techniques
- Filtering best practices

**Engagement Tactics:**
- Golden hour strategy (first 90 min)
- Comment response templates
- Performance benchmarks

**Why Universal:**
- Works for any voice (analytical, conversational, thought leadership)
- Works for any industry (fintech, SaaS, crypto, B2B)
- Core psychological principles (not voice-specific)

---

### ❌ Profile-Specific (Goes in `/profiles/[name]/`)

**Voice Patterns:**
- "I'm stumped" (Simon-specific humility)
- Both-sides thinking (Simon's analytical style)
- Specific conversational markers
- Tone preferences (formal, casual, witty)

**Topic Perspectives:**
- Views on crypto (Simon: skeptical optimist)
- Views on fintech (Simon: infrastructure geek)
- Industry-specific takes

**Preferences:**
- Hashtag usage (Simon: minimal to none)
- Emoji frequency (Simon: 0-1 max)
- Post length preferences
- Platform choices

**Why Profile-Specific:**
- Unique to individual's voice
- Personal expertise areas
- Individual preferences/style

---

## Directory Structure

```
.shared/
├── README.md                       ← This file
├── hooks/
│   └── universal-hook-patterns.md  ← Hook formulas for all voices
├── visual-strategy/
│   └── image-sourcing-guide.md     ← Universal visual sourcing
├── story-evaluation/
│   └── 3-filter-system.md          ← Story filtering framework
└── engagement/
    └── engagement-tactics.md       ← (Future) Universal engagement
```

---

## How to Use

### As a Profile Creator

**1. Reference universal patterns:**
```
See `.shared/hooks/universal-hook-patterns.md` for hook formulas
```

**2. Adapt to your voice:**
```
Universal: "This is [Name]. [Context]. [Surprising thing]."

Your adaptation:
- Formal: "Meet [Name], [Title]. [Achievement]. [Next move]."
- Casual: "This is [Name]. [Fun fact]. [Plot twist]."
- Analytical: "This is [Name]. [Context]. Here's why this matters..."
```

**3. Keep your voice-specific content separate:**
```
/profiles/yourname/
├── core/
│   ├── voice-patterns.md           ← YOUR unique voice
│   ├── topic-perspectives.md       ← YOUR takes
│   └── preferences.md              ← YOUR style choices
└── ...
```

---

## Syncing Best Practices

### Pull Latest (Get updates from shared repo)

```bash
# From project root
./sync-best-practices.sh

# Or manually:
cd .shared
git pull origin main
cd ..
git add .shared
git commit -m "Update best practices to latest"
git push
```

---

### Push Changes (Share your learnings)

When you discover a universal pattern (works for multiple voices):

**1. Add to `.shared/`:**
```bash
# Edit the appropriate file
vim .shared/hooks/universal-hook-patterns.md

# Add new pattern with examples
```

**2. Commit and push:**
```bash
cd .shared
git add .
git commit -m "Add new hook pattern: [description]"
git push origin main
```

**3. Update parent project:**
```bash
cd ..
git add .shared
git commit -m "Update .shared with new pattern"
git push
```

**4. Others pull your changes:**
```bash
# In their projects:
./sync-best-practices.sh
```

---

## When to Add to `.shared/` vs Profile

### Decision Tree

```
Did you discover a pattern that worked well?
    ↓
Does it work ONLY in your voice?
    YES → Add to /profiles/yourname/
    NO → Continue
    ↓
Does it work across multiple industries?
    NO → Add to /profiles/yourname/
    YES → Continue
    ↓
Is it a general writing principle?
    YES → Add to .shared/
    NO → Add to /profiles/yourname/
```

### Examples

**Universal (goes to `.shared/`):**
- ✅ "Person-focused narrative works for all voices"
- ✅ "Dollar amounts increase engagement universally"
- ✅ "Clearbit API works for any industry's logos"
- ✅ "First 90 minutes = golden hour (algorithm fact)"

**Profile-Specific (stays in `/profiles/simon/`):**
- ❌ "Simon's 'I'm stumped' creates authentic uncertainty"
- ❌ "Simon avoids hashtags (personal preference)"
- ❌ "Simon's crypto skeptical-optimist perspective"
- ❌ "Both-sides thinking (Simon's analytical approach)"

---

## Contribution Guidelines

### Before Adding to `.shared/`

**Ask yourself:**

1. **Is this universal?**
   - Would this work for a formal executive voice? ✅
   - Would this work for a casual founder voice? ✅
   - Would this work for B2B SaaS company? ✅

2. **Is it proven?**
   - Have you tested it multiple times? ✅
   - Do you have performance data? ✅
   - Does it work consistently? ✅

3. **Is it adaptable?**
   - Can others modify it for their voice? ✅
   - Are there clear "how to adapt" instructions? ✅
   - Examples for multiple voice types? ✅

If all ✅ → Add to `.shared/`
If any ❌ → Keep in your profile (or add later when proven)

---

### Format for `.shared/` Content

**Use this template:**

```markdown
# [Title of Pattern/Technique]

**Purpose:** [One sentence describing what this does]

**Application:** Universal across voices and industries

---

## The Pattern

[Describe the pattern]

### Formula
```
[Template with [placeholders]]
```

### Why It Works
- ✅ [Psychological principle 1]
- ✅ [Psychological principle 2]

### When to Use
- [Use case 1]
- [Use case 2]

---

## Adaptation Guide

**For Formal Voice:**
[Example adaptation]

**For Conversational Voice:**
[Example adaptation]

**For Analytical Voice:**
[Example adaptation]

---

## Real Examples

**Example 1:**
[Real post, with performance data if available]

**Example 2:**
[Real post, different voice/industry]

---

## Common Mistakes

❌ [What not to do]
✅ [What to do instead]

---

**Last Updated:** YYYY-MM-DD
**Source:** [Where this pattern came from]
```

---

## Avoiding Duplication

### Before Adding New Content

**1. Check if it exists:**
```bash
# Search across .shared
grep -r "person-focused" .shared/

# Or check index
cat .shared/README.md
```

**2. Enhance existing instead of duplicating:**
- Add example to existing pattern
- Expand "Adaptation Guide" section
- Add to "Real Examples"

**3. Create new file only if:**
- Truly different pattern
- Different category (hooks vs visuals vs evaluation)
- Complementary but not duplicate

---

## Version Control Best Practices

### Commit Messages

**Good commit messages:**
- ✅ "Add Pattern 13: The 'Finally' Moment hook"
- ✅ "Update visual strategy with celebrity > company rule"
- ✅ "Enhance 3-filter system with automation guidance"

**Bad commit messages:**
- ❌ "Update file"
- ❌ "Changes"
- ❌ "Fix"

### When to Commit

**Commit when:**
- You've added a complete new pattern
- You've significantly enhanced an existing pattern
- You've updated with new performance data
- You've added multiple adaptation examples

**Don't commit:**
- Half-finished thoughts
- Untested theories
- Profile-specific preferences
- Work-in-progress drafts

---

## FAQ

### Q: I have a great pattern but only tested it 3 times. Add to `.shared/`?

**A:** Not yet. Test 10+ times across different stories. Get consistent performance data. Then add with note: "Tested X times, avg Y% engagement increase."

---

### Q: My pattern works great for fintech but unsure about other industries?

**A:** Keep in your profile first. Ask others to test. If 2-3 different industries confirm it works → Move to `.shared/` with adaptation notes.

---

### Q: Should I move ALL universal patterns from my profile to `.shared/`?

**A:** No. Only move patterns you want to:
1. Share with other profiles
2. Keep in sync across projects
3. Maintain as "source of truth"

Keep convenience copies in your profile if you reference them frequently.

---

### Q: Someone else added a pattern to `.shared/` I disagree with?

**A:** Open discussion:
1. Test the pattern yourself
2. Document your results
3. Add "Caution" section if needed
4. Or create alternative in new file

`.shared/` is collaborative, not dictatorial.

---

### Q: How often should I sync?

**A:**
- **Pull (get updates):** Weekly or before starting new research
- **Push (share learnings):** After you discover/validate new pattern
- **Full sync:** Run `./sync-best-practices.sh` monthly

---

## Maintenance

### Monthly Review

**Check for:**
- Outdated patterns (performance changed?)
- Duplicate content (can be consolidated?)
- Missing adaptations (new voice types emerged?)
- Broken links or references

### Quarterly Cleanup

**Actions:**
- Archive patterns that stopped working
- Consolidate similar patterns
- Update performance benchmarks
- Add newly discovered patterns

---

## Current Contents

Last updated: 2026-01-17

### Hooks (6 patterns)
1. Person-Focused Narrative
2. Dollar Amount Specificity
3. The "Finally" Moment ⭐ NEW
4. Exclamatory Emotion Hook
5. Stakes-First Framing
6. Action Verbs with Stakes

### Visual Strategy
- Image sourcing guide (people, logos, products)
- Recognizability > Company rule ⭐ NEW
- Format decision trees
- Legal/rights framework

### Story Evaluation
- 3-Filter System (Voice/Audience/Performance)
- Priority matrix (P1-P4)
- Pattern recognition ("3 examples = trend")
- Filtering anti-patterns

### Engagement (Coming Soon)
- Golden hour tactics
- Comment response framework
- Performance tracking

---

**Repository:** https://github.com/sytaylor/brainfood-social-best-practices
**Last Sync:** Run `./sync-best-practices.sh` to update
**Contributions:** Always welcome! Follow guidelines above.
