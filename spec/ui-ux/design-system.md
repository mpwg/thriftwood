# UI/UX Design System Specification

## Design Philosophy

The Thitftwood application follows a dark-first design approach optimized for media consumption environments and extended usage periods. The design system emphasizes:

- **Dark Theme Priority**: Designed primarily for low-light environments
- **AMOLED Optimization**: Pure black themes for OLED displays and battery efficiency
- **Accessibility Focus**: High contrast ratios and screen reader compatibility
- **Platform Consistency**: Native feel across mobile, desktop, and web platforms
- **Information Density**: Efficient use of screen space for media-rich content

## Color System

### Primary Color Palette

#### Accent Color
- **Primary Accent**: `#4ECCA3` (Mint Green)
  - Used for: Interactive elements, CTAs, progress indicators, active states
  - Accessibility: Meets WCAG AA contrast requirements against dark backgrounds
  - Usage: Primary buttons, links, selection highlights, focus indicators

#### Background Colors
- **Primary Background**: `#32323E` (Dark Charcoal)
  - Usage: Main application background, content areas
- **Secondary Background**: `#282834` (Darker Gray)  
  - Usage: App bars, navigation bars, card backgrounds
- **Pure Black**: `#000000` (AMOLED Mode)
  - Usage: AMOLED theme for battery optimization on OLED displays

#### Extended Palette
- **Blue**: `#00A8E8` - Information, links, secondary CTAs
- **Blue Grey**: `#848FA5` - Disabled states, placeholder text
- **Grey**: `#BBBBBB` - Secondary text, inactive elements
- **Orange**: `#FF9000` - Warnings, pending states
- **Purple**: `#9649CB` - Special categories, premium features
- **Red**: `#F71735` - Errors, destructive actions, critical alerts
- **White Variants**:
  - `#FFFFFF` - Primary text, high emphasis content
  - `#B3FFFFFF` (70% opacity) - Secondary text, medium emphasis
  - `#1AFFFFFF` (10% opacity) - Borders in AMOLED theme

### Color Usage Guidelines

#### Text Colors
```css
--text-primary: #FFFFFF        /* High emphasis text */
--text-secondary: #BBBBBB      /* Medium emphasis text */
--text-accent: #4ECCA3         /* Interactive text */
--text-error: #F71735          /* Error messages */
--text-warning: #FF9000        /* Warning messages */
--text-success: #4ECCA3        /* Success messages */
--text-disabled: #848FA5       /* Disabled elements */
```

#### Background Colors
```css
--bg-primary: #32323E          /* Main background */
--bg-secondary: #282834        /* Card/container background */
--bg-tertiary: #000000         /* AMOLED background */
--bg-accent: #4ECCA3           /* Accent backgrounds */
--bg-error: #F71735            /* Error backgrounds */
--bg-warning: #FF9000          /* Warning backgrounds */
```

#### Interactive States
```css
--interactive-default: #4ECCA3     /* Default interactive */
--interactive-hover: #5BFFB3       /* Hover state */
--interactive-active: #3DB892      /* Active/pressed state */
--interactive-disabled: #848FA5    /* Disabled interactive */
```

## Typography System

### Font Hierarchy

#### Font Sizes
```css
--font-size-h1: 18px    /* App bar titles, major headings */
--font-size-h2: 16px    /* Section headers, block titles */
--font-size-h3: 14px    /* Body text, button labels */
--font-size-h4: 12px    /* Dialog buttons, small labels */
--font-size-h5: 10px    /* Micro text, graph legends */
```

#### Font Weights
```css
--font-weight-bold: 600     /* Emphasis, titles, active states */
--font-weight-regular: 400  /* Body text, normal content */
```

#### Line Heights
```css
--line-height-tight: 1.2    /* Headings, compact text */
--line-height-normal: 1.4   /* Body text */
--line-height-relaxed: 1.6  /* Long-form content */
```

### Typography Usage

#### Heading Styles
- **H1**: App bar titles, dialog headers, primary page titles
- **H2**: Section headers, card titles, navigation labels
- **H3**: Body text, button labels, form inputs
- **H4**: Dialog buttons, secondary labels, metadata
- **H5**: Timestamps, graph legends, tertiary information

#### Text Color Application
- Primary text (`#FFFFFF`): Main content, headings, labels
- Secondary text (`#BBBBBB`): Descriptions, metadata, inactive text
- Accent text (`#4ECCA3`): Interactive elements, links, active states

