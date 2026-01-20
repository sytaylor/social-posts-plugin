---
name: social-posts
description: Creates engaging social media posts for LinkedIn and Twitter/X with platform-specific optimization, proven writing frameworks, and customizable tone-of-voice. Use when writing social posts, adapting content across platforms, optimizing engagement, or creating content calendars.
allowed-tools: Read, Grep, AskUserQuestion
---

# Social Posts Skill

Create scroll-stopping social media posts optimized for LinkedIn and Twitter/X using proven frameworks from top creators.

## Quick Start

This skill helps you:
- ✅ Write platform-optimized posts (LinkedIn, Twitter/X)
- ✅ Apply proven writing frameworks (hooks, structure, storytelling)
- ✅ Match your authentic tone-of-voice
- ✅ Optimize for algorithmic distribution
- ✅ Drive engagement and conversions

## How It Works

1. **Identify Platform & Goals** - Which platform? What's the objective?
2. **Apply Writing Framework** - Use proven structures for hooks, engagement
3. **Match Tone-of-Voice** - Authentic, professional, witty, or custom
4. **Optimize for Algorithm** - Platform-specific best practices
5. **Polish & Deliver** - Ready-to-publish posts

## Reference Materials

### Simon's Personal Voice & Patterns (ALWAYS LOAD)
- [core/simon-voice-patterns.md](core/simon-voice-patterns.md) - Simon's unique writing voice
- [core/simon-learned-patterns.md](core/simon-learned-patterns.md) - Simon's personal discoveries (living document - Simon actively updates this)
- [core/image-generation-guidelines.md](core/image-generation-guidelines.md) - Simon's image creation standards (ONLY when generating images)

### Core Writing Instructions (ALWAYS LOAD)
- [../../core/instructions.md](../../core/instructions.md) - Universal framework for all posts
- [../../.shared/core/learned-patterns.md](../../.shared/core/learned-patterns.md) - Universal patterns that work for everyone

**Two-Tier Learning System:**
- Universal patterns (../../.shared/core/learned-patterns.md) = Validated patterns for everyone
- Simon's patterns (core/simon-learned-patterns.md) = Simon's personal experiments and discoveries
- **ALWAYS load BOTH** to get complete context: proven tactics + Simon's learnings

### Platform Optimization (HIGH-FREQUENCY)
- [../../platforms/linkedin-algorithm.md](../../platforms/linkedin-algorithm.md) - LinkedIn 2025 algorithm tactics
- [../../platforms/twitter.md](../../platforms/twitter.md) - Twitter/X writing best practices

### Advanced Platform Materials (CONDITIONAL)
- [../../.shared/platforms/linkedin-growth.md](../../.shared/platforms/linkedin-growth.md) - LinkedIn strategy (ONLY if user asks about growth)
- [../../.shared/platforms/twitter-algorithm-deep-dive.md](../../.shared/platforms/twitter-algorithm-deep-dive.md) - X algorithm optimization (ONLY when requested)

### Writing Craft (CONDITIONAL - Load only when needed)
- [../../.shared/writing-craft/hooks-and-structure.md](../../.shared/writing-craft/hooks-and-structure.md) - Hook patterns (ONLY if struggling)
- [../../.shared/writing-craft/storytelling.md](../../.shared/writing-craft/storytelling.md) - Storytelling (ONLY for narratives)
- [../../.shared/writing-craft/psychology.md](../../.shared/writing-craft/psychology.md) - Persuasion (ONLY for marketing posts)

### Advanced Materials (CONDITIONAL)
- [../../.shared/hooks/universal-hook-patterns.md](../../.shared/hooks/universal-hook-patterns.md) - Hook variations (ONLY when requested)
- [../../.shared/story-evaluation/3-filter-system.md](../../.shared/story-evaluation/3-filter-system.md) - Story filtering (ONLY for evaluation)
- [../../.shared/visual-strategy/image-sourcing-guide.md](../../.shared/visual-strategy/image-sourcing-guide.md) - Image sourcing (ONLY for visual content)

### Tone-of-Voice (CONDITIONAL)
- [../../.shared/tone/fintechbrainfood.md](../../.shared/tone/fintechbrainfood.md) - FintechBrainfood tone (ONLY if requested)

### Examples (CONDITIONAL)
- [../../.shared/examples/linkedin-examples.md](../../.shared/examples/linkedin-examples.md) - LinkedIn examples (ONLY if user asks)
- [../../.shared/examples/twitter-examples.md](../../.shared/examples/twitter-examples.md) - Twitter examples (ONLY if user asks)

---

## Instructions

### Step 1: Understand the Request

When a user asks you to create a social post, first gather:

1. **Platform** - LinkedIn, Twitter/X, or both?
2. **Topic/Subject** - What are we writing about?
3. **Goal** - What action should readers take?
4. **Tone** - Professional? Casual? Witty? (Or use custom tone guide)
5. **Length** - Single post, thread, or carousel?

Use `AskUserQuestion` if any of these are unclear.

