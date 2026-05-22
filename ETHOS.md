# The a-stack Ethos

## Why This Exists

AI coding without structure is chaos. A blank prompt leads to:
- Inconsistent results between sessions
- Architectural drift as the codebase grows
- Code that works today but breaks tomorrow
- No institutional memory — every session starts from zero

`a-stack` fixes this by providing opinionated agents with specific roles, specific steps, and specific outputs. Not suggestions — directives.

## First Principles

### 1. Strategy First
No code is written until the "why" is clear. `/office-hours` exists to force you to answer six hard questions before a single line is touched. Most wasted engineering comes from building the wrong thing, not building the right thing slowly.

### 2. Steps, Not Goals
Vague instructions produce vague agents. "Make sure the tests pass" is a goal. This is a directive:

```
1. Run lint via ./scripts/lint.sh.
2. If lint fails, fix the lint errors.
3. Run the test suite via ./scripts/test-runner.sh.
4. If tests fail, fix the failing test — do NOT skip it.
5. Do not proceed to git commit until all tests pass.
6. On failure after one fix attempt, stop and report.
```

Every skill in a-stack uses this level of specificity.

### 3. Every Skill Feeds the Next
`/office-hours` writes `.astack/strategy.md`. `/autoplan` reads it. `/plan-eng-review` reads the plan. `/review` checks code against the architecture. `/qa` verifies the implementation. `/ship` only runs if QA passed.

Outputs become inputs. Nothing falls through the cracks.

### 4. Knowledge Compounds
Every session should leave the codebase smarter than it found it. `/learn` captures patterns, decisions, and lessons. `/retro` captures what went well and what didn't. These files grow over time, and future sessions read them automatically.

### 5. Trust, But Verify
AI writes most of the code. That's fine. But AI also hallucinates, takes shortcuts, and produces "looks right but isn't" code. The QA Lead doesn't just run `npm test` — it opens a real browser. The Architect doesn't just approve the plan — it challenges every assumption. Trust the output, but verify it through multiple lenses.

### 6. Safety by Default
`/careful` confirms before every destructive action. `/freeze` locks edits to a single directory. `/guard` combines both. These aren't optional — they're the foundation that lets you move fast without breaking things.

## The Builder Mindset

We are not generating code. We are building systems.

A generated function works today. A built system works next year, when the team has grown, the requirements have changed, and the original context is forgotten.

`a-stack` is designed for builders who care about:
- **Craft** — every PR is reviewed, every bug gets a regression test
- **Longevity** — architecture is locked before code is written
- **Correctness** — QA runs in a real browser, not just CI
- **Memory** — lessons learned are captured and reused

## On Opinionation

gstack taught us that opinionated beats configurable. A team of twenty doesn't debate code style — they follow the style guide. `a-stack` is a style guide for AI-assisted development.

You can change any skill. Fork it, rewrite it, make it yours. But the defaults are deliberate. They represent hundreds of hours of shipping real products with AI agents. Start with the defaults. Customize only when you hit a real wall.