## Spacing System

### Base Spacing Unit
```css
--spacing-unit: 12px        /* Primary spacing module */
--spacing-half: 6px         /* Half unit for tight spacing */
--spacing-double: 24px      /* Double unit for loose spacing */
```

### Spacing Scale
```css
--spacing-xs: 4px           /* Micro spacing */
--spacing-sm: 8px           /* Small spacing */
--spacing-base: 12px        /* Default spacing */
--spacing-lg: 16px          /* Large spacing */
--spacing-xl: 24px          /* Extra large spacing */
--spacing-xxl: 32px         /* Maximum spacing */
```

### Layout Spacing
- **Default Margin**: 12px - Standard spacing between elements
- **Horizontal Margin**: 12px left/right - Content margins
- **Vertical Margin**: 12px top/bottom - Vertical element spacing
- **Mixed Margins**: 12px horizontal, 6px vertical - Compact layouts

## Component Library

### Base Components

#### Cards (LunaCard)
**Purpose**: Container component with consistent styling and theming

**Specifications**:
- Background: Secondary background color (`#282834`)
- Border Radius: 10px for rounded corners
- Elevation: 0px (flat design approach)
- Padding: Default spacing unit (12px)
- Border: Optional 1px border in AMOLED theme (`#1AFFFFFF`)

**Usage**:
```css
.luna-card {
  background-color: var(--bg-secondary);
  border-radius: 10px;
  padding: 12px;
  border: 1px solid transparent; /* AMOLED: rgba(255,255,255,0.1) */
}
```

#### Buttons (LunaButton)
**Purpose**: Multi-variant button system with consistent interaction patterns

**Variants**:
1. **Text Buttons**: Icon + text combination
2. **Icon Buttons**: Single icon with circular touch target
3. **Loading Buttons**: Spinner integration for async operations

**Specifications**:
- Height: 46px default (minimum touch target)
- Border Radius: 10px
- Typography: H3 (14px) with bold weight for text
- Icon Size: 24px standard
- Touch Target: Minimum 44x44px for accessibility

**States**:
```css
.luna-button {
  /* Default state */
  background-color: var(--interactive-default);
  color: var(--text-primary);
}

.luna-button:hover {
  background-color: var(--interactive-hover);
}

.luna-button:active {
  background-color: var(--interactive-active);
}

.luna-button:disabled {
  background-color: var(--interactive-disabled);
  opacity: 0.5;
}
```

#### Block Components (LunaBlock)
**Purpose**: Advanced list item component for media content display

**Features**:
- **Poster Support**: Network images with placeholder icons
- **Background Images**: Fade-in background with opacity control
- **Multi-line Text**: Title and subtitle with proper text hierarchy
- **Interactive Elements**: Tap and long-press gesture support

**Layout Specifications**:
- Title Height: 20px (H2 + 4px padding)
- Subtitle Height: 18px (H3 + 4px padding)
- Poster Dimensions: Variable based on content aspect ratio
- Background Opacity: 0.1-0.3 for readability

#### Text Components (LunaText)
**Purpose**: Typography component with preset styles and theming

**Presets**:
- **Primary**: High emphasis text with primary color
- **Secondary**: Medium emphasis text with secondary color
- **Accent**: Interactive text with accent color
- **Error**: Error text with red color
- **Warning**: Warning text with orange color

### Layout Components

#### Scaffold (LunaScaffold)
**Purpose**: Enhanced scaffold with platform adaptations

**Features**:
- **Platform Detection**: iOS vs Android vs Desktop vs Web
- **App Bar Integration**: Consistent header styling
- **Body Content**: Scrollable content area with proper spacing
- **Bottom Navigation**: Integration with navigation system
- **Drawer Support**: Side navigation panel support

#### App Bar (LunaAppBar)
**Purpose**: Customizable app bar with scroll-to-top functionality

**Specifications**:
- Height: 56px (standard app bar height)
- Background: Secondary background (`#282834`)
- Typography: H1 (18px) with bold weight
- Icon Size: 24px for navigation and action icons
- Elevation: 0px (flat design)

**Features**:
- **Scroll to Top**: Tap title to scroll content to top
- **Profile Dropdown**: Multi-profile navigation support
- **Context Actions**: Dynamic action buttons based on screen
- **Back Navigation**: Platform-appropriate back button handling