### Step 2: Select the Right Framework (Simon's Conditional Loading)

Based on the request, reference the appropriate guides. **Load only what's needed to keep context efficient.**

**For LinkedIn Posts (Simon):**

*ALWAYS read:*
1. [../../core/instructions.md](../../core/instructions.md) - Universal framework
2. [../../.shared/core/learned-patterns.md](../../.shared/core/learned-patterns.md) - Universal patterns (everyone)
3. [core/simon-learned-patterns.md](core/simon-learned-patterns.md) - Simon's personal patterns (living document)
4. [core/simon-voice-patterns.md](core/simon-voice-patterns.md) - Simon's unique voice
5. [../../platforms/linkedin-algorithm.md](../../platforms/linkedin-algorithm.md) - LinkedIn 2025 tactics

*CONDITIONALLY read (only when needed):*
- [../../.shared/platforms/linkedin-growth.md](../../.shared/platforms/linkedin-growth.md) - ONLY if user asks about growth strategy
- [../../.shared/writing-craft/hooks-and-structure.md](../../.shared/writing-craft/hooks-and-structure.md) - ONLY if struggling with hooks
- [../../.shared/writing-craft/storytelling.md](../../.shared/writing-craft/storytelling.md) - ONLY for story-driven posts
- [../../.shared/writing-craft/psychology.md](../../.shared/writing-craft/psychology.md) - ONLY for persuasion posts
- [core/image-generation-guidelines.md](core/image-generation-guidelines.md) - ONLY when creating images

**For Twitter/X Posts (Simon):**

*ALWAYS read:*
1. [../../core/instructions.md](../../core/instructions.md) - Universal framework
2. [../../.shared/core/learned-patterns.md](../../.shared/core/learned-patterns.md) - Universal patterns
3. [core/simon-learned-patterns.md](core/simon-learned-patterns.md) - Simon's patterns
4. [core/simon-voice-patterns.md](core/simon-voice-patterns.md) - Simon's voice
5. [../../platforms/twitter.md](../../platforms/twitter.md) - Twitter writing tactics

*THEN ask the user:*

**"Would you like me to optimize this for the X algorithm (2025)? This adds detailed ranking signals and engagement tactics."**

- If YES → Read [../../.shared/platforms/twitter-algorithm-deep-dive.md](../../.shared/platforms/twitter-algorithm-deep-dive.md)
- If NO → Skip algorithm deep dive

*CONDITIONALLY read (only when needed):*
- [../../.shared/writing-craft/hooks-and-structure.md](../../.shared/writing-craft/hooks-and-structure.md) - ONLY if struggling
- [../../.shared/hooks/universal-hook-patterns.md](../../.shared/hooks/universal-hook-patterns.md) - ONLY if user requests variations

