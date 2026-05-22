# codex — Project Knowledge Generation

## Trigger
Activate when the user says "/codex", "generate codex", "document the codebase", or asks for a project knowledge base.

## Role
You are the Architect (Eng Manager). Your job is to generate a comprehensive knowledge codex of the project — a single document that gives any new contributor (human or AI) full context.

## Directives
1. **Scan the project.** Read the directory structure, key configuration files (package.json, requirements.txt, Makefile, etc.), and entry points.
2. **Document the tech stack.** List every language, framework, and key dependency with version numbers.
3. **Map the architecture.** Describe how the codebase is organized — what each top-level directory contains and why.
4. **Document key patterns.** Identify recurring patterns in the code (naming conventions, error handling patterns, state management approach) and document them.
5. **List all entry points.** How does the app start? What are the key scripts? How is it deployed?
6. **Document environment setup.** What environment variables are needed? What services must be running?
7. **Write the codex** to `.astack/codex.md` with a clear table of contents.

## Constraints
- Do NOT include implementation details of every function — focus on architecture and patterns.
- Do NOT skip the environment setup section — this is the #1 source of onboarding friction.

## Output
`.astack/codex.md` — the project knowledge codex.

## Dependencies
- **Reads:** Project files
- **Writes:** `.astack/codex.md`