#### Navigation Components

##### Bottom Navigation (LunaBottomNav)
**Purpose**: Primary navigation using tab-based interface

**Specifications**:
- Tab Height: 56px minimum
- Icon Size: 24px
- Active Color: Accent color (`#4ECCA3`)
- Inactive Color: Grey (`#BBBBBB`)
- Animation Duration: 250ms smooth transitions
- Haptic Feedback: Medium impact on selection

**Features**:
- **Scroll Integration**: Page controller for smooth transitions
- **Badge Support**: Notification badges on tabs
- **Dynamic Content**: Tab content based on enabled modules

##### Drawer Navigation (LunaDrawer)
**Purpose**: Secondary navigation for module management

**Specifications**:
- Entry Height: 56px (consistent with app bar)
- Selection Indicator: Accent color background
- Icon Size: 24px module-specific icons
- Typography: H2 (16px) for module names

**Features**:
- **Module Management**: Enable/disable modules
- **Profile Switching**: Quick profile selection
- **Alphabetical Ordering**: Consistent module organization

### Form Components

#### Text Inputs (LunaTextInput)
**Purpose**: Consistent text input styling with validation

**Specifications**:
- Height: 46px minimum for touch accessibility
- Border: Underline style with accent color on focus
- Typography: H3 (14px) for input text
- Placeholder Color: Grey (`#BBBBBB`)
- Cursor Color: Accent color (`#4ECCA3`)

**States**:
- **Default**: Underline border with secondary color
- **Focus**: Accent color underline and cursor
- **Error**: Red underline with error message
- **Disabled**: Grey styling with reduced opacity

#### Switches and Toggles (LunaSwitch)
**Purpose**: Boolean input controls with platform adaptations

**Specifications**:
- Track Color: Secondary background when off, accent when on
- Thumb Color: White for contrast
- Disabled Opacity: 0.5
- Platform Adaptation: iOS style on iOS, Material on Android

#### Dropdowns and Selections (LunaDropdown)
**Purpose**: Single and multi-select input controls

**Features**:
- **Popup Menu**: Modal selection interface
- **Search Support**: Filterable options for long lists
- **Multi-Select**: Checkbox-based multiple selection
- **Custom Rendering**: Support for complex option display

### Feedback Components

#### Loading States (LunaLoader)
**Purpose**: Progress indication for async operations

**Specifications**:
- Spinner Color: Accent color (`#4ECCA3`)
- Size Variants: Small (16px), Medium (24px), Large (32px)
- Animation: Smooth rotation with CSS animations
- Integration: Overlay support for full-screen loading

#### Progress Indicators (LunaProgress)
**Purpose**: Determinate progress display

**Types**:
- **Linear Progress**: Horizontal bar with percentage
- **Circular Progress**: Ring-based percentage display
- **Step Progress**: Multi-step process indication

#### Snackbars (LunaSnackbar)
**Purpose**: Temporary message display

**Specifications**:
- Height: Minimum 48px for accessibility
- Position: Bottom of screen with safe area respect
- Duration: 4 seconds default, customizable
- Action Button: Optional action with accent color

**Types**:
- **Success**: Accent color with checkmark icon
- **Error**: Red color with error icon
- **Warning**: Orange color with warning icon
- **Info**: Blue color with info icon

### Data Display Components

#### Lists (LunaListView)
**Purpose**: Scrollable content lists with performance optimization

**Features**:
- **Virtual Scrolling**: Performance for large datasets
- **Pull to Refresh**: Swipe-down refresh gesture
- **Infinite Scroll**: Load more content on scroll
- **Empty States**: Placeholder content when no data

#### Grid Views (LunaGridView)
**Purpose**: Grid-based content display for media

**Features**:
- **Responsive Columns**: Dynamic column count based on screen size
- **Aspect Ratio**: Maintained aspect ratios for media content
- **Staggered Layout**: Support for variable height items
- **Touch Targets**: Proper touch area sizing

#### Charts (LunaChart)
**Purpose**: Data visualization components

**Specifications**:
- Chart Height: 225px standard
- Legend Height: 26px with color indicators
- Color Scheme: Rotating palette based on data series
- Responsive: Adapts to container width

**Types**:
- **Bar Charts**: Vertical and horizontal bar displays
- **Line Charts**: Time-series data visualization
- **Pie Charts**: Percentage and ratio displays

