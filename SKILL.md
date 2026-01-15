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

### Core Writing Instructions
- [core/instructions.md](core/instructions.md) - Main social post creation framework

### Platform Optimization
- [platforms/linkedin-algorithm.md](platforms/linkedin-algorithm.md) - LinkedIn 2025 algorithm tactics
- [platforms/linkedin-growth.md](platforms/linkedin-growth.md) - LinkedIn posting strategy
- [platforms/twitter.md](platforms/twitter.md) - Twitter/X best practices

### Writing Craft
- [writing-craft/hooks-and-structure.md](writing-craft/hooks-and-structure.md) - Julian Shapiro's writing principles
- [writing-craft/storytelling.md](writing-craft/storytelling.md) - MrBeast's content principles
- [writing-craft/psychology.md](writing-craft/psychology.md) - Marketing psychology frameworks

### Tone-of-Voice
- [tone/fintechbrainfood.md](tone/fintechbrainfood.md) - Example: FintechBrainfood style
- [tone/custom-guide.md](tone/custom-guide.md) - Template for creating your own

### Examples
- [examples/linkedin-examples.md](examples/linkedin-examples.md) - Reference LinkedIn posts
- [examples/twitter-examples.md](examples/twitter-examples.md) - Reference Twitter/X posts

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

### Step 2: Select the Right Framework

Based on the request, reference the appropriate guides:

**For LinkedIn Posts:**
1. Read [core/instructions.md](core/instructions.md) for the main framework
2. Read [platforms/linkedin-algorithm.md](platforms/linkedin-algorithm.md) for 2025 optimization
3. Read [platforms/linkedin-growth.md](platforms/linkedin-growth.md) for posting strategy
4. Read [writing-craft/hooks-and-structure.md](writing-craft/hooks-and-structure.md) for hook patterns

**For Twitter/X Posts:**
1. Read [core/instructions.md](core/instructions.md) for the main framework
2. Read [platforms/twitter.md](platforms/twitter.md) for Twitter-specific tactics
3. Read [writing-craft/hooks-and-structure.md](writing-craft/hooks-and-structure.md) for hook patterns

**For Storytelling/Narrative Posts:**
- Add [writing-craft/storytelling.md](writing-craft/storytelling.md) for MrBeast principles

**For Marketing/Persuasion:**
- Add [writing-craft/psychology.md](writing-craft/psychology.md) for psychological frameworks

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

### Step 7: Deliver the Post

Present the final post with:
1. The post itself (ready to copy-paste)
2. Brief explanation of choices made
3. Platform-specific tips for posting
4. Suggested posting time
5. Optional: Variations or alternatives

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
| "LinkedIn post about X" | core/instructions.md + platforms/linkedin-algorithm.md + writing-craft/hooks-and-structure.md |
| "Twitter thread on Y" | core/instructions.md + platforms/twitter.md + writing-craft/hooks-and-structure.md |
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
