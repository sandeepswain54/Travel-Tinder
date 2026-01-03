# 🎨 TRAVEL TINDER - VISUAL DESIGN & BRANDING GUIDE

## Brand Identity

### Logo & Colors
```
🔥 Brand Name: Travel Tinder
🎨 Tagline: "Connect with Fellow Adventurers"
🌍 Mission: Safer, smarter travel through community
```

### Color Palette

#### Primary Colors
```
🔴 Primary Red:    #FF6B6B
   Usage: CTAs, Action buttons, Highlights, Primary elements
   Hex: FF6B6B | RGB: 255, 107, 107
   
🔵 Secondary Cyan: #4ECDC4
   Usage: Verification badges, Secondary actions, Accents
   Hex: 4ECDC4 | RGB: 78, 205, 196
```

#### Status Colors
```
🟢 Success:        #27AE60 (Green)    - Positive feedback, Approved
🟠 Warning:        #F39C12 (Orange)   - Cautions, Alerts
🔴 Error:          #E74C3C (Red)      - Errors, Destructive
🔵 Info:           #3498DB (Blue)     - Informational messages
```

#### Neutral Colors
```
⚪ Light BG:       #FAFAFA            - Page background
⚪ Card BG:        #FFFFFF            - Card backgrounds
⚫ Dark Text:      #2C3E50            - Main text
🔘 Light Text:     #95A5A6            - Secondary text
🔲 Borders:        #E8E8E8            - Dividers & borders
```

---

## Typography

### Font Families

#### 1. Playfair Display (Headers)
```
Weight: Bold (700)
Usage: Page titles, major headings
Sizes: 28px, 32px
Elegance: High
Personality: Sophisticated, Premium
```

**Examples:**
- "Ready for an Adventure?" (32px)
- "Travel Matches" (28px)
- "Discover Trips" (24px)

#### 2. Poppins (Body Text)
```
Weights: Regular (400), SemiBold (600), Bold (700)
Usage: Everything else - body, buttons, labels
Sizes: 12px, 14px, 16px, 18px, 20px
Personality: Modern, Friendly, Clean
```

**Examples:**
- Body text (16px)
- Section titles (18px, Bold)
- Captions (12px, Regular)

### Text Hierarchy

```
Level 1: Playfair Display, 32px, Bold  → Page Titles
         Color: #2C3E50
         
Level 2: Playfair Display, 28px, Bold  → Section Headers
         Color: #2C3E50
         
Level 3: Poppins, 20px, Bold           → Subsection Titles
         Color: #2C3E50
         
Level 4: Poppins, 18px, SemiBold       → Card Titles
         Color: #2C3E50
         
Level 5: Poppins, 16px, Regular        → Body Text
         Color: #2C3E50
         
Level 6: Poppins, 14px, Regular        → Secondary Text
         Color: #95A5A6
         
Level 7: Poppins, 12px, Regular        → Captions
         Color: #95A5A6
```

---

## Spacing System

### 5-Step Scale

```
┌─────────┬────────┬─────────────────────────┐
│ Size    │ Value  │ Usage                   │
├─────────┼────────┼─────────────────────────┤
│ XS      │ 4px    │ Minimal, tight elements │
│ SM      │ 8px    │ Small gaps, padding     │
│ MD      │ 16px   │ Default padding/margin  │
│ LG      │ 24px   │ Large sections          │
│ XL      │ 32px   │ Major breaks            │
└─────────┴────────┴─────────────────────────┘
```

### Application Examples

```
Button Padding:        MD horizontal, SM vertical  (16px × 8px)
Card Padding:          MD (16px all around)
Section Padding:       LG (24px) top/bottom
Page Padding:          MD (16px) sides
Item Gap in List:      MD (16px)
Component Gap:         SM (8px) - LG (24px)
```

---

## Border Radius System

### 4-Step Scale

```
┌──────────┬────────┬────────────────────────┐
│ Size     │ Value  │ Usage                  │
├──────────┼────────┼────────────────────────┤
│ Small    │ 8px    │ Chips, small buttons   │
│ Medium   │ 12px   │ Regular buttons, inputs│
│ Large    │ 16px   │ Cards, major components│
│ XLarge   │ 20px   │ Profile cards, dialogs │
└──────────┴────────┴────────────────────────┘
```

### Application Examples

```
Input Fields:          Medium (12px)
Buttons:               Medium (12px)
Chips/Tags:            Small (8px)
Regular Cards:         Large (16px)
Profile Cards:         XLarge (20px)
Dialog Boxes:          Large (16px)
Bottom Sheets:         Top corners XLarge, bottom rounded
```

---

## Component Design Specifications

### Cards

#### Trip Card
```
Dimensions: 280px width (in carousel), 300px height
Radius: 16px (Large)
Shadow: elevation: 2
Content:
  - Image: 200px height (top)
  - Padding: 16px (MD)
  - Title: 18px Bold, #2C3E50
  - Destination: 14px, #95A5A6
  - Budget: 18px Bold, #FF6B6B
  - Rating Badge: Top-right, #000 with opacity
```