## Responsive Design

### Breakpoint System
```css
--mobile-max: 768px         /* Mobile devices */
--tablet-min: 769px         /* Tablet devices */
--tablet-max: 1024px        /* Tablet maximum */
--desktop-min: 1025px       /* Desktop devices */
```

### Layout Adaptations

#### Mobile (320px - 768px)
- Single column layouts
- Bottom navigation tabs
- Drawer navigation for secondary menu
- Touch-optimized spacing (minimum 44px touch targets)
- Vertical scrolling emphasis

#### Tablet (769px - 1024px)  
- Multi-column layouts where appropriate
- Enhanced grid views with more columns
- Larger touch targets and spacing
- Orientation-aware layouts

#### Desktop (1025px+)
- Sidebar navigation option
- Multi-column content layouts
- Hover states for interactive elements
- Keyboard navigation support
- Context menus for advanced actions

### Platform Adaptations

#### iOS Specific
- iOS-style navigation patterns
- Swipe gestures for navigation
- iOS status bar styling
- Platform-appropriate animations
- iOS accessibility features

#### Android Specific
- Material Design patterns
- Hardware back button support
- Android status bar styling
- Navigation gesture support
- Android accessibility services

#### Web Specific
- Keyboard navigation support
- Focus management for accessibility
- Browser-specific optimizations
- URL-based routing integration
- Progressive Web App features

#### Desktop Specific
- Window management integration
- Keyboard shortcuts
- Context menu support
- Cursor state management
- Native OS integration

## Accessibility

### WCAG Compliance
- **Level AA**: Target compliance level
- **Color Contrast**: Minimum 4.5:1 for normal text, 3:1 for large text
- **Focus Indicators**: Visible focus states for all interactive elements
- **Screen Reader**: Semantic HTML and ARIA labels
- **Keyboard Navigation**: Full keyboard accessibility

### Accessibility Features
- **High Contrast Mode**: Support for system high contrast preferences
- **Reduced Motion**: Respect for reduced motion accessibility settings
- **Font Scaling**: Support for system font size preferences
- **Voice Control**: Compatibility with voice navigation systems

### Implementation Guidelines
- Use semantic HTML elements
- Provide alternative text for images
- Include ARIA labels for complex interactions
- Maintain logical tab order
- Test with screen readers
- Validate color contrast ratios

## Animation and Transitions

### Animation Principles
- **Purposeful Motion**: Animations guide user attention and provide feedback
- **Performance**: Hardware-accelerated animations using CSS transforms
- **Accessibility**: Respect reduced motion preferences
- **Consistency**: Consistent timing and easing across the application

### Timing Standards
```css
--timing-fast: 125ms        /* Quick transitions */
--timing-normal: 250ms      /* Standard transitions */
--timing-slow: 500ms        /* Slow transitions */
--timing-extra-slow: 1000ms /* Loading animations */
```

### Easing Functions
```css
--ease-out: cubic-bezier(0.4, 0.0, 0.2, 1)      /* Material ease-out */
--ease-in: cubic-bezier(0.0, 0.0, 0.2, 1)       /* Material ease-in */
--ease-in-out: cubic-bezier(0.4, 0.0, 0.6, 1)   /* Material ease-in-out */
--ease-standard: cubic-bezier(0.4, 0.0, 0.2, 1) /* Standard easing */
```

### Animation Types
- **Page Transitions**: Slide animations for navigation
- **Loading States**: Shimmer and spinner animations
- **Micro Interactions**: Button press feedback, toggle states
- **Content Changes**: Fade transitions for content updates

## Implementation Guidelines

### Component Development
1. **Consistency**: Use design system tokens for all styling
2. **Theming**: Support both midnight and AMOLED themes
3. **Accessibility**: Include proper ARIA attributes and keyboard support
4. **Performance**: Optimize for smooth animations and interactions
5. **Testing**: Test across different screen sizes and platforms

### Quality Assurance
1. **Visual Testing**: Compare implementations against design specifications
2. **Accessibility Testing**: Use screen readers and keyboard navigation
3. **Performance Testing**: Measure animation frame rates and loading times
4. **Cross-Platform Testing**: Verify consistent behavior across platforms
5. **User Testing**: Validate usability with real users

This comprehensive design system specification provides the foundation for creating consistent, accessible, and visually appealing interfaces across all platforms and technology stacks.