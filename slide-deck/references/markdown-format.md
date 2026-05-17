# Structured Markdown Slide Format

This document defines the markdown format used by `build_deck.py` to generate PowerPoint slides.

## Document Structure

```markdown
---
title: Presentation Title
author: Author Name
date: 2026
theme: theme.json
---

# First Slide Title
...content...

---

# Second Slide Title
...content...
```

- **Frontmatter**: YAML block at the top with presentation metadata
- **Slide separator**: `---` (three dashes on their own line)
- Everything between separators is one slide

## Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `title` | Yes | Presentation title (used in file properties) |
| `author` | No | Author name |
| `date` | No | Year or date string |
| `theme` | No | Path to theme.json (relative to markdown file) |
| `title_image` | No | Path to image for the title slide |

## Slide Elements

### Slide Title

```markdown
# Slide Title
```

The first `#` heading in each slide block is the slide title. Modifiers go in brackets:

| Modifier | Effect |
|----------|--------|
| `[title]` | Title slide layout (split background, large type) |
| `[dark]` | Dark background with light text, centered |

Example: `# Welcome to My Talk [title]`

### Badge

```markdown
badge: SECTION NAME
```

A small category label displayed above the title. Automatically uppercased. Must appear on the line immediately after the title.

### Subtitle

```markdown
> This is the subtitle text
```

A blockquote immediately after the title (and badge, if present) becomes the subtitle — lighter, smaller text below the title.

### Cards (Sections)

```markdown
## Card Heading [green]
- First bullet point
- Second bullet point

## Another Card [warm]
- A bullet here
- And here
```

Each `##` heading creates a card. The `[color]` annotation sets the card's accent bar color, referencing a named color from the theme's `accents` map. Common names: `green`, `warm`, `red`, `dark`, `olive`.

**Layout is automatic based on card count:**
- 1 card → full width
- 2 cards → two columns, side by side
- 3 cards → three columns

**Modifiers:**
- `[color, full]` — Force a card to span the full width even when other cards exist. Full-width cards are placed below the column cards.

### Card Content

Inside a `##` card section, you can use:

**Bullet lists:**
```markdown
- First point
- Second point
  - Sub-point (indented with 2+ spaces)
```

**Bold emphasis:**
```markdown
**Important Text**
Regular description text below it
```
Bold text renders larger and in the heading color. Regular text renders in body style.

**Plain text:**
```markdown
Regular paragraph text within the card.
```

### Code Blocks

````markdown
```
code goes here
multiple lines
```
````

Code blocks render as a dark card with monospace font. When a code block appears alongside card sections, it becomes a separate card in the column layout.

### Callout / Takeaway Bar

```markdown
!> Key takeaway message for this slide.
```

A `!>` line creates a narrow card at the bottom of the slide with an accent bar, used for key takeaways. Text is rendered bold.

### Title Slide Metadata

These fields are only used on `[title]` slides:

```markdown
# My Presentation [title]
> Subtitle goes here
author: Kai Lee
date: 2026
image: robot.png
```

- `author:` — Name displayed on the title slide
- `date:` — Year/date displayed below the author
- `image:` — Path to an image placed on the right panel

If not specified on the title slide, values fall back to the frontmatter.

### Dark / Closing Slides

```markdown
# Q&A [dark]
> Author Name
```

Dark slides use the theme's dark background color with centered, large white text. The subtitle appears below in muted color.

## Complete Example

```markdown
---
title: Agentic Coding
author: Kai Lee
date: 2026
theme: theme.json
---

# Agentic Coding [title]
> Practical patterns for working with AI coding agents
image: robot.png

---

# What is Agentic Coding?
badge: Definitions
> Think of it as pair programming with AI — you navigate, the agent drives.

## What it is [green]
- You care how it works. You review the plan. You own the output.
- The agent is a force multiplier for your existing skills
- Code written by your agent is still your code

## What it isn't [warm]
- This is NOT vibe coding ("make it work, I don't care how")
- You don't hand off judgment — you delegate execution

---

# The Process Hasn't Changed
badge: Process

## The checklist [green]
- Plan before writing code
- Write tests: unit, edge cases, integration
- Make small, incremental changes
- Code review every change

## Your new role [warm]
- Think about how you'd approach it yourself
- Direct the agent through each stage
- Validate at each checkpoint

!> The process is the same. The executor changed.

---

# Git Worktrees
badge: Tooling
> Run multiple agents in parallel without branch conflicts.

## Why worktrees over cloning [green]
- Multiple working directories from one repo
- Shares git object store — faster, less disk
- One agent per worktree = true parallelism

```
git worktree add \
  ../myproject-feature-x feature-x
```

---

# Q&A [dark]
> Kai Lee
```

## Parsing Rules Summary

1. Split document by `---` lines (skip frontmatter block)
2. First `#` line is the slide title; extract `[modifiers]`
3. `badge:` line immediately after title
4. `>` lines after title/badge are subtitle
5. `##` headings start card sections; extract `[color, modifiers]`
6. Within cards: `- ` = bullet, `**text**` = bold, else = body text
7. Fenced code blocks = code cards
8. `!>` lines = callout/takeaway bar
9. `author:`, `date:`, `image:` lines = metadata (title slides)