**Expected Token Usage for Simon:**
- Typical post: ~12K tokens (universal + Simon's patterns + platform)
- With algorithm optimization: ~20K tokens (adds algorithm deep dive)
- Still 60% reduction from previous ~30K tokens

**Learning System Note:**
Simon can continue adding patterns to [core/simon-learned-patterns.md](core/simon-learned-patterns.md). This file is a living document that Simon actively updates as he discovers new patterns. Universal patterns stay in ../../.shared/core/learned-patterns.md.

### Step 3: Apply Tone-of-Voice

**Option A: Use Built-in Tone**
- Read [tone/fintechbrainfood.md](tone/fintechbrainfood.md) for a witty, informed, conversational style

**Option B: Create Custom Tone**
If the user wants a custom tone, use `AskUserQuestion` to ask:
1. "Can you share 2-3 examples of your writing or posts that represent your voice?"
2. Or: "Would you like to upload a tone-of-voice guide?"

Then analyze their examples to extract:
- Sentence structure patterns
- Word choices and vocabulary
- Humor style (if any)
- Formality level
- Signature phrases or patterns

Save this analysis for reuse in the conversation.

**Option C: Quiz Method**
Ask the user:
1. "On a scale from casual to formal (1-5), where does your tone sit?"
2. "Do you use humor? If yes, what style? (witty, sarcastic, playful, dry)"
3. "What 3 adjectives best describe your voice? (e.g., confident, technical, friendly)"
4. "Any words/phrases you always use or always avoid?"

Use their answers to guide tone matching.

### Step 4: Write the Post

Follow this structure:

#### For LinkedIn:
```
Hook (< 15 words)
- Creates "wait... what?" moment
- Front-loads value or intrigue

Key Insight #1
- Build stakes as you go
- Unpack step by step

Second-order insight #2 (optional)
- Deeper implications

Takeaway / CTA
- One line, present tense
- Clear next action
```

**LinkedIn Formatting:**
- Use aggressive line breaks
- Use dashes (---) as section dividers
- Single-line punches for impact
- Keep to 120-180 chars per chunk
- End on implications, not hype

#### For Twitter/X:
```
Hook (< 10 words)
- Immediate attention grab

Value/Insight
- One clear idea
- Specific, not vague

Call-to-Action
- Retweet, comment, or click
```

**Twitter Formatting:**
- 280 char max for single tweets
- For threads: number each tweet (1/5, 2/5, etc.)
- Use 1-2 emojis max (only if they add value)
- 1-2 hashtags maximum
- Link in final tweet of threads

### Step 5: Optimize for Algorithm

**LinkedIn Optimization:**
- Aim for first 210 characters to hook before "see more"
- Include 3-5 relevant hashtags at the end
- Ask a question to spark comments
- Post during optimal windows (Tue-Wed 8-9 AM, Tue-Thu 10 AM-12 PM)
- Naturally include keywords in opening lines

**Twitter/X Optimization:**
- Keep tweets 100-200 chars for best engagement
- Tweet during high-activity periods
- Use media (images/GIFs) when relevant
- Engage with replies in first 60 mins

### Step 6: Review Against Guardrails

Before delivering, check:

✅ **Clarity** - Is the message immediately clear?
✅ **Authenticity** - Does it sound like a real person?
✅ **Value** - Does it give readers something useful/interesting?
✅ **Platform Fit** - Does it follow platform best practices?
✅ **CTA** - Is there a clear next action?
✅ **Tone Match** - Does it match the requested voice?

**Avoid:**
- ❌ Jargon without context
- ❌ Forced hyphens
- ❌ Generic statements
- ❌ "Didn't" and "isn't just" phrasing (find creative alternatives)
- ❌ Theatrical scaffolding or forced contrasts
- ❌ Subheaders (use clean formatting instead)
- ❌ More than 2 emojis (and only if they earn their keep)
- ❌ Guessing facts (leave "TK" placeholders instead)

### Step 7: Create Images (If Requested)

If the user requests image generation or provides charts/images to combine:

**Read [core/image-generation-guidelines.md](core/image-generation-guidelines.md) first**

**Key requirements:**
- ✅ Always use 16:9 landscape orientation (unless explicitly told otherwise)
- ✅ Preserve original charts/images as much as possible
- ✅ Keep original author logos and attribution visible
- ✅ Add "Edited by Fintech Brainfood" in bottom right corner
- ✅ Professional financial aesthetic
- ✅ All text must remain readable

**Common scenarios:**
- Combining multiple charts: Use grid layout (2x2, 3x1, etc.)
- Single chart enhancement: Add context/headline while preserving original
- Data visualization: Maintain source styling and branding

### Step 8: Deliver the Post

Present the final post with:
1. The post itself (ready to copy-paste)
2. Brief explanation of choices made
3. Platform-specific tips for posting
4. Suggested posting time
5. Optional: Variations or alternatives
6. If images were created: File paths and descriptions

---

## Examples

### Example Workflow: LinkedIn Post Request

**User:** "Write me a LinkedIn post about our new AI feature launch"

**Your Process:**
1. ✅ Platform: LinkedIn
2. ✅ Topic: AI feature launch
3. ❓ Ask: "What does this feature do? Who's it for? What's the wow factor?"
4. ❓ Ask: "What tone? Professional thought leadership or conversational hype?"
5. Read core/instructions.md for framework
6. Read platforms/linkedin-algorithm.md for optimization
7. Read writing-craft/hooks-and-structure.md for hook patterns
8. Apply tone (default or custom)
9. Write post following LinkedIn structure
10. Optimize for algorithm
11. Review against guardrails
12. Deliver with posting tips

---

## Tips for Best Results

1. **Read the relevant guides** - Don't skip the reference materials
2. **Match the tone authentically** - Analyze examples if provided
3. **Front-load value** - First 210 chars matter most on LinkedIn
4. **Be specific** - "3 tactics" beats "some tactics"
5. **Create tension** - Problem → Stakes → Solution
6. **Test variations** - Offer 2-3 hook options when helpful
7. **Keep it scannable** - Line breaks, white space, visual rhythm

---

## Quick Reference: When to Use What

| User Request | Read These Guides |
|-------------|-------------------|
| "LinkedIn post about X" | core/instructions.md + core/learned-patterns.md + platforms/linkedin-algorithm.md + writing-craft/hooks-and-structure.md |
| "Twitter thread on Y" | core/instructions.md + core/learned-patterns.md + platforms/twitter.md + writing-craft/hooks-and-structure.md |
| "News-driven post" or "BREAKING:" | core/learned-patterns.md (Pattern 1) + core/instructions.md |
| "Post with a story" | Add writing-craft/storytelling.md |
| "Persuasive post" | Add writing-craft/psychology.md |
| "Match FintechBrainfood tone" | Add tone/fintechbrainfood.md |
| "Custom tone" | Quiz user OR ask for examples |

---

## Advanced: Creating a Custom Tone Guide

If a user wants to save their custom tone for reuse, guide them to create a tone guide using [tone/custom-guide.md](tone/custom-guide.md) as a template.

Store it as: `tone/[name]-custom.md`

This becomes part of their personal skill reference library.

---

**Ready to create scroll-stopping social posts? Let's go!**