#### Profile Card
```
Dimensions: Match viewport width - 32px padding
Radius: 20px (XLarge)
Shadow: elevation: 2-4
Content:
  - Full image background
  - Gradient overlay (bottom)
  - Name: 26px Bold, White
  - Location: 14px, White70
  - Bio: 14px, White
  - Tags: 12px, White with opacity background
```

#### Group Card
```
Dimensions: Full width - 32px padding
Radius: 16px (Large)
Content:
  - Image: 200px height
  - Padding: 16px (MD)
  - Member count badge: Right corner
  - Action buttons: Bottom, full width row
```

### Buttons

#### Elevated Button
```
Background: #FF6B6B (Primary)
Text: White, Bold
Padding: 16px horizontal, 12px vertical
Radius: 12px (Medium)
Height: 48px minimum
States:
  - Default: #FF6B6B
  - Hovered: #E63946
  - Pressed: #E63946 (darker)
  - Disabled: #BDC3C7 (gray)
```

#### Outlined Button
```
Border: 1px, #FF6B6B
Text: #FF6B6B, Bold
Background: Transparent
Padding: 16px horizontal, 12px vertical
Radius: 12px (Medium)
States:
  - Default: Transparent background
  - Hovered: #FF6B6B with opacity background
  - Pressed: #FF6B6B with opacity background
```

#### Icon Button
```
Background: Circular
Size: 48px, 56px, or 64px
Icon: 24px, 28px, or 32px
Color: #FF6B6B (primary color)
Ripple: Circle around button
```

#### Action Buttons (Swipe Screen)
```
FloatingActionButton Style
Sizes:
  - ❌ Skip (Red #E74C3C)
  - ⭐ SuperLike (Orange #F39C12)
  - ❤️ Like (Red #FF6B6B)
Diameter: 60px
Icon: 32px White
Shadow: elevation: 4
```

### Inputs

#### Text Field
```
Background: #F5F5F5
Border: 1px #E8E8E8
Focus Border: 2px #FF6B6B
Radius: 12px (Medium)
Padding: 16px (MD)
Height: 48px
Hint: #95A5A6
Text: #2C3E50
```

#### Chip/Tag
```
Background: Primary color with opacity (0.1)
Text: Primary color
Border: Optional 1px primary
Padding: 4px horizontal, 8px vertical
Radius: 8px (Small)
Height: 32px minimum
```

---

## Layout Specifications

### Safe Areas & Padding

```
Screen Edges:          16px (MD) padding all around
List Items:            16px (MD) horizontal padding
Card Content:          16px (MD) internal padding
Top/Bottom Sections:   24px (LG) vertical spacing
```

### Bottom Navigation Bar

```
Height: 56px
Background: #FFFFFF
Border Top: 1px #E8E8E8
Item Padding: 8px vertical, 12px horizontal
Icon Size: 24px
Label Size: 12px
Active Color: #FF6B6B
Inactive Color: #95A5A6
```

### AppBar

```
Height: 56px
Background: #FFFFFF
Shadow: elevation: 0
Padding: 16px (MD)
Title: Playfair, 24px Bold, #2C3E50
Actions: Icon buttons on right
Status Bar: Light (dark text)
```

---

## States & Interactions

### Button States

```
Normal:    Background: #FF6B6B,  Text: White
Hovered:   Background: #E63946,  Text: White
Pressed:   Background: #C81828,  Text: White
Disabled:  Background: #BDC3C7,  Text: #7F8C8D

Loading:   Spinner icon,         Text hidden
           Spinner Color: White
           Animation: Continuous rotation
```

### Card States

```
Default:   Opacity: 1.0, Shadow: 2dp
Hovered:   Shadow: 8dp, Scale: 1.02
Pressed:   Opacity: 0.95, Scale: 0.98
Selected:  Border: 2px #FF6B6B
Disabled:  Opacity: 0.5, Desaturate
```

### Input States

```
Default:   Border: 1px #E8E8E8, BG: #F5F5F5
Focused:   Border: 2px #FF6B6B, BG: White
Filled:    Text: #2C3E50
Error:     Border: 2px #E74C3C, BG: #FADBD8
Disabled:  BG: #ECEFF1, Text: #95A5A6
```

---

## Animations & Transitions

### Timing Functions

```
Quick:      150ms - Buttons, hover effects
Normal:     300ms - Screen transitions, card flips
Slow:       500ms - Major animations
Swipe:      400ms - Card swipe animations
```

### Easing Curves

```
easeInOut:  Standard transitions
easeOut:    Swipe interactions
easeIn:     Disappearing elements
linear:     Loading spinners
```

### Motion Examples

