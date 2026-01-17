#!/bin/bash

# Nano Banana API Image Generation Script
# Automatically generates prompts and creates visuals based on hook type

set -e

# Configuration
PROFILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_DIR="$PROFILE_DIR/generated-visuals"
NANO_BANANA_API="${NANO_BANANA_API_URL:-http://localhost:8000}"  # Set via env var

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to determine visual format from hook type
determine_visual_format() {
    local hook_type="$1"

    case "$hook_type" in
        "person-focused"|"1")
            echo "quote-over-face"
            ;;
        "finally-moment"|"3"|"13")
            echo "before-after-comparison"
            ;;
        "dollar-amount"|"2"|"11")
            echo "person-dollar-overlay"
            ;;
        "stakes-first"|"9")
            echo "venn-diagram"
            ;;
        "action-verbs"|"12")
            echo "flow-diagram"
            ;;
        "multiple-examples"|"pattern")
            echo "timeline-grid"
            ;;
        *)
            echo "generic-visual"
            ;;
    esac
}

# Function to generate prompt for nano banana API
generate_prompt() {
    local format="$1"
    local story_details="$2"

    case "$format" in
        "quote-over-face")
            cat <<EOF
Create a professional LinkedIn post image:
- Style: McKinsey-style quote over face
- Layout: Professional headshot (60%) + quote overlay (40%)
- Colors: High contrast, professional palette
- Typography: Sans-serif, 48-72pt for quote
- Format: 1200x628px landscape

Story: $story_details

Requirements:
- Text must be readable on mobile
- Professional business aesthetic
- Clean, minimalist design
EOF
            ;;

        "before-after-comparison")
            cat <<EOF
Create a side-by-side comparison image:
- Style: Before/After or Old Way/New Way
- Layout: Two equal panels with clear divider
- Colors: Contrasting sides (left muted, right vibrant)
- Typography: Headers for each side
- Format: 1200x628px landscape

Story: $story_details

Requirements:
- Clear visual distinction between sides
- Labels/headers easy to read
- Professional, clean design
EOF
            ;;

        "person-dollar-overlay")
            cat <<EOF
Create a visual with person + dollar amount:
- Style: Celebrity/person as hero image
- Layout: Person photo (large) + dollar amount overlay (huge)
- Colors: Bold, high contrast for dollar amount
- Typography: 120-180pt for dollar amount
- Format: 1200x1200px square

Story: $story_details

Requirements:
- Person must be recognizable (celebrity > company)
- Dollar amount must dominate
- Context text smaller but readable
- Professional but eye-catching
EOF
            ;;

        "venn-diagram")
            cat <<EOF
Create a Venn diagram showing convergence:
- Style: Two overlapping circles
- Layout: Circle 1 (Industry A) + Circle 2 (Industry B) + Overlap
- Colors: Semi-transparent circles, highlighted overlap
- Typography: Clean labels for each section
- Format: 1200x1200px square

Story: $story_details

Requirements:
- Overlap area clearly highlighted
- Icons or logos in each circle
- Professional, simple design
EOF
            ;;

        "timeline-grid")
            cat <<EOF
Create a timeline or comparison grid:
- Style: 3x3 or 2x2 grid with consistent cells
- Layout: Equal-sized cells, even spacing
- Colors: Consistent background, alternating highlights
- Typography: Same font/size per cell
- Format: 1200x1200px square

Story: $story_details

Requirements:
- Each cell has: Icon/logo + Text + Date
- Consistent formatting across all cells
- Professional grid system
EOF
            ;;

        *)
            cat <<EOF
Create a professional social media image:
- Style: Clean, professional, business-appropriate
- Layout: Centered content, balanced composition
- Colors: Professional palette, high contrast
- Typography: Readable, modern sans-serif
- Format: 1200x628px landscape

Story: $story_details

Requirements:
- Eye-catching but professional
- Mobile-readable text
- Clear focal point
EOF
            ;;
    esac
}

