# Image Generation Guidelines

Guidelines for creating social media images when requested by the user.

---

## Default Specifications

### Aspect Ratio
**ALWAYS use landscape (16:9) orientation unless explicitly told otherwise**

- ✅ Landscape (16:9) - Default for LinkedIn and social media posts
- ❌ Portrait/vertical - Do NOT use unless specifically requested
- ❌ Square - Avoid unless user asks

**Why landscape:**
- LinkedIn optimizes for horizontal images in feed
- More screen real estate on desktop
- Better for data visualizations and multiple charts
- Professional business context

---

## Chart Combination Rules

### When Combining Multiple Charts/Images

**Preserve Original Content:**
- ✅ Keep original charts as intact as possible
- ✅ Maintain original logos, titles, and data labels
- ✅ Preserve color schemes and branding from source material
- ❌ Do NOT heavily redesign or recreate charts
- ❌ Do NOT remove original author attribution

**Layout:**
- Use grid layouts (2x2, 3x1, etc.) based on number of images
- Add subtle borders/dividers between sections if needed
- Keep backgrounds simple (white, light gray)
- Ensure all text remains clearly readable

**Example layouts:**
- 2 images: Side-by-side horizontal split
- 3 images: Top header + 2 bottom charts, OR 3 horizontal panels
- 4 images: 2x2 grid
- 5+ images: Contact sheet style or featured + thumbnails

---

## Attribution Requirements

### Author Credit
**Always preserve original author credits:**
- Keep source logos visible (e.g., Artemis, Bloomberg, etc.)
- Maintain "Source: [Company]" or "Data as of: [Date]" from originals
- Do NOT obscure or remove original attribution

### Fintech Brainfood Branding

**Logo Placement & Attribution:**
- ⚠️ CRITICAL: Use the ACTUAL logo file provided (`Brainfood logo landscape.png`)
- DO NOT generate, recreate, or redraw the logo - use the exact image file
- Logo design: pink pixelated brain + "FINTECH BRAINFOOD" text
- Logo file location: `~/Downloads/Brainfood logo landscape.png`

**Placement (Bottom Right - Editorial Credit):**
- Place logo in BOTTOM RIGHT corner (NOT top left)
- Size: SUPER SMALL - this is an editorial credit, not claiming authorship
- Format: "Edited by" text followed by small Fintech Brainfood logo
- Example: "Edited by [small logo]"
- Reasoning: Avoids looking like taking credit for source material (e.g., Artemis work)
- The source material logos should remain prominent; Fintech Brainfood logo is just a credit

