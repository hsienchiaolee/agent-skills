# Theme JSON Schema

The theme file captures a complete design system extracted from a reference deck or defined manually. All measurements are in inches unless noted.

## Schema

```json
{
  "meta": {
    "name": "string — theme name",
    "source": "string — reference file it was extracted from (optional)",
    "slide_width": 13.333,
    "slide_height": 7.5
  },

  "colors": {
    "background": {
      "light": "#FFFFFF — default slide background",
      "dark": "#1B3A4B — dark slide/panel background"
    },
    "text": {
      "heading": "#2D3436 — slide titles and card headings",
      "body": "#5F6B6D — body text and bullets",
      "muted": "#8B9598 — secondary/caption text",
      "on_dark": "#FFFFFF — text on dark backgrounds"
    },
    "accents": {
      "green": "#3D7B6F",
      "warm": "#C4956A",
      "red": "#C17B7B",
      "dark": "#1B3A4B",
      "olive": "#8B9A6B"
    },
    "card": {
      "background": "#EEF4F2 — card fill color",
      "code_background": "#1B3A4B — code block background",
      "code_text": "#CDD6F4 — code block text color"
    },
    "semantic": {
      "positive": "green — accent name for positive/good/do-this",
      "contrast": "warm — accent name for contrast/alternative/other-side",
      "negative": "red — accent name for negative/warning/avoid",
      "neutral": "dark — accent name for neutral/informational"
    }
  },

  "typography": {
    "heading_font": "Arial",
    "body_font": "Arial",
    "mono_font": "Courier New",
    "scale": {
      "hero_title": 44,
      "slide_title": 24,
      "card_title": 16,
      "subtitle": 15,
      "body": 13,
      "small": 12,
      "caption": 11,
      "badge": 9,
      "code": 11
    }
  },

  "layout": {
    "margin": {
      "left": 0.8,
      "right": 0.8,
      "top": 0.4,
      "bottom": 0.4
    },
    "content_top": 1.3,
    "card_gap": 0.3,
    "card_padding": 0.4,
    "badge_position": [0.8, 0.15],
    "subtitle_top": 1.2
  },

  "components": {
    "card": {
      "corner_radius": 0.02,
      "accent_bar": true,
      "accent_bar_height": 0.06,
      "border": false,
      "shadow": false
    },
    "bullet": {
      "character": "•",
      "spacing_pt": 10,
      "sub_character": "›",
      "sub_indent_spaces": 4
    },
    "callout": {
      "height": 0.6,
      "accent": "dark",
      "bold": true,
      "font_size": 12,
      "bottom_margin": 0.4
    },
    "badge": {
      "uppercase": true,
      "bold": true,
      "color": "green"
    },
    "code_block": {
      "padding": 0.3,
      "line_spacing_pt": 2
    }
  },

  "slide_patterns": {
    "title": {
      "split_position": 6.8,
      "left_bg": "light",
      "right_bg": "dark",
      "title_size": 44,
      "image_area": {
        "left": 8.5,
        "top": 2.5,
        "size": 1.0
      }
    },
    "closing": {
      "background": "dark",
      "title_size": 56,
      "centered": true
    }
  }
}
```

## Color Names

The `accents` map defines named colors referenced throughout the markdown and theme. The names are arbitrary — the markdown `[green]` annotation looks up `accents.green` in the theme. A theme can define any accent names it wants.

The `semantic` map assigns meaning to accent names, helping the content drafter choose appropriate colors:
- **positive**: For things that are good, recommended, or correct
- **contrast**: For the alternative perspective, trade-offs, or complementary info
- **negative**: For warnings, anti-patterns, or things to avoid
- **neutral**: For informational/factual content without a positive/negative valence

## Spacing and Positioning

All spacing values are in inches. The builder calculates absolute positions from these:

- `margin.left` + `margin.right` define the content area width
- `content_top` is where cards start (below title + subtitle)
- `card_gap` is horizontal space between side-by-side cards
- `card_padding` is internal padding within cards (text inset from card edges)

## Extending the Theme

The theme is designed to be extended. If the reference deck has elements not covered by the base schema (e.g., gradient backgrounds, custom shapes), add them under a custom key and handle them in a project-specific build script.