# Function to call nano banana API
call_nano_banana_api() {
    local prompt="$1"
    local output_file="$2"

    echo "🎨 Generating image with nano banana API..."
    echo ""
    echo "Prompt:"
    echo "$prompt"
    echo ""

    # Call nano banana API
    # Adjust based on actual API format
    local api_response
    api_response=$(curl -s -X POST "$NANO_BANANA_API/generate" \
        -H "Content-Type: application/json" \
        -d "{\"prompt\": $(echo "$prompt" | jq -Rs .)}" \
        2>&1)

    if [ $? -eq 0 ]; then
        # Extract image URL or base64 from response
        # Adjust based on actual API response format
        local image_url
        image_url=$(echo "$api_response" | jq -r '.image_url // .url // .output_url')

        if [ "$image_url" != "null" ] && [ -n "$image_url" ]; then
            # Download image
            curl -s -o "$output_file" "$image_url"
            echo "✅ Image generated: $output_file"
            return 0
        else
            echo "⚠️  API response didn't contain image URL"
            echo "Response: $api_response"
            return 1
        fi
    else
        echo "❌ Failed to call nano banana API"
        echo "Error: $api_response"
        return 1
    fi
}

# Function to create composite image (fallback if API unavailable)
create_fallback_composite() {
    local format="$1"
    local output_file="$2"
    local person_image="$3"
    local text="$4"

    echo "🎨 Creating composite image (fallback)..."

    # Use ImageMagick to create simple composite
    # This requires ImageMagick to be installed
    if command -v convert &> /dev/null; then
        # Simple text overlay example
        convert -size 1200x628 xc:white \
            -font Arial -pointsize 72 -fill black \
            -gravity center -annotate +0+0 "$text" \
            "$output_file"

        echo "✅ Fallback image created: $output_file"
        return 0
    else
        echo "⚠️  ImageMagick not installed, cannot create fallback"
        echo "   Install with: sudo apt-get install imagemagick"
        return 1
    fi
}

# Main function
main() {
    local hook_type="${1:-person-focused}"
    local story_details="${2:-Default story details}"
    local output_filename="${3:-generated-$(date +%Y%m%d-%H%M%S).png}"

    echo "=================================="
    echo "   Visual Generation (Nano Banana)"
    echo "=================================="
    echo ""
    echo "Hook Type: $hook_type"
    echo "Output: $OUTPUT_DIR/$output_filename"
    echo ""

    # Determine visual format
    local visual_format
    visual_format=$(determine_visual_format "$hook_type")
    echo "Visual Format: $visual_format"
    echo ""

    # Generate prompt
    local prompt
    prompt=$(generate_prompt "$visual_format" "$story_details")

    # Call API or create fallback
    local output_path="$OUTPUT_DIR/$output_filename"

    if [ -n "$NANO_BANANA_API_URL" ]; then
        # Use nano banana API
        call_nano_banana_api "$prompt" "$output_path"
    else
        echo "⚠️  NANO_BANANA_API_URL not set, using fallback..."
        create_fallback_composite "$visual_format" "$output_path" "" "$story_details"
    fi

    echo ""
    echo "✅ Visual generation complete!"
    echo ""
    echo "Next steps:"
    echo "1. Review generated image: $output_path"
    echo "2. Edit if needed (Canva, Figma)"
    echo "3. Add to post"
    echo ""
}

# Usage help
show_usage() {
    cat <<EOF
Usage: $0 <hook-type> <story-details> [output-filename]

Hook Types:
  person-focused, 1         Quote over face format
  finally-moment, 3, 13     Before/after comparison
  dollar-amount, 2, 11      Person + dollar overlay
  stakes-first, 9           Venn diagram
  action-verbs, 12          Flow diagram
  multiple-examples         Timeline grid

Example:
  $0 person-focused "MrBeast gets \$200M investment" mrbeast-investment.png

Environment Variables:
  NANO_BANANA_API_URL       Nano Banana API endpoint (default: http://localhost:8000)

EOF
}

# Parse arguments
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    show_usage
    exit 0
fi

# Run main function
main "$@"