**Typography for Attribution:**
- Font: DRUK Text Wide (bold, uppercase) OR Inter
- Style: Clean, professional, minimal, small
- Color: Black (#000000) on white backgrounds, White (#FFFFFF) on dark backgrounds
- Size: Small enough to be a credit, not a brand statement

**Official Brand Colors:**
- Black: #000000 RGB(0, 0, 0)
- Brain Pink: #E84B87 RGB(232, 75, 135)
- White: #FFFFFF RGB(255, 255, 255)
- Blue: #7ADDE0 RGB(122, 221, 224)
- Red: #FF4949 RGB(255, 73, 73)
- Yellow: #FBD85C RGB(251, 216, 92)
- Green: #0FA958 RGB(15, 169, 88)

**Typography Specifications:**
- Primary font: DRUK Text Wide (bold, uppercase for headers)
  - ⚠️ IMPORTANT: "DRUK Text Wide" is the FONT NAME, not content to display
  - Use this font STYLE for headers, but do NOT include the word "DRUK" in the actual text
- Alternative font: Inter
- Headers: 120% line height, -2% letter spacing
- Body text: 140% line height, 0% letter spacing

**Logo Variants Available:**
- Landscape logo with text (primary for composed images)
- Icon/mark only (for smaller spaces)
- White version (for dark backgrounds)
- Black version (for light backgrounds)

**Example title (top of image):**
```
CRYPTO CARDS: THE $18B MARKET
```

**Example bottom right attribution:**
```
Edited by [small Fintech Brainfood logo]
```

---

## Design Principles

### Professional Financial Aesthetic

**Style guidelines:**
- Clean, minimal design
- Let the data speak - avoid over-decoration
- Professional color palettes (blues, purples, greens)
- High contrast for readability
- Business/financial context (not consumer/playful)

**Typography:**
- Primary font: DRUK Text Wide (bold, uppercase for headers)
- Alternative font: Inter
- Headers: 120% line height, -2% letter spacing
- Body text: 140% line height, 0% letter spacing
- Ensure all text is legible at social media sizes
- Maintain hierarchy: title > labels > body text

**Colors:**
- Primary: White backgrounds (#FFFFFF)
- Text: Black (#000000)
- Accent: Brain Pink (#E84B87) from Fintech Brainfood logo
- Preserve original chart colors from source material
- Use clean, high-contrast color schemes

---

## Technical Specifications

### Resolution & Quality
- High resolution suitable for LinkedIn (minimum 1200px wide)
- Clear, crisp text at all sizes
- No compression artifacts on charts/graphs

### File Format
- PNG preferred (better for charts/graphs with text)
- RGB color space

---

## Workflow Checklist

Before generating an image, confirm:

- ✅ Aspect ratio is 16:9 landscape (unless told otherwise)
- ✅ Original charts will be preserved as much as possible
- ✅ Original author logos/credits are maintained
- ✅ "Edited by Fintech Brainfood" will be added to bottom right
- ✅ Layout accommodates all images clearly
- ✅ Text will remain readable at social media sizes
- ✅ Professional financial aesthetic

---

## Example Prompts

### Combining 4 Charts (2x2 Grid):
```
Create a professional landscape infographic (16:9 aspect ratio) combining these 4 charts into a 2x2 grid.

REQUIREMENTS:
- Landscape orientation (horizontal, NOT vertical)
- PRESERVE original charts - do NOT redesign them
- Keep all original logos and attribution visible

FINTECH BRAINFOOD ATTRIBUTION (bottom right only):
- CRITICAL: Use the ACTUAL Fintech Brainfood logo image file provided - do NOT recreate it
- Place logo in BOTTOM RIGHT corner - super small size (editorial credit only)
- Format: "Edited by" text followed by small Fintech Brainfood logo
- Example: "Edited by [small logo]"
- This is just a credit - source material logos (e.g., Artemis) should remain prominent
- Colors: White background (#FFFFFF), Black text (#000000)

TITLE (optional, top of image):
- Add headline at top if needed (e.g., "Crypto Cards: The $18B Market")
- Font STYLE: DRUK Text Wide (bold) or Inter
  - WARNING: "DRUK Text Wide" is the FONT NAME, NOT content to display
  - Do NOT include the word "DRUK" in any visible text
- Typography spacing: 120% line height, -2% letter spacing

DESIGN:
- Clean, minimal design - let charts be the focus
- All text must remain clearly readable
- 2x2 grid with simple borders between sections
```

### Combining 2 Charts (Side-by-Side):
```
Create a landscape (16:9) image combining these 2 charts side-by-side.

REQUIREMENTS:
- Landscape orientation
- Preserve original charts as much as possible
- Maintain original logos and source attribution
- Add "Edited by Fintech Brainfood" in bottom right corner
- Professional financial design
- Clean layout with optional center divider
```

### Single Chart Enhancement:
```
Take this chart and create a landscape (16:9) social media image.

REQUIREMENTS:
- Landscape orientation
- Keep the original chart intact
- Preserve original logo and attribution
- Add "Edited by Fintech Brainfood" in bottom right corner
- Optional: Add headline/context text if needed
- Professional, clean design
```

---

## Common Mistakes to Avoid

❌ **CRITICAL: Recreating the logo instead of using the actual file** - Always use the provided logo image, never generate a new one
❌ **CRITICAL: Confusing font names with content** - "DRUK Text Wide" is the FONT, not text to display
❌ **Using portrait/vertical orientation** - Always default to landscape
❌ **Over-designing** - Preserve original charts, don't recreate them
❌ **Removing source credits** - Always keep original attribution
❌ **Forgetting Fintech Brainfood credit** - Must be on every image
❌ **Poor text readability** - Ensure charts are large enough to read
❌ **Inconsistent branding** - Match the professional financial aesthetic
❌ **Wrong aspect ratio** - 16:9 landscape is the standard

### Real Example of Mistakes to Avoid:

**WRONG:**
- Title says "DRUK Cards: The $18B Market" ❌ (DRUK is the font name, not content!)
- Logo looks similar but was regenerated ❌ (must use actual logo file)
- Large Fintech Brainfood logo in top left ❌ (looks like taking credit for source work)

**CORRECT:**
- Title says "Crypto Cards: The $18B Market" ✅
- Uses the exact Fintech Brainfood logo image file provided ✅
- Font STYLE is DRUK Text Wide, but "DRUK" doesn't appear in content ✅
- Small logo in bottom right with "Edited by" text ✅ (just an editorial credit)

---

## User Preferences

**Remember these specific user requests:**
1. **Always landscape** - Never portrait unless explicitly asked
2. **Preserve originals** - Stick to the original images as much as possible
3. **Credit authors** - Keep their logos and attribution visible and prominent
4. **Fintech Brainfood attribution** - SUPER SMALL logo in bottom right corner only
   - Format: "Edited by" text + small Fintech Brainfood logo
   - Size: Small editorial credit, NOT a brand statement
   - Placement: Bottom right corner (NOT top left)
   - Reasoning: Avoids looking like taking credit for source material work

---

**When in doubt: Landscape orientation, preserve originals, source logos prominent, Fintech Brainfood small bottom-right credit.**
