# a-stack — Multi-Agent Team for Antigravity

> This file is the root configuration for a-stack. It tells Antigravity what agents
> are available and how to use them. Think of it as the equivalent of gstack's CLAUDE.md.

## Global Directives

These rules apply to ALL agents and ALL skills in this project:

1. **Read before you write.** Before any coding task, check `.astack/plan.md` and `.astack/strategy.md` for existing context. If they exist, follow them.
2. **Follow the Sprint Flow.** Think → Plan → Architect → Design → Build → Review → Test → Ship → Reflect. Do not skip steps.
3. **Atomic commits.** Every commit should be a single, testable change. Use conventional commit messages: `feat(scope): description`, `fix(scope): description`, `docs(scope): description`.
4. **Use scripts, not inline bash.** When running tests or linting, invoke `./scripts/test-runner.sh` or `./scripts/lint.sh`. Do not write throwaway inline commands.
5. **State lives in `.astack/`.** All inter-agent communication happens through files in `.astack/`. Never rely on conversation memory for cross-skill context.
6. **Ask, don't assume.** When a directive is ambiguous, ask the user for clarification rather than making a guess.
7. **Never auto-deploy to production** without explicit user approval and a passing `/qa` run.

## The Team

### Agent 01 — Strategist (CEO)
- **Focus:** Why are we building this? Is the scope right?
- **Skills:** `/office-hours`, `/plan-ceo-review`, `/plan-tune`, `/autoplan`
- **State files:** `.astack/strategy.md`, `.astack/plan.md`

### Agent 02 — Architect (Eng Manager)
- **Focus:** How should this be built? Is the architecture sound?
- **Skills:** `/plan-eng-review`, `/review`, `/codex`, `/devex-review`, `/investigate`
- **State files:** `.astack/architecture.md`, `.astack/review-report.md`

### Agent 03 — Designer
- **Focus:** Does this look and feel premium? Is the UX clear?
- **Skills:** `/design-consultation`, `/design-shotgun`, `/design-html`, `/design-review`, `/plan-design-review`
- **State files:** `.astack/design-system.md`, `.astack/design-variants.md`

### Agent 04 — QA Lead
- **Focus:** Does this actually work? Are there bugs or security issues?
- **Skills:** `/qa`, `/qa-only`, `/cso`, `/careful`, `/guard`, `/freeze`
- **State files:** `.astack/qa-report.md`, `.astack/security-audit.md`

### Agent 05 — SRE (Release Manager)
- **Focus:** Is this safe to ship? Is the pipeline healthy?
- **Skills:** `/ship`, `/land-and-deploy`, `/canary`, `/benchmark`, `/setup-deploy`
- **State files:** `.astack/deploy-status.md`, `.astack/benchmark-report.md`

### Agent 06 — Doc Engineer
- **Focus:** Is this documented? Will future-us understand this?
- **Skills:** `/document-release`, `/retro`, `/learn`, `/health`
- **State files:** `.astack/memory.md`, `CHANGELOG.md`

## Context Chaining

Skills produce outputs that downstream skills consume:

```
/office-hours  →  .astack/strategy.md    →  /plan-ceo-review
/autoplan      →  .astack/plan.md        →  /plan-eng-review
/plan-eng-review → .astack/architecture.md → /review
/qa            →  .astack/qa-report.md   →  /ship
/ship          →  CHANGELOG.md           →  /document-release
/retro         →  .astack/memory.md      →  /learn
```

## Available Skills

Use these slash commands in Antigravity:

```
/office-hours         /plan-ceo-review      /plan-tune           /autoplan
/plan-eng-review      /review               /codex               /devex-review
/investigate          /design-consultation   /design-shotgun      /design-html
/design-review        /plan-design-review    /qa                  /qa-only
/cso                  /careful               /guard               /freeze
/ship                 /land-and-deploy       /canary              /benchmark
/setup-deploy         /document-release      /retro               /learn
/health
```
