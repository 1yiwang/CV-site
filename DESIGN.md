---
name: Precision & Clarity
colors:
  surface: '#f7fafc'
  surface-dim: '#d7dadc'
  surface-bright: '#f7fafc'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f1f4f6'
  surface-container: '#ebeef0'
  surface-container-high: '#e5e9eb'
  surface-container-highest: '#e0e3e5'
  on-surface: '#181c1e'
  on-surface-variant: '#43474c'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eef1f3'
  outline: '#74777d'
  outline-variant: '#c3c7cc'
  surface-tint: '#4e6072'
  primary: '#021525'
  on-primary: '#ffffff'
  primary-container: '#172a3a'
  on-primary-container: '#7e91a5'
  inverse-primary: '#b5c9de'
  secondary: '#595e6e'
  on-secondary: '#ffffff'
  secondary-container: '#dbdff2'
  on-secondary-container: '#5d6272'
  tertiary: '#001232'
  on-tertiary: '#ffffff'
  tertiary-container: '#002659'
  on-tertiary-container: '#478cff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d1e5fa'
  primary-fixed-dim: '#b5c9de'
  on-primary-fixed: '#091d2d'
  on-primary-fixed-variant: '#36495a'
  secondary-fixed: '#dee2f5'
  secondary-fixed-dim: '#c1c6d8'
  on-secondary-fixed: '#161b29'
  on-secondary-fixed-variant: '#414656'
  tertiary-fixed: '#d8e2ff'
  tertiary-fixed-dim: '#adc6ff'
  on-tertiary-fixed: '#001a41'
  on-tertiary-fixed-variant: '#004493'
  background: '#f7fafc'
  on-background: '#181c1e'
  surface-variant: '#e0e3e5'
  electric-blue: '#007AFF'
  slate-gray: '#767676'
  surface-white: '#FFFFFF'
  border-subtle: '#CDCDCD'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 64px
    fontWeight: '700'
    lineHeight: 72px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Inter
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-mono:
    fontFamily: JetBrains Mono
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.05em
  caption:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  unit: 8px
  gutter: 24px
  margin-mobile: 20px
  margin-desktop: 80px
  max-width: 1280px
---

## Brand & Style

This design system blends the structural integrity of Swiss International Style with the functional clarity of modern tech interfaces. It is designed for a personal resume portfolio that seeks to project high-level professionalism, technical competence, and meticulous attention to detail.

The aesthetic is **Modern Corporate Minimalism**. It prioritizes content through a strict "less is more" philosophy, utilizing ample whitespace, a disciplined grid, and a high-contrast palette. The emotional response is one of trust, efficiency, and sophisticated modernity. Key attributes include:
- **Mathematical Precision:** Every element sits on a strict baseline and column grid.
- **Functional Decoration:** Aesthetics are derived from layout and type rather than ornamental graphics.
- **Architectural Depth:** Using subtle tonal layering rather than heavy shadows to create a sense of organized information hierarchy.

## Colors

The palette is anchored in a professional **Deep Navy Blue**, providing a foundation of authority and stability. The background strategy uses **Pure White** for primary surfaces and **Pale Gray-Blue** for section grounding, ensuring high legibility and a "breathable" interface.

**Electric Blue** is used sparingly as a functional accent for interactive states (hovers, links) and status indicators, preventing the design from feeling static. Grays are pulled from the Swiss Re and UBS influence to provide neutral steps for metadata and borders without introducing warmth that would break the "cool" corporate vibe.

## Typography

The system utilizes **Inter** for its neutral, highly legible, and "tech-adjacent" character. To lean into the Swiss influence, tight tracking is used on display headings.

- **Contrast:** High contrast between heavy bold weights for headers and regular weights for body text.
- **Functional Accents:** **JetBrains Mono** is introduced for small labels, dates in the timeline, and technical skills to reinforce the "Minimalist Tech" narrative.
- **Alignment:** All text must be left-aligned (ragged right) to maintain the clean, asymmetrical balance characteristic of Swiss design.

## Layout & Spacing

This design system uses a **Fixed-Fluid Hybrid Grid**. Content is constrained to a 12-column grid with a maximum width of 1280px for readability, centered on the screen.

- **Bento Grid:** Project sections utilize a "Bento" style layout—blocks of varying sizes (spanning 4, 6, or 8 columns) that fit together with uniform 24px gutters.
- **Vertical Timeline:** The Experience section uses a strict vertical axis. Content is indented from a left-aligned hairline stroke.
- **Responsive Behavior:** 
  - **Desktop:** 12 columns, 80px side margins.
  - **Tablet:** 8 columns, 40px side margins.
  - **Mobile:** 4 columns, 20px side margins. Bento grids reflow into a single-column stack.

## Elevation & Depth

To maintain the "Modern Swiss" vibe, the design system avoids heavy shadows in favor of **Tonal Layers** and **Low-Contrast Outlines**.

- **Surfaces:** The main page body is `#FFFFFF`. Section containers or Bento cards use `#F4F7F9` to create subtle separation.
- **Borders:** Instead of shadows, use 1px solid borders in `#CDCDCD` for card elements.
- **Interactive Depth:** Only interactive elements (cards, buttons) receive a shadow on hover. Use an "Ambient Shadow": `0px 10px 30px rgba(23, 42, 58, 0.08)`. This creates a sophisticated "lift" without the UI feeling heavy or dated.
- **Sticky Header:** Uses a Backdrop Blur (`blur(12px)`) with a 90% opaque `#FFFFFF` fill to provide a modern, glass-like transition over content.

## Shapes

The shape language is **Sharp and Disciplined**. Rounded corners are kept to a minimum (`0.25rem`) to maintain a serious corporate tone while preventing the UI from feeling "aggressive" or "brutalist."

- **Cards/Bento Blocks:** `rounded-sm` (4px).
- **Buttons:** `rounded-sm` (4px) for a crisp, buttoned-up appearance.
- **Tags/Chips:** `rounded-full` (Pill-shaped) to provide a soft visual contrast against the otherwise rectangular grid.

## Components

### Buttons
- **Primary:** Solid `#172A3A` with White text. No border. On hover, background shifts to `#007AFF`.
- **Secondary:** Transparent background with `#172A3A` 1px border.
- **States:** Transition duration is a crisp `150ms`.

### Bento Cards
- Used for portfolio projects. Feature a `#F4F7F9` background and a subtle `1px` border. Images should be clipped to the container with no inner padding.

### Vertical Timeline
- A 2px solid line in `#172A3A` runs vertically. Each entry features a `#FFFFFF` circle node with a 2px Deep Navy border. Date labels use the `label-mono` type style.

### Input Fields
- Underlined style (Swiss influence) or fully boxed with a `#CDCDCD` border. Focus state uses a `2px` bottom border in `#007AFF`.

### Navigation
- Sticky header. Links use `caption` styling. Active state is indicated by a 2px horizontal bar `4px` above the text, rather than a traditional underline.