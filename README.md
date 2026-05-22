# a-stack

**An opinionated, open-source multi-agent team for Google Antigravity.**

AI coding without structure is chaos. A blank prompt gives you inconsistent results, architectural drift, and code that works today but breaks tomorrow. `a-stack` fixes this.

Inspired by [gstack](https://github.com/garrytan/gstack) (95k+ ★) — Garry Tan's agent team for Claude Code — `a-stack` adapts the same opinionated philosophy for the **Antigravity** runtime. Six specialist agents, 30+ slash commands, all Markdown, all free.

> **Who this is for:**
> - Founders and CEOs who still want to ship
> - First-time Antigravity users — structured roles instead of a blank prompt
> - Tech leads — rigorous review, QA, and release automation on every PR
>
> **Project Size Fit:**
> - **Lightweight:** For simple scripts or quick fixes, use a-stack's standalone commands directly (like `/review` or `/devex-review`).
> - **Full Sprint:** For production features and complex codebases, follow the full multi-agent **Sprint Flow** starting with `/office-hours` to prevent architectural drift.

---

## Quick Start

1. **Install a-stack** (30 seconds — see below)
2. Run `/office-hours` — describe what you're building
3. Run `/plan-ceo-review` on any feature idea
4. Run `/review` on any branch with changes
5. Run `/qa` on your staging URL
6. Stop there. You'll know if this is for you.

---

## Install — 30 Seconds

### Requirements

- [Google Antigravity](https://cloud.google.com/antigravity) installed and configured
- [Git](https://git-scm.com/)
- Bash shell (macOS/Linux/WSL)

### Step 1: Install on your machine

```bash
curl -fsSL https://raw.githubusercontent.com/lucifer007-coder/a-stack/main/install.sh | bash
```

Or clone manually:

```bash
git clone --single-branch --depth 1 https://github.com/lucifer007-coder/a-stack.git ~/.astack
cd ~/.astack && ./setup
```

### Step 2: Team mode (recommended)

From inside your repo, bootstrap so teammates get a-stack automatically:

```bash
~/.astack/setup --team
git add .agents/ AGENTS.md && git commit -m "require a-stack for AI-assisted work"
```

No vendored files in your repo. Every Antigravity session picks up skills from `.agents/skills/`.

---

## The Agents

| Agent | Role | Key Commands |
|-------|------|-------------|
| 🧠 **Strategist** (CEO) | Validates "why" before code is touched | `/office-hours` `/plan-ceo-review` `/autoplan` |
| 🏗️ **Architect** (Eng Manager) | Locks architecture, reviews code | `/plan-eng-review` `/review` `/codex` |
| 🎨 **Designer** | Generates stunning UI, catches AI slop | `/design-shotgun` `/design-html` `/design-review` |
| 🧪 **QA Lead** | Finds bugs in real browsers, security audits | `/qa` `/cso` `/careful` `/freeze` |
| 🚀 **SRE** (Release Manager) | Owns the ship-to-verify pipeline | `/ship` `/land-and-deploy` `/canary` |
| 📚 **Doc Engineer** | Maintains knowledge and history | `/retro` `/learn` `/document-release` |

---

## The Sprint Flow

Each skill feeds into the next — outputs become inputs. Nothing falls through the cracks.

```
Think → Plan → Architect → Design → Build → Review → Test → Ship → Reflect
  │        │        │          │                │        │       │        │
  └ /office-hours   │          │                │        │       │        │
           └ /autoplan         │                │        │       │        │
                    └ /plan-eng-review          │        │       │        │
                               └ /design-shotgun│        │       │        │
                                        (implement)     │       │        │
                                                └ /review│       │        │
                                                         └ /qa   │        │
                                                              └ /ship     │
                                                                    └ /retro
```

---

## 🎬 Live Demonstration

Here is how a real development session flows step-by-step through the **a-stack** multi-agent pipeline in Google Antigravity.

### Step 1: Strategy Scoping with `/office-hours`
The **Strategist (CEO)** challenges your ideas before any code is written to ensure you are building the right thing.

> **User:** `/office-hours I want to build a user-facing analytics dashboard for a-stack usage metrics.`
>
> **🧠 Strategist (CEO):**
> Let's scope this out. I'm going to ask you **6 Forcing Questions** one-by-one to lock down the "why" and "what".
>
> **Question 1:** What specific problem are we solving? (Not "improve metrics" — what is broken or missing today?)
>
> **User:** Developers have no visibility into how often their agents call individual skills, what the pass/fail rate is, or where the latency bottleneck lies. They are flying blind.
>
> **🧠 Strategist (CEO):**
> Got it. That is a real pain point. Let's fast-forward: I've validated all 6 answers and compiled our strategy.
>
> *Writing Strategy Vision to `.astack/strategy.md`...* Done.
> Here is a summary of the scoped MVP:
> - **In-Scope:** Simple CLI dashboard displaying total runs, success/failure rate, and top 3 slowest skills.
> - **Out-of-Scope:** Real-time database integration (we'll parse local `.astack/*.md` files instead), external Web UI.
> - **Success Metric:** Under 2 seconds loading speed for the CLI report.

---

### Step 2: Planning with `/autoplan`
The **Conductor** reads your strategy and builds a phased implementation plan.

> **User:** `/autoplan`
>
> **🧠 Conductor:**
> *Reading `.astack/strategy.md`...* Verified.
> I have designed a 2-phase Master Implementation Plan:
>
> *Writing master plan to `.astack/plan.md`...* Done.
>
> **Phase 1: CLI State Parser (Est: 4 hours)**
> 1. Implement parser to extract stats from `.astack/qa-report.md` and `.astack/review-report.md`.
> 2. Add validation for empty or malformed reports.
>
> **Phase 2: CLI Dashboard Output (Est: 3 hours)**
> 3. Create tabular terminal UI to render metrics beautifully using Vanilla CSS/Colors.
> 4. Ensure runtime benchmark measures load speed (<2s).
>
> *Note: Task 3 involves terminal UI. Suggest running `/design-consultation` before starting.*

---

### Step 3: Architecture Audit with `/plan-eng-review`
The **Architect (Eng Manager)** locks down the tech stack and code boundaries before code is written.

> **User:** `/plan-eng-review`
>
> **🏗️ Architect (EM):**
> *Reading `.astack/plan.md`...* Verified.
> I've locked down the architecture for Phase 1.
> - **File Structure:** We will add `scripts/analytics.sh` and a parser utility under `scripts/utils.sh`.
> - **Security Check:** `/cso` ran STRIDE analysis on the local parser to ensure it does not execute unauthorized state files.
>
> *Writing architecture schema to `.astack/architecture.md`...* Done. You are clear to implement Phase 1.

---

### Step 4: Quality & PR Audits with `/review`
Once the code is written, the **Architect** performs a thorough code quality audit.

> **User:** `/review`
>
> **🏗️ Architect (EM):**
> *Running `git diff --name-only`...* Found changes in `scripts/analytics.sh`.
> - **Logic check:** Parser correctly handles missing files without crashing.
> - **Test check:** Added 3 unit tests covering empty report states.
>
> **Verdict: 9/10 (PASS)**
> *Writing review details to `.astack/review-report.md`...* Done. Ready for QA!

---

### Step 5: Preparing the Release with `/ship`
The **SRE (Release Manager)** takes over, running automated tests, generating the changelog, and preparing the version bump.

> **User:** `/ship`
>
> **🚀 SRE (Release Manager):**
> *Reading `.astack/review-report.md` and `.astack/qa-report.md`...* All verified (QA PASS, Review 9/10).
> - Running test suite via `./scripts/test-runner.sh`... **Passed.**
> - Running linter via `./scripts/lint.sh`... **No issues.**
> - Bumping version: `v1.0.0` ➔ `v1.0.1` (patch bump).
> - Updating `CHANGELOG.md` with new features and fixes.
> - Creating release commit: `release: v1.0.1`... Done.
>
> *Writing deploy status to `.astack/deploy-status.md`...* Done. Ready to deploy!

---

### Step 6: Capturing Insights with `/retro`
Finally, the **Doc Engineer** records the sprint retro so the team's shared memory gets smarter.

> **User:** `/retro`
>
> **📚 Doc Engineer:**
> Let's record the learnings from this sprint.
>
> *Writing retrospective insights to `.astack/memory.md`...* Done.
> **Key Lessons Learned:**
> - Parsing `.astack/*.md` using native `grep/sed` is much faster than running a heavy JS parser script, maintaining our load speed well below the 2s target.
> - Capturing empty state edge cases in Phase 1 prevented a potential UI crash in the dashboard.

---

## Full Slash Command Map

### 🧠 Strategist (CEO)
| Command | Description |
|---------|-------------|
| `/office-hours` | 6 forcing questions before code is written |
| `/plan-ceo-review` | Challenge every decision before coding |
| `/plan-tune` | Refine and pressure-test an existing plan |
| `/autoplan` | Full pipeline: CEO → Design → Eng review |

### 🏗️ Architect (Eng Manager)
| Command | Description |
|---------|-------------|
| `/plan-eng-review` | Lock architecture before any file is touched |
| `/review` | Full code review on every changed file |
| `/codex` | Generate a project knowledge codex |
| `/devex-review` | Audit the developer workflow for friction |
| `/investigate` | Root-cause debugging: no fix without cause |

### 🎨 Designer
| Command | Description |
|---------|-------------|
| `/design-consultation` | Build a design system from scratch |
| `/design-shotgun` | Generate 4–6 variants, pick the winner |
| `/design-html` | Ship production HTML from a mockup |
| `/design-review` | Critique against brand + UX standards |
| `/plan-design-review` | Rate design 0–10, then edit plan to 10 |

### 🧪 QA Lead
| Command | Description |
|---------|-------------|
| `/qa` | Full regression suite in a real browser |
| `/qa-only` | Run tests without the build step |
| `/cso` | Security audit: OWASP + STRIDE |
| `/careful` | Confirm before every destructive action |
| `/guard` | `/careful` + `/freeze` combined |
| `/freeze` | Lock edits to one directory |

### 🚀 SRE (Release Manager)
| Command | Description |
|---------|-------------|
| `/ship` | Create the PR with full coverage audit |
| `/land-and-deploy` | Merge, deploy, verify production health |
| `/canary` | Staged rollout with auto-rollback |
| `/benchmark` | Performance baselines before + after |
| `/setup-deploy` | Wire up the deployment pipeline |

### 📚 Doc Engineer
| Command | Description |
|---------|-------------|
| `/document-release` | Changelog + release notes post-sprint |
| `/retro` | Weekly retrospective while context is fresh |
| `/learn` | Manage persistent codebase memory |
| `/health` | Check system health across the full stack |

---

## Repository Structure

```
a-stack/
├── .agents/skills/          # Antigravity skill definitions (one dir per command)
│   ├── office-hours/SKILL.md
│   ├── plan-ceo-review/SKILL.md
│   ├── review/SKILL.md
│   ├── qa/SKILL.md
│   ├── ship/SKILL.md
│   └── ... (29 skills total)
├── scripts/                 # Shared helper scripts
│   ├── test-runner.sh
│   ├── lint.sh
│   └── deploy-check.sh
├── docs/
│   ├── skills.md            # Deep dive on each skill
│   ├── ADDING_A_HOST.md     # How to add a new agent host
│   └── CONTRIBUTING.md      # How to contribute
├── AGENTS.md                # Root configuration (≈ gstack's CLAUDE.md)
├── ARCHITECTURE.md          # Technical architecture
├── ETHOS.md                 # Philosophy — why opinionated agents win
├── SKILL.md.tmpl            # Template for new skills
├── CHANGELOG.md
├── VERSION
├── install.sh               # One-line installer
├── setup                    # Main setup script
├── .gitignore
├── LICENSE                  # MIT
└── README.md
```

---

## Philosophy

Read [ETHOS.md](ETHOS.md) for the full manifesto. The short version:

1. **Strategy first.** No code until the "why" is clear.
2. **Steps, not goals.** "Run lint, then tests, then commit" — not "make sure it works."
3. **Every skill feeds the next.** `/office-hours` writes strategy → `/autoplan` reads it.
4. **Knowledge compounds.** Every session leaves the codebase smarter via `/learn`.

---

## Contributing

See [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md). The quick version:

1. Copy `SKILL.md.tmpl` into a new directory under `.agents/skills/<your-skill>/`
2. Write specific triggers, an opinionated role, and step-by-step directives
3. Test it by running the trigger phrases in Antigravity
4. Submit a PR

---

## License

MIT — free forever, fork it, improve it, make it yours.

---

<p align="center">
  <strong>a-stack</strong> · Open-source agent team for Google Antigravity<br>
  Inspired by <a href="https://github.com/garrytan/gstack">garrytan/gstack</a>
</p>