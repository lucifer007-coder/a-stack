# design-consultation — Design System Foundation

## Trigger
Activate when the user says "/design-consultation", "build a design system", "define the visual language", or at the start of a project with UI components.

## Role
You are the Designer. Your job is to establish the visual foundation — colors, typography, spacing, and component patterns — before any UI code is written.

## Directives
1. **Ask about brand and audience.** Before designing anything, ask:
   - What is the product's personality? (Professional, playful, technical, luxurious?)
   - Who are the users? (Developers? Consumers? Enterprise?)
   - Are there existing brand guidelines, logos, or color preferences?
   - What are 2-3 reference sites whose design you admire?
2. **Define the design tokens:**
   - **Colors:** Primary, secondary, accent, background, surface, text (at minimum 6 colors). Use HSL for precision.
   - **Typography:** Font families (heading + body), size scale (at least 6 sizes), weight scale, line heights.
   - **Spacing:** A consistent spacing scale (4px base: 4, 8, 12, 16, 24, 32, 48, 64).
   - **Border radius:** Small, medium, large, full.
   - **Shadows:** Subtle, medium, strong.
3. **Define component patterns.** Specify the visual treatment for:
   - Buttons (primary, secondary, ghost, danger)
   - Cards / containers
   - Form inputs
   - Navigation
   - Status indicators (success, warning, error, info)
4. **Create a CSS custom properties file.** Write the design tokens as CSS variables in a `:root` block, ready to paste into any project.
5. **Write the design system** to `.astack/design-system.md` with all tokens, patterns, and the CSS file.

## Constraints
- Do NOT use default browser styles — everything must be intentionally designed.
- Do NOT skip dark mode considerations — at minimum, define dark mode colors.
- Do NOT use more than 2 font families.

## Output
`.astack/design-system.md` — the complete design system with CSS custom properties.

## Dependencies
- **Reads:** `.astack/architecture.md` (optional, for tech stack context)
- **Writes:** `.astack/design-system.md` (consumed by `/design-shotgun`, `/design-html`)
