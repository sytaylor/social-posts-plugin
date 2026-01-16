# Social Posts Skill Profiles

This directory contains personalized profiles that extend the base social-posts skill with user-specific preferences, branding, and learned patterns.

---

## How Profiles Work

**Base Skill (in root directory):**
- Contains universal social post writing frameworks
- Platform optimization tactics
- Writing craft principles
- No personal branding or preferences

**Profiles (in this directory):**
- Personal extensions of the base skill
- User-specific branding (logos, colors, fonts)
- Custom tone-of-voice preferences
- Personal learned patterns from feedback
- Image generation preferences

**When Claude Code is used:**
- If a profile exists for the user, load base skill + profile preferences
- Profile preferences override base skill where conflicts exist
- Profile adds additional capabilities (e.g., image generation with personal branding)

---

## Profile Architecture: EXEC + INTERESTS

Each profile represents an **EXEC** (the person using the skill) with their personal **INTERESTS** (topics they write about).

**EXEC layer (the person):**
- Personal branding (logo, colors, fonts)
- Tone-of-voice preferences
- Image generation rules
- General writing style

**INTERESTS layer (the topics):**
- Domain expertise areas (e.g., fintech, crypto, AI)
- Key concepts and terminology
- Reference materials for each interest area
- Examples of posts in each domain

**Example: Simon's profile**
- EXEC: Simon Taylor (Fintech Brainfood founder)
- INTERESTS: Fintech, crypto, stablecoins, banking innovation, payments
- Profile contains: Simon's branding + his fintech domain knowledge

---

## Current Profiles

### `simon/`
**EXEC:** Simon Taylor (Fintech Brainfood)

**Branding:**
- Fintech Brainfood logo, colors, typography
- Image generation guidelines with specific logo placement
- Personal learned patterns from post refinements
- Preferred tone-of-voice adjustments

**INTERESTS:**
- Fintech infrastructure and innovation
- Crypto cards, stablecoins, DeFi
- Banking and payments transformation
- Financial technology trends

**To use Simon's profile:**
When working with Simon, reference files from `profiles/simon/` instead of root.

---

## Creating a New Profile

To create a new profile:

1. **Copy the base skill:**
   ```bash
   mkdir profiles/yourname
   cp -r core platforms writing-craft tone examples SKILL.md README.md profiles/yourname/
   ```

2. **Add your personal preferences:**
   - Branding: Create `core/branding.md` with your logo, colors, fonts
   - Image generation: Create `core/image-generation-guidelines.md` with preferences
   - Learned patterns: Add `core/learned-patterns.md` as you get feedback
   - Tone: Add custom tone guides in `tone/`

3. **Update the profile's SKILL.md:**
   - Reference your new personal guide files
   - Add your branding requirements to instructions

4. **Document in this README:**
   - Add your profile to the "Current Profiles" section

---

## Profile Structure

Each profile should mirror the base skill structure:

```
profiles/yourname/
├── SKILL.md                          # Profile-specific skill orchestrator
├── README.md                         # Base skill README (for reference)
├── core/
│   ├── instructions.md               # Base writing framework (unchanged)
│   ├── learned-patterns.md           # Your personal learned patterns
│   ├── branding.md                   # Your branding specs (NEW)
│   └── image-generation-guidelines.md # Your image preferences (NEW)
├── platforms/                        # Platform optimization (unchanged)
├── writing-craft/                    # Writing frameworks (unchanged)
├── tone/                             # Add your custom tone guides
└── examples/                         # Add your best examples
```

---

## Best Practices

1. **Keep base skill clean:** Universal patterns only, no personal preferences
2. **Profile = Base + Personal:** Don't duplicate base content, only add/override
3. **Document changes:** Update your profile's SKILL.md when adding preferences
4. **Learn and iterate:** Add to `learned-patterns.md` as you refine posts
5. **Share learnings:** Consider contributing universal patterns back to base skill

---

## Why Profiles?

**Benefits:**
- **Clean base skill:** Others can use the skill without your personal branding
- **Personal customization:** Your branding, tone, and preferences in your profile
- **Easy sharing:** Share the base skill openly, keep personal profiles private
- **Multiple users:** Each user can have their own profile with different preferences
- **Continuous learning:** Profiles accumulate personal feedback without cluttering the base

**Example use case:**
- Base skill: "Create engaging LinkedIn posts using proven frameworks"
- Simon's profile: Base skill + Fintech Brainfood branding + image generation + learned patterns
- Another user's profile: Base skill + their company branding + different tone preferences

---

## Migration Notes

**January 16, 2026:**
- Reverted base skill to commit `79b9e73` (before image generation was added)
- Created `profiles/simon/` with full Fintech Brainfood branding and preferences
- Base skill now contains: core writing frameworks, platform optimization, learned patterns
- Simon's profile adds: image generation, Fintech Brainfood branding, logo placement rules

---

**When Claude Code works with you, it should always reference your profile directory, not the base skill root.**
