<p align="center">
  <img src="https://img.shields.io/badge/a--stack-v1.0.1-4ade80?style=flat-square&labelColor=0d0f14" alt="version">
  <img src="https://img.shields.io/badge/license-MIT-67e8f9?style=flat-square&labelColor=0d0f14" alt="license">
  <img src="https://img.shields.io/badge/platform-Google%20Antigravity-c084fc?style=flat-square&labelColor=0d0f14" alt="platform">
  <img src="https://img.shields.io/badge/agents-6-fbbf24?style=flat-square&labelColor=0d0f14" alt="agents">
  <img src="https://img.shields.io/badge/commands-30%2B-f87171?style=flat-square&labelColor=0d0f14" alt="commands">
  <img src="https://img.shields.io/github/stars/lucifer007-coder/a-stack?style=flat-square&labelColor=0d0f14&color=4ade80" alt="stars">
</p>

<h1 align="center">a-stack</h1>
<p align="center"><strong>An opinionated, open-source multi-agent team for Google Antigravity.</strong></p>
<p align="center">Like <a href="https://github.com/garrytan/gstack">gstack</a> for Claude Code — but built for the Antigravity runtime.</p>

---

> AI coding without structure is chaos. A blank prompt gives you inconsistent results, architectural drift, and code that works today but breaks tomorrow. **a-stack** fixes this.
>
> Six specialist agents. 30+ slash commands. All Markdown. All free.

---

## Demo

> Open [`a-stack-demo.html`](a-stack-demo.html) in your browser to see the full sprint flow animated live — then screen-record it for your own use.

---

## Who this is for

| | |
|---|---|
| 🚀 **Founders & CEOs** | Still want to ship without hiring a full eng team |
| 🆕 **First-time Antigravity users** | Structured agent roles instead of a blank prompt |
| 🔧 **Tech leads** | Rigorous review, QA, and release automation on every PR |

**Project size fit:**
- **Lightweight** — for quick fixes, use standalone commands like `/review` or `/devex-review` directly.
- **Full sprint** — for production features, run the full multi-agent Sprint Flow starting with `/office-hours`.

---

## Quick Start

```bash
# 1. install
curl -fsSL https://raw.githubusercontent.com/lucifer007-coder/a-stack/main/install.sh | bash

# 2. scope your idea
/office-hours

# 3. challenge your plan
/plan-ceo-review

# 4. review your code
/review

# 5. ship it
/ship
```

Stop there. You'll know if this is for you.

---

## Install — 30 Seconds

### Requirements

- [Google Antigravity](https://cloud.google.com/antigravity) installed and configured
- [Git](https://git-scm.com/)
- Bash shell (macOS / Linux / WSL)

### Option A — one-line installer

```bash
curl -fsSL https://raw.githubusercontent.com/lucifer007-coder/a-stack/main/install.sh | bash
```

### Option B — clone manually

```bash
git clone --single-branch --depth 1 https://github.com/lucifer007-coder/a-stack.git ~/.astack
cd ~/.astack && ./setup
```

### Team mode (recommended)

Bootstrap your repo so every teammate gets a-stack automatically:

```bash
~/.astack/setup --team
git add .agents/ AGENTS.md && git commit -m "chore: add a-stack agent team"
```

No vendored files live in your repo. Every Antigravity session picks up skills from `.agents/skills/`.

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

## 🎬 Live Walkthrough

### Step 1 — Strategy with `/office-hours`

The **Strategist (CEO)** challenges your idea before a single file is touched.

> **User:** `/office-hours I want to build a user-facing analytics dashboard for a-stack usage metrics.`
>
> **🧠 Strategist (CEO):** Let's scope this. I'll ask **6 Forcing Questions** to lock the "why" and "what".
>
> **Q1:** What is broken or missing *today*?
>
> **User:** Developers have no visibility into skill call rates, pass/fail ratios, or latency bottlenecks. They're flying blind.
>
> **🧠 Strategist (CEO):** *(fast-forward — all 6 validated)*
>
> *Writing strategy → `.astack/strategy.md`*
> - **In-scope:** CLI dashboard — total runs, success rate, top 3 slowest skills
> - **Out-of-scope:** real-time DB, external Web UI
> - **Success metric:** load time < 2 seconds

---

### Step 2 — Planning with `/autoplan`

> **User:** `/autoplan`
>
> **🧠 Conductor:** *Reading `.astack/strategy.md`… verified*
>
> **Phase 1 — CLI State Parser** *(est. 4h)*
> 1. Parse stats from `qa-report.md` + `review-report.md`
> 2. Validate empty / malformed reports
>
> **Phase 2 — CLI Dashboard Output** *(est. 3h)*
> 3. Tabular terminal UI with colour output
> 4. Runtime benchmark enforces < 2s target
>
> *Writing plan → `.astack/plan.md`*

---

### Step 3 — Architecture with `/plan-eng-review`

> **User:** `/plan-eng-review`
>
> **🏗️ Architect (EM):** *Reading `.astack/plan.md`… verified*
> - File structure: `scripts/analytics.sh` + `scripts/utils.sh`
> - Security: STRIDE analysis on local parser — passed ✓
>
> *Writing arch → `.astack/architecture.md` — clear to implement Phase 1*

---

### Step 4 — Code Review with `/review`

> **User:** `/review`
>
> **🏗️ Architect (EM):** *Running `git diff --name-only`…*
> - ✓ Handles missing files without crashing
> - ✓ 3 unit tests added for empty report states
> - ✓ Linter clean
>
> **Verdict: 9/10 PASS** — *Writing report → `.astack/review-report.md`*

---

### Step 5 — Release with `/ship`

> **User:** `/ship`
>
> **🚀 SRE (Release Manager):** *QA PASS · Review 9/10 · all gates green*
> - `./scripts/test-runner.sh` → **passed**
> - `./scripts/lint.sh` → **clean**
> - Version bump: `v1.0.0` → `v1.0.1` (patch)
> - `CHANGELOG.md` updated · release commit created
>
> *Writing status → `.astack/deploy-status.md` — ready to deploy*

---

### Step 6 — Retro with `/retro`

> **User:** `/retro`
>
> **📚 Doc Engineer:**
> - `grep/sed` parser is 3× faster than a JS script — load time well under 2s target
> - Empty-state guard in Phase 1 prevented a UI crash later
>
> *Writing memory → `.astack/memory.md`*

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
├── a-stack-demo.html        # Animated terminal demo — open in any browser
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

The fastest way to grow a-stack is to add a skill that's missing from your own workflow.

**The bar is intentionally low:**

1. Copy `SKILL.md.tmpl` into `.agents/skills/<your-skill>/SKILL.md`
2. Fill in: trigger phrases, agent role, step-by-step directives
3. Test it in Antigravity — does the agent behave consistently?
4. Open a PR with a one-line description of what the skill does

**Good first skills to add:** `/debug-trace`, `/db-migrate`, `/accessibility-audit`, `/i18n-check`

See [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md) for the full guide.

---

## License

MIT — free forever. Fork it, improve it, make it yours.

---

<p align="center">
  <strong>a-stack</strong> · Open-source agent team for Google Antigravity<br>
  Inspired by <a href="https://github.com/garrytan/gstack">garrytan/gstack</a> (95k+ ★)<br><br>
  <a href="https://github.com/lucifer007-coder/a-stack/stargazers">⭐ Star this repo if it saves you time</a>
</p>