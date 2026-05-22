# a-stack Skills Deep Dive

This document provides a detailed breakdown of how skills interact with each other in the a-stack framework. For a quick reference of commands, see [AGENTS.md](../AGENTS.md).

## The State Machine (`.astack/`)

The power of a-stack comes from context chaining. Skills don't just chat; they read and write to Markdown files in the `.astack/` directory. This creates a persistent state machine that survives across sessions and ensures agents don't drop context.

### State Files and Ownership

| State File | Writer | Readers | Purpose |
|------------|--------|---------|---------|
| `strategy.md` | `/office-hours` | `/plan-ceo-review`, `/autoplan` | The "why". Defines problem, persona, MVP scope, and success metrics. |
| `plan.md` | `/autoplan`, `/plan-tune` | `/plan-eng-review`, build tasks | The "what". Ordered tasks, estimates, and phases. |
| `architecture.md` | `/plan-eng-review` | `/review`, `/design-consultation` | The "how". File structure, data flow, edge cases, test matrix. |
| `design-system.md` | `/design-consultation` | `/design-shotgun`, `/design-html` | Visual tokens (colors, typography) and component patterns. |
| `design-variants.md` | `/design-shotgun` | `/design-html` | Scored visual options for a specific component/page. |
| `review-report.md` | `/review` | `/ship` | Code quality audit results and blockers. |
| `qa-report.md` | `/qa`, `/qa-only` | `/ship` | Bug reports, test suite results, and PASS/FAIL verdict. |
| `security-audit.md` | `/cso` | `/ship` | Vulnerability assessment (OWASP + STRIDE). |
| `deploy-status.md` | `/ship`, `/land-and-deploy` | `/canary`, `/retro` | Current release state, pipeline status, canary metrics. |
| `benchmark-report.md` | `/benchmark` | `/ship`, `/canary` | Performance baselines (before/after metrics). |
| `investigation.md` | `/investigate` | Build tasks | Root cause analysis for specific bugs. |
| `codex.md` | `/codex` | All agents | Comprehensive map of the entire codebase and its patterns. |
| `devex-report.md` | `/devex-review` | Build tasks | Audit of developer friction points. |
| `safety-log.md` | `/careful`, `/guard` | All agents | Audit trail of confirmed destructive actions. |
| `freeze.lock` | `/freeze`, `/guard` | All agents | The single directory path where file edits are allowed. |
| `release-notes.md` | `/document-release` | Users | User-facing summary of changes. |
| `memory.md` | `/learn` | All agents | Persistent, long-term project knowledge (decisions, gotchas). |

## Skill Design Patterns

If you are creating your own skills, notice the patterns used across the default roster:

1. **The Check-and-Block Pattern:**
   Many downstream skills start by checking for an upstream state file. If `/plan-eng-review` doesn't find `plan.md`, it stops and tells the user to run `/autoplan`. This enforces the workflow.

2. **The Verdict Pattern:**
   Skills like `/qa` and `/review` don't just output notes; they output a definitive `PASS`/`FAIL` or a numerical score. `/ship` specifically looks for this structured verdict before proceeding.

3. **The Lock Pattern:**
   `/freeze` is unique. It creates a `.lock` file that acts as a global constraint on all other skills. Other agents are instructed (implicitly via their host prompt, or explicitly) to respect `.lock` files.

4. **The Artifact-First Pattern:**
   Skills like `/office-hours` don't just talk to the user; they immediately construct a Markdown document. Text in a chat interface is ephemeral; text in a `.md` file is permanent and readable by other agents.

## Project Size Fit & Workflow Usage

To ensure development runs smoothly and avoids unnecessary friction:
- **For simple scripts or quick bug fixes**: You do not need to run the entire Sprint Flow. Instead, use standalone diagnostic and code quality commands directly (such as `/review` to audit changes, `/devex-review` to check development setup, or `/qa` to test).
- **For production features and large architecture components**: Follow the full **Sprint Flow** sequentially starting with `/office-hours` to ensure proper strategy alignment, engineering scoping, visual checks, regression QA, and automated releases. This prevents architectural drift as the project grows.