```
Card Swipe:           easeOut, 400ms
Button Press:         easeInOut, 150ms
Screen Fade:          easeInOut, 300ms
Page Transition:      easeInOut, 300ms
Shimmer Loading:      linear, 1000ms (infinite)
Snackbar Appear:      easeOut, 300ms
Snackbar Disappear:   easeIn, 300ms
```

---

## Elevation & Shadows

### Material Design Shadows

```
Elevation 0:   No shadow
Elevation 1:   Subtle, thin shadow (cards)
Elevation 2:   Default card shadow
Elevation 4:   Floating action buttons
Elevation 8:   Hovered cards, expanded elements
```

---

## Image Guidelines

### Profile Images

```
Aspect Ratio:  1:1 (Square)
Min Size:      400x400px
Rec Size:      600x600px
Quality:       High (85%+ quality)
Format:        JPG, PNG, WebP
Background:    Can have transparent areas
Position:      Face should be center-top
```

### Trip/Location Images

```
Aspect Ratio:  16:9 (Landscape)
Min Size:      1280x720px
Rec Size:      1920x1080px
Quality:       High (85%+ quality)
Format:        JPG, PNG, WebP
Composition:   Wide views, landscapes
```

### Icon Images

```
Aspect Ratio:  1:1 (Square)
Size:          24x24px, 32x32px, 48x48px
Format:        SVG, PNG (with transparency)
Color:         Match theme colors
Padding:       2-4px around icon
```

---

## Accessibility Guidelines

### Color Contrast

```
AA Standard:   Ratio of 4.5:1 minimum
AAA Standard:  Ratio of 7:1 recommended

Examples:
✅ White (#FFFFFF) on Red (#FF6B6B):    4.9:1 (AA)
✅ Dark Text on Light BG:                10:1+ (AAA)
❌ Light Gray on White:                  2.1:1 (FAIL)
```

### Touch Targets

```
Minimum Size:  48x48dp
Button Height: 48px minimum
Icon Buttons:  56px (with padding)
Spacing:       8px between interactive elements
```

### Text Sizing

```
Minimum:       12sp (captions only)
Body Text:     14sp or larger
Headings:      18sp or larger
Important:     Larger, bolder fonts
```

---

## Usage Examples

### Home Screen Header
```
"Ready for an Adventure?" 
- Font: Playfair Display, 32px Bold
- Color: #2C3E50
- Padding: MD (16px) bottom
- Alignment: Left
```

### Section Title
```
"Featured Trips"
- Font: Poppins, 18px Bold
- Color: #2C3E50
- Padding: LG (24px) top, MD (16px) bottom
- Alignment: Left
```

### Button
```
[Edit Profile]
- Font: Poppins, 16px Bold
- Color: White on #FF6B6B
- Padding: MD (16px) horizontal, SM (8px) vertical
- Radius: Medium (12px)
- Height: 48px
```

### Rating Display
```
⭐ 4.8 (23 reviews)
- Icon: 16px, #FFB800
- Text: Poppins, 12px Bold
- Color: #2C3E50
```

---

## Dark Mode (Future Implementation)

### Dark Colors
```
Background:    #1A1A2E (Very dark blue)
Card BG:       #2D2D3D (Dark blue-gray)
Text:          #FFFFFF (White)
Secondary:     #B0B0C0 (Light gray)
Borders:       #3D3D4D (Dark gray)
```

---

## Responsive Design

### Breakpoints

```
Mobile:        < 600dp width
Tablet:        600-1024dp width
Desktop:       > 1024dp width
```

### Layout Changes

```
Mobile:  Full width minus padding
Tablet:  50% width or multi-column
Desktop: Constrained width (1200px)
```

---

## Pattern Library

### Common Patterns

#### 1. Image + Content Card
```
[Image]
[Gradient Overlay]
[Content Text]
[Rating Badge - Top Right]
```

#### 2. List Item
```
[Icon/Avatar] [Title + Subtitle] [Badge/Value]
[Optional Description]
```

#### 3. Header + Content
```
[Title]
[Subtitle/Description]
─────────────────
[Content Area]
```

#### 4. Action Buttons
```
[Primary CTA Button]
[Secondary CTA Button]
```

---

## Final Design Philosophy

### Core Principles

1. **Consistency** - Same patterns, colors, spacing everywhere
2. **Clarity** - Clear hierarchy, obvious interactions
3. **Efficiency** - Minimal taps to complete tasks
4. **Delight** - Smooth animations, surprising interactions
5. **Accessibility** - Works for all users, all abilities

### Brand Personality

- **Friendly**: Approachable, welcoming, inclusive
- **Modern**: Latest design trends, clean aesthetic
- **Trustworthy**: Professional, secure, reliable
- **Adventurous**: Bold colors, exciting visuals
- **Community-focused**: Together, stronger message

---

**This design system ensures a cohesive, professional, and delightful user experience across your Travel Tinder app!** 🎨

