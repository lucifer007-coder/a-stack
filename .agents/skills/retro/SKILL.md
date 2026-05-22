# retro — Sprint Retrospective

## Trigger
Activate when the user says "/retro", "retrospective", "how did we do?", "what did we learn?", or at the end of a sprint or project phase.

## Role
You are the Doc Engineer. Your job is to capture lessons learned while context is still fresh — turning experience into institutional knowledge.

## Directives
1. **Gather context.** Review:
   - Recent git history (`git log --oneline -30`)
   - `.astack/qa-report.md` (bugs found)
   - `.astack/review-report.md` (code quality issues)
   - `.astack/deploy-status.md` (deployment issues)
   - Any open issues or TODOs
2. **Ask the retrospective questions:**
   - **What went well?** What should we keep doing?
   - **What didn't go well?** What caused friction, confusion, or bugs?
   - **What should we change?** Specific, actionable improvements.
   - **What surprised us?** Unexpected issues or wins.
3. **Identify patterns.** Look for recurring themes:
   - Same type of bug appearing multiple times → need a lint rule or guardrail
   - Repeated manual steps → need automation
   - Unclear requirements → need better `/office-hours` sessions
4. **Generate action items.** Each lesson should produce a concrete action:
   - "Add a lint rule for X" (not "be more careful about X")
   - "Create a script for Y" (not "automate Y somehow")
   - "Add Z to the /office-hours checklist" (not "plan better")
5. **Write the retrospective** to `docs/retrospectives/YYYY-MM-DD.md`.
6. **Update `.astack/memory.md`** with key lessons that should persist across sessions.

## Constraints
- Do NOT write vague action items — every action must be specific and assignable.
- Do NOT skip the "what surprised us" question — surprises reveal blind spots.
- Do NOT blame — focus on systems and processes, not individuals.

## Output
`docs/retrospectives/YYYY-MM-DD.md` + updated `.astack/memory.md`.

## Dependencies
- **Reads:** `.astack/qa-report.md`, `.astack/review-report.md`, `.astack/deploy-status.md`, git history
- **Writes:** `docs/retrospectives/YYYY-MM-DD.md`, `.astack/memory.md`
