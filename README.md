# Social Posts Plugin for Claude Code

Create scroll-stopping social media posts for LinkedIn and Twitter/X with platform-specific optimization, proven writing frameworks, and customizable tone-of-voice.

## Features

✅ **Platform-Optimized** - LinkedIn and Twitter/X best practices built-in
✅ **Proven Frameworks** - Writing principles from Julian Shapiro, MrBeast, Tej Dosa
✅ **Tone Flexibility** - Use FintechBrainfood style or create your own custom voice
✅ **Algorithm-Aware** - 2025 algorithm optimization tactics
✅ **Ready to Use** - Comprehensive examples and templates

## What This Skill Does

This Claude Code skill helps you write professional social media posts that:

- **Stop the scroll** with attention-grabbing hooks
- **Drive engagement** using psychological frameworks
- **Match your voice** with customizable tone-of-voice guides
- **Optimize for algorithms** with platform-specific tactics
- **Save time** by applying proven frameworks automatically

## Installation

### Method 1: Direct Installation (Recommended)

```bash
# Clone this repository
git clone https://github.com/simontaylor/social-posts-plugin.git

# Install the plugin
claude --plugin-dir ./social-posts-plugin
```

Then verify installation:
```bash
# In Claude Code, ask:
What skills are available?
```

You should see `social-posts` in the list.

### Method 2: Manual Installation

1. Download or clone this repository
2. Copy the `social-posts-plugin` directory to your preferred location
3. Add to your Claude Code settings:
   ```bash
   claude --plugin-dir /path/to/social-posts-plugin
   ```

### Method 3: Project-Specific

For use in a specific project only:

```bash
# In your project directory
mkdir -p .claude/skills
cp -r /path/to/social-posts-plugin/skills/social-posts .claude/skills/
```

### Optional: Shared Best Practices (Advanced)

