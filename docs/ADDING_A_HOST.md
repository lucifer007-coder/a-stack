# Adding a New Host Environment

a-stack was built primarily for **Google Antigravity**, but the architecture (Markdown-based skill definitions in specific directories) can be adapted to other AI coding assistants (like Claude Code, Cursor, Aider, etc.) with minimal friction.

## Core Requirements for a Host

To support a-stack, an AI assistant or host environment must:
1. **Read Local Markdown Files:** The host must be able to read and incorporate context from `.agents/skills/*/SKILL.md`.
2. **Support System Prompts/Custom Instructions:** The host needs a mechanism to be told: "You are an agent team. Your capabilities are defined in `.agents/skills`. Your global rules are in `AGENTS.md`."
3. **Execute Tools:** The host must have the ability to run terminal commands (to execute the scripts in `scripts/`) and ideally interact with a browser (for skills like `/qa`).

## Adapting a-stack for Another Host

If you want to use a-stack with a different AI assistant, you generally only need to do two things:

### 1. Configure the Entry Point
Create the specific configuration file that your host expects.

**For Claude Code:**
Create a `.clauderc` or update `CLAUDE.md` to point to the skills directory:
```markdown
You are a-stack. Your global directives are in AGENTS.md.
Available skills are defined in `.agents/skills/*/SKILL.md`. When the user types a slash command, find the corresponding SKILL.md file, adopt that role, and follow its directives exactly.
```

**For Cursor:**
Add a `.cursorrules` file to the root of the project:
```markdown
# a-stack Configuration
Read `AGENTS.md` for global directives.
When the user types a command like `/office-hours` or `/qa`, look for the definition in `.agents/skills/<command-name>/SKILL.md` and execute the directives found there.
Always write state files to the `.astack/` directory as specified in the skills.
```

### 2. Map Tooling

Some skills (like `/qa`) explicitly mention tools like `browser_subagent` (specific to Antigravity). If your host uses different tool names, the assistant will usually figure it out from the context, but for best results, you can do a search-and-replace across the `.agents/skills` directory to match your host's specific tool names.
