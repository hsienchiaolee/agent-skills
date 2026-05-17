---
name: slide-deck
description: Build polished PowerPoint presentations from structured markdown with extracted design themes. Use this skill whenever the user wants to create a slide deck, presentation, or PPTX — whether from scratch, from an outline, or by restyling existing content. Also use when the user wants to extract a design theme from an existing presentation, convert markdown notes to slides, or iterate on slide content and layout. Triggers on phrases like "make a presentation", "build slides", "create a deck", "PowerPoint", "slide deck", "extract theme", "restyle these slides", "presentation about X", "turn this into slides".
---

# Slide Deck Builder

Build professional presentations through a structured workflow: establish a design theme, draft content as reviewable markdown, then generate a polished PPTX. The user reviews and edits the markdown content without regenerating the PowerPoint each time.

## Prerequisites

The build scripts require `python-pptx`. Find a Python environment that has it, following this priority:

1. **Existing virtualenv**: Look for `.venv/bin/python`, `venv/bin/python`, or any `.venv-*/bin/python` in the project directory. Test with `<path>/bin/python -c "import pptx"`. If it works, use it.
2. **Managed Python**: If the project uses a Python manager (check for `.mise.toml`, `uv.lock`, `.python-version`, `pyproject.toml`), test with `python -c "import pptx"` first. If not installed, use that tool to add it (e.g. `uv pip install python-pptx`, `mise exec -- pip install python-pptx`).
3. **Create a virtualenv**: If nothing above applies, create one and install:
   ```bash
   python3 -m venv .venv && .venv/bin/pip install python-pptx
   ```

Use whichever Python has `python-pptx` available for all script invocations below.

## Workflow

### Phase 1: Establish the Theme

The theme captures the full design system: colors, typography, layout, spacing, component styles, and slide patterns. There are three ways to get one:

**Option A: Extract from a reference deck**

When the user provides an existing PPTX to match:

```bash
python <skill-path>/scripts/extract_theme.py <reference.pptx> -o theme.json
```

This analyzes every slide and extracts:
- **Color palette**: backgrounds, text colors, accent colors, and how they're used semantically (positive/negative/neutral/contrast)
- **Typography**: font families, the full size scale from badge to title, weight patterns
- **Layout grid**: margins, card gaps, content start position, column arrangements
- **Component styles**: card corner radius, accent bar dimensions, border/shadow treatments, badge formatting, bullet character and spacing, callout bar style
- **Slide pattern templates**: title slide layout (split backgrounds, image placement), content slide structure, closing slide style
- **Visual hierarchy**: how the deck communicates importance through size, weight, color, and position
- **Spacing rhythm**: the consistent spacing intervals used between elements

Review the generated `theme.json` with the user. They may want to adjust colors or fonts. Read `references/theme-schema.md` for the full schema.

**Option B: Create from user preferences**

If the user describes a style ("clean and minimal", "dark with green accents"), create a `theme.json` by hand. Read `references/theme-schema.md` for the schema, then fill in values that match their description. Start from the default theme at `<skill-path>/references/default-theme.json` and modify it.

**Option C: Use the default theme**

If the user has no preference, use `<skill-path>/references/default-theme.json` directly. It's a clean professional theme with a teal/warm accent palette.

### Phase 2: Draft Content as Markdown

Write the slide content into a structured markdown file. This is the key iteration artifact — the user reviews, edits, and approves content here without touching PowerPoint.

**How to draft:**
1. Understand the topic from the user's input (outline, notes, topic description)
2. Write slides in the structured markdown format (read `references/markdown-format.md` for the full spec)
3. Save as `slides.md` (or whatever name makes sense)
4. Present it to the user for review

**Quick format reference** (see `references/markdown-format.md` for complete spec):

```markdown
---
title: Presentation Title
author: Author Name
date: 2026
theme: theme.json
---

# Opening Slide [title]
> Subtitle describing the talk
image: logo.png

---

# Content Slide Title
badge: SECTION NAME
> Brief description under the title

## Left Card Heading [green]
- First point
- Second point
- Third point

## Right Card Heading [warm]
- Another point
- And another

!> Key takeaway message for this slide.

---

# Closing [dark]
> Author Name
```

**Content guidelines:**
- Each slide should make one clear point
- Bullet points should be concise — the deck is a visual aid, not a document
- Use 2-3 cards per slide for comparison/contrast layouts
- Put the most important takeaway in the `!>` callout bar
- Badge text categorizes the slide (e.g., "PROCESS", "TOOLING", "EXPERIENCE")
- Balance information density — too sparse wastes slides, too dense loses the audience

**Iteration loop:**
- Present the markdown to the user
- They edit directly or give feedback
- Revise until they approve
- Only then proceed to Phase 3

### Phase 3: Build the PPTX

Convert the approved markdown + theme into a PowerPoint file:

```bash
python <skill-path>/scripts/build_deck.py slides.md --theme theme.json -o presentation.pptx
```

If `--theme` is omitted, it uses the theme path from the markdown frontmatter, falling back to the default theme.

After building, tell the user where the file is so they can open it and check the visual output. If they want changes:
- **Content changes**: Edit the markdown, rebuild
- **Layout tweaks**: Adjust theme.json values (spacing, sizes), rebuild
- **Design changes**: Modify theme colors/fonts, rebuild

## Slide Layout Rules

The builder automatically determines layout from the markdown structure:

| Structure | Layout |
|-----------|--------|
| `# Title [title]` | Split-background title slide |
| 1 `##` section | Full-width card |
| 2 `##` sections | Two-column cards |
| 3 `##` sections | Three-column cards |
| `## Heading [full]` | Full-width card on bottom row (columns above) |
| `##` section + code fence | Card beside code block |
| `# Title [dark]` | Dark background, centered |
| `!> text` | Callout bar at slide bottom |

Use `[full]` when you want a 2-top + 1-bottom layout: mark the bottom card with `[full, color]`. Multiple modifiers combine: `## Title [full, dark]`.

Cards inherit their accent color from the `[color]` annotation on the `##` heading. Available color names depend on the theme's `accents` map.

## Adapting to Different Presentation Styles

The skill handles various deck styles through the theme system:

- **Corporate/minimal**: Light backgrounds, subtle accent bars, clean typography
- **Technical/developer**: Dark code blocks, monospace fonts, high contrast
- **Creative/bold**: Strong accent colors, larger type, more visual weight

When extracting from a reference deck, the theme captures whatever style it finds. When creating from scratch, ask the user about their audience and context to choose appropriate styling.

## File Organization

Keep generated files organized in the project directory:
```
project/
  theme.json           # Design theme (extracted or custom)
  slides.md            # Slide content (the editable source)
  presentation.pptx    # Generated output
  assets/              # Images, icons referenced by slides
```