This plugin includes an optional git submodule (`.shared/`) that references the [brainfood-social-best-practices](https://github.com/sytaylor/brainfood-social-best-practices) repository.

**The plugin works perfectly without this submodule** - it's purely for keeping best practices in sync across multiple projects.

To initialize the submodule (optional):
```bash
git submodule update --init --recursive
```

To update to latest best practices (optional):
```bash
cd .shared
git pull origin main
cd ..
git add .shared
git commit -m "Update best practices"
```

**Note:** The submodule is located in `.shared/` (hidden directory) and is not required for the skill to function.

## Quick Start

Once installed, simply ask Claude to create posts:

```
Write me a LinkedIn post about our new product launch

Create a Twitter thread about startup fundraising

Write a LinkedIn post in FintechBrainfood tone about AI in finance

Help me create a custom tone-of-voice guide
```

Claude will automatically use the skill and reference the appropriate guides.

## What's Included

### Platform Guides
- **LinkedIn Algorithm (2025)** - Current ranking signals, format preferences, optimization tactics
- **LinkedIn Growth** - Volume strategy, engagement tactics, 30-day growth plan
- **Twitter/X** - Tweet types, thread structures, engagement patterns

### Writing Craft
- **Hooks & Structure** - Julian Shapiro's framework for captivating opens and sustained engagement
- **Storytelling** - MrBeast's principles for holding attention from start to finish
- **Psychology** - Tej Dosa's marketing psychology frameworks

### Tone-of-Voice
- **FintechBrainfood Example** - Witty, informed, conversational style
- **Custom Guide Template** - Create your own tone-of-voice guide

### Examples
- **LinkedIn Examples** - 6 high-performing post types with breakdowns
- **Twitter Examples** - Single tweets, threads, and quote tweets with analysis

## Usage Examples

### Basic Post Creation

```
User: Write me a LinkedIn post about how we 3x'd our revenue

Claude will:
1. Ask clarifying questions (tone, length, CTA)
2. Reference core writing instructions
3. Apply LinkedIn optimization tactics
4. Match your preferred tone
5. Deliver ready-to-publish post
```

### With Custom Tone

```
User: Write a Twitter thread in my tone. Here are 3 examples of my writing:
[paste examples]

Claude will:
1. Analyze your examples for voice patterns
2. Extract your signature style
3. Create thread matching your voice
4. Offer to save as custom tone guide for reuse
```

### Using Built-In Tone

```
User: Write a LinkedIn post about stablecoins in FintechBrainfood tone

Claude will:
1. Reference FintechBrainfood tone guide
2. Apply witty, informed style
3. Use pop culture references
4. Match signature formatting
```

## File Structure

```
social-posts-plugin/
├── .claude-plugin/
│   └── plugin.json                # Plugin metadata (for CLI)
├── SKILL.md                       # Main orchestrator (REQUIRED at root)
├── core/
│   └── instructions.md            # Core writing framework
├── platforms/
│   ├── linkedin-algorithm.md      # LinkedIn 2025 tactics
│   ├── linkedin-growth.md         # LinkedIn growth strategy
│   └── twitter.md                 # Twitter/X best practices
├── writing-craft/
│   ├── hooks-and-structure.md     # Julian Shapiro framework
│   ├── storytelling.md            # MrBeast principles
│   └── psychology.md              # Tej Dosa frameworks
├── tone/
│   ├── fintechbrainfood.md        # Example tone guide
│   └── custom-guide.md            # Template for your tone
├── examples/
│   ├── linkedin-examples.md       # LinkedIn post examples
│   └── twitter-examples.md        # Twitter post examples
└── README.md                      # This file
```

## Creating a Custom Tone-of-Voice

### Option 1: Quiz Method

```
User: Help me create a custom tone-of-voice

Claude will ask:
1. Formality level (1-5)
2. Humor style (witty, sarcastic, none, etc.)
3. Key adjectives (3 words describing your voice)
4. Words you always/never use
```

### Option 2: Example Analysis

```
User: Analyze my writing and create a tone guide

Then paste 3-5 examples of your writing.

Claude will:
1. Analyze patterns
2. Extract signature style
3. Create custom tone guide
4. Save for reuse
```

### Option 3: Upload Guide

```
User: I have a tone-of-voice guide

Paste your existing guide or upload a file.

Claude will incorporate it into post creation.
```

## Platform-Specific Tips

### For LinkedIn:
- Front-load value in first 210 characters
- Use 3-5 hashtags at end
- End with engagement question
- Aim for 800-1500 characters
- Use line breaks aggressively

### For Twitter/X:
- Keep single tweets 100-200 chars
- Threads: 5-12 tweets optimal
- Number each tweet (1/10, 2/10)
- Link in final tweet only
- Engage in first 30 minutes

## Customization

### Add Your Own Tone Guides

1. Copy `tone/custom-guide.md` to `tone/[your-name]-custom.md`
2. Fill in your voice characteristics
3. Reference by name: "Write in [your-name] tone"

### Add Your Own Examples

1. Add to `examples/` directory
2. Follow existing format
3. Reference in posts: "Use examples from [file-name]"

## Advanced Usage

### Multi-Platform Posts

```
Write this as both a LinkedIn post and Twitter thread
```

Claude will create optimized versions for each platform.

### Series Creation

```
Create a 5-post LinkedIn series about [topic]
```

Claude will structure related posts with callbacks and progression.

### A/B Testing

```
Give me 3 hook variations for this post
```

Claude will provide alternatives to test.

## Troubleshooting

### Skill Not Found

If Claude doesn't recognize the skill:

```bash
# Verify installation
claude --plugin-dir /path/to/social-posts-plugin

# In Claude, ask:
What skills are available?
```

### Tone Not Matching

If the tone doesn't sound right:

1. Provide more examples of your writing
2. Be specific about what's off
3. Update your custom tone guide
4. Reference specific elements you want

### Posts Too Long/Short

Specify desired length:

```
Write a 500-character LinkedIn post...

Write a short Twitter thread (5 tweets)...
```

## Updates and Maintenance

### Updating the Plugin

```bash
cd /path/to/social-posts-plugin
git pull origin main
```

Changes take effect immediately (no restart needed).

### Contributing

This is an open-source project. Contributions welcome!

1. Fork the repository
2. Create a feature branch
3. Add your improvements
4. Submit a pull request

Ideas for contributions:
- Additional platform guides (Instagram, TikTok)
- More tone-of-voice examples
- Industry-specific writing guides
- Additional examples by type

## Credits and Attribution

### Frameworks and Sources

- **Core Writing Framework**: Inspired by top-performing social posts
- **Hooks & Structure**: Based on [Julian Shapiro's writing guide](https://www.julian.com/guide/write)
- **Storytelling Principles**: Adapted from MrBeast's content philosophy
- **Psychology Frameworks**: Inspired by Tej Dosa's marketing insights
- **LinkedIn Algorithm**: Current platform data and testing (Jan 2025)
- **FintechBrainfood Tone**: Example tone-of-voice (with attribution)

### Special Thanks

To the creators and writers who've shared their knowledge publicly, making frameworks like this possible.

## License

MIT License - See LICENSE file for details.

## Support

### Issues

Report bugs or request features: [GitHub Issues](https://github.com/simontaylor/social-posts-plugin/issues)

### Questions

For questions about usage:
- Check the examples in `examples/`
- Review the tone guides in `tone/`
- Ask Claude: "How do I use the social-posts skill for [X]?"

### Community

Share your results and tips:
- Tag posts with #ClaudeCodeSkills
- Share custom tone guides
- Contribute improvements

## Version History

### v1.0.0 (January 2025)
- Initial release
- LinkedIn and Twitter/X platforms
- 3 writing craft frameworks
- 2 tone-of-voice options
- Example library

## Roadmap

Potential future additions:
- [ ] Instagram optimization guide
- [ ] TikTok content strategies
- [ ] Video script frameworks
- [ ] Industry-specific variations
- [ ] Multi-language support
- [ ] A/B testing framework
- [ ] Analytics integration guides

---

**Ready to create better social posts? Install the plugin and start creating!**

```bash
git clone https://github.com/simontaylor/social-posts-plugin.git
claude --plugin-dir ./social-posts-plugin
```

Then in Claude Code:
```
Write me a LinkedIn post about [your topic]
```
