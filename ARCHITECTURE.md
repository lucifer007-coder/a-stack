# a-stack Architecture

## Overview

a-stack is a collection of SKILL.md files — each defining a single slash command with a specific trigger, role, set of directives, and output format. Skills are organized under `.agents/skills/`, with each skill in its own directory.

```
.agents/skills/
├── office-hours/SKILL.md     # CEO: Strategy
├── plan-eng-review/SKILL.md  # Architect: Technical review
├── qa/SKILL.md               # QA Lead: Testing
├── ship/SKILL.md             # SRE: Release
└── ...                       # 29 skills total
```

## Skill Discovery

Antigravity discovers skills by scanning `.agents/skills/*/SKILL.md` in the project root. Each `SKILL.md` file is a self-contained agent directive.

**Global install:** Skills are symlinked to Antigravity's global config path (typically `~/.config/antigravity/skills/` or the platform-specific equivalent). This makes skills available in every project.

**Local install:** Skills live directly in the project's `.agents/skills/` directory. This is preferred for team mode — skills are committed to the repo and shared automatically.

## SKILL.md Format

Every skill follows this structure:

```markdown
# Skill Name — Brief Description

## Trigger
Activate when the user says "/command", "keyword", or [contextual trigger].

## Role
You are the [Role Name]. Your job is to [specific goal].

## Directives
1. [Specific step with clear success criteria]
2. [Next step — depends on step 1's output]
3. [Continue until done]

## Tooling
- [Tool 1]: Used for [purpose]
- [Tool 2]: Used for [purpose]

## Output
[Exact file path and format of the output, e.g., `.astack/qa-report.md`]
```

**Rules for writing directives:**
- Use numbered steps, not bullet points.
- Each step must have a clear pass/fail condition.
- Include "do NOT" rules to prevent common mistakes.
- Reference specific file paths (`.astack/strategy.md`, not "a strategy file").

## State Management

All inter-agent state is stored in the `.astack/` directory:

| File | Written by | Read by |
|------|-----------|---------|
| `.astack/strategy.md` | `/office-hours` | `/plan-ceo-review`, `/autoplan` |
| `.astack/plan.md` | `/autoplan` | `/plan-eng-review`, all build tasks |
| `.astack/architecture.md` | `/plan-eng-review` | `/review`, `/design-consultation` |
| `.astack/design-system.md` | `/design-consultation` | `/design-shotgun`, `/design-html` |
| `.astack/design-variants.md` | `/design-shotgun` | `/design-html` |
| `.astack/qa-report.md` | `/qa`, `/qa-only` | `/ship` |
| `.astack/security-audit.md` | `/cso` | `/ship` |
| `.astack/review-report.md` | `/review` | `/ship` |
| `.astack/deploy-status.md` | `/ship`, `/land-and-deploy` | `/canary` |
| `.astack/benchmark-report.md` | `/benchmark` | `/ship`, `/canary` |
| `.astack/memory.md` | `/learn` | All agents |
| `.astack/freeze.lock` | `/freeze` | All agents |

**Rules:**
- `.astack/` is gitignored (session-specific state).
- Files use Markdown for human readability.
- Each file has a clear owner (the skill that writes it).
- Multiple skills may read the same file, but only one skill writes to it.

## Context Chaining

The Sprint Flow is implemented through file-based context chaining:

```
┌──────────────┐   writes    ┌──────────────────────┐
│ /office-hours├────────────►│ .astack/strategy.md  │
└──────────────┘             └──────────┬───────────┘
                                        │ reads
                             ┌──────────▼───────────┐
                             │    /autoplan          │
                             └──────────┬───────────┘
                                        │ writes
                             ┌──────────▼───────────┐
                             │  .astack/plan.md     │
                             └──────────┬───────────┘
                                        │ reads
                             ┌──────────▼───────────┐
                             │ /plan-eng-review     │
                             └──────────┬───────────┘
                                        │ writes
                             ┌──────────▼───────────┐
                             │ .astack/architecture │
                             └──────────┬───────────┘
                                        │ reads
                             ┌──────────▼───────────┐
                             │    /review           │
                             └──────────────────────┘
```

## Scripts

Helper scripts in `scripts/` provide a language-agnostic interface:

- `test-runner.sh` — Auto-detects project type (Node, Python, Go, Rust, Java) and runs the appropriate test suite.
- `lint.sh` — Auto-detects and runs the project's linter.
- `deploy-check.sh` — Pre-deployment health checks.

Scripts are invoked by skills, not run directly by users. This keeps SKILL.md files clean and scripts independently testable.

## Safety Architecture

Three safety skills form a layered defense:

1. **`/careful`** — Requires user confirmation before ANY destructive action (file deletion, force push, production deploy).
2. **`/freeze`** — Restricts all file edits to a single directory. Writes a lock file at `.astack/freeze.lock` containing the allowed path. All other skills check this lock before writing.
3. **`/guard`** — Activates both `/careful` and `/freeze` simultaneously. The strictest mode.

These are not suggestions. When active, they override all other skill directives.
