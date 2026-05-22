# Contributing to a-stack

Thank you for helping improve a-stack! This document outlines the process for adding new skills or improving existing ones.

## The a-stack Philosophy

Before contributing, please read [ETHOS.md](../ETHOS.md). All skills in a-stack must adhere to these principles:
1. **Opinionated:** Skills should dictate *how* to do something, not just give vague suggestions.
2. **Step-by-step:** Use numbered lists with clear pass/fail criteria for each step.
3. **Safe by default:** Destructive actions should integrate with `/careful` or require explicit confirmation.

## Adding a New Skill

1. **Create the directory:** `mkdir .agents/skills/your-skill-name`
2. **Copy the template:** `cp SKILL.md.tmpl .agents/skills/your-skill-name/SKILL.md`
3. **Fill out the template:**
   - **Trigger:** Be specific. Include the slash command (e.g., `/your-skill-name`).
   - **Role:** Define the persona.
   - **Directives:** Write clear, sequential steps.
   - **Constraints:** List what the skill should NOT do.
   - **Dependencies:** Define what files this skill reads from and writes to.
4. **Test your skill:**
   - Run Antigravity in this repository.
   - Invoke your new skill using the trigger phrase.
   - Ensure it behaves exactly as specified in the directives.
   - Ensure it respects the constraints.

## Modifying Scripts

If you are modifying scripts in the `scripts/` directory:
- Ensure the script remains language-agnostic or supports common environments (Node, Python, Go, Rust, Java).
- Use `set -euo pipefail` at the top of bash scripts.
- Provide clear, colored output.

## Pull Request Process

1. Fork the repository and create a branch.
2. Ensure your changes follow the guidelines above.
3. Submit a Pull Request.
4. In your PR description, include an example of the skill in action (e.g., a copy-paste of a chat transcript showing it working).
